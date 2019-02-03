open Translate
open Llvm
  
module E = Env
module T = Types
module A = Absyn
module S = Symbol
module Err = Error.Error
module U = Util

type venv = E.enventry Symbol.table
type tenv = T.ty Symbol.table
type expty = {exp: Translate.exp; ty: T.ty}
type decty =  { v_env : venv; t_env: tenv }

type name_type = {name: S.symbol; ty: T.ty}

let nested_loop_level = ref 0
let change_nested_loop_level oper = nested_loop_level := oper !nested_loop_level 1
let increase_nested_Level () = change_nested_loop_level (+)
let decrease_nested_level () = change_nested_loop_level (-)
let get_nested_level () = !nested_loop_level


let trans_type ((t_env: tenv), (ty: A.ty)): T.ty =

  let look_up_type ((s: S.symbol), (p: int)): T.ty =
    match S.look(t_env, s) with
      Some t -> t
    | None -> (Err.error p ("Type " ^ S.name(s) ^ " has not been declared\n"); T.NIL) in

  let map_field_to_record (A.Field {name; typ; pos; escape = _}): S.symbol * T.ty =
    (name, look_up_type(typ, pos)) in
		    
  let check_record (fields: A.field list): T.ty =
    T.RECORD (List.map map_field_to_record fields, Temp.newtemp()) in

  let check_array_type e = T.ARRAY(look_up_type e, Temp.newtemp()) in
			 
  let trans_ty: A.ty -> T.ty = function
    | A.NameTy (s, p) -> look_up_type (s, p)
    | A.RecordTy e -> check_record e
    | A.ArrayTy (s, p) -> check_array_type (s, p)
  in
  trans_ty ty

let rec trans_dec (
            (v_env: venv),
            (t_env: tenv),
            (level: Translate.level),
            (exps: Absyn.dec list),
            break
          ): decty =
 
  let check_var_dec (
          (v_env: venv),
          (t_env: tenv),
          A.VarDec { name; typ; init; pos; escape; order }
        ) =
    let {exp = initial_value; ty = rhs_type} = trans_exp (v_env, t_env, level, init, break)
    in
    match typ with
      Some (s, p) ->
       (match S.look(t_env, s) with
	  Some lhs_type ->
           if T.eq(lhs_type, rhs_type)
	   then
             begin
	       let access = Translate.alloc_local level !order (S.name name) lhs_type in
               let new_entry = E.VarEntry{ty = lhs_type; access = access} in
	       let new_v_env = S.enter(v_env, name, new_entry) in
               
               let addr = Translate.simple_var_left access (S.name name) level in
               let value = match rhs_type with
                 | T.NIL -> Translate.nil_exp lhs_type
                 | _ -> initial_value
               in
               Translate.assign_stm addr value;
	       {
                 v_env = new_v_env;
	         t_env = t_env;
	       }
             end
	   else (
             let msg = Printf.sprintf
                         "Can't assign exp type '%s' to type '%s'"
                         (T.name(rhs_type)) (S.name(s)) in 
             Err.error p msg;
	     {v_env = v_env; t_env = t_env}
           )
	| None -> (
          let msg = Printf.sprintf
                      "Type '%s' has not been declared"
                      (S.name(s)) in
          Err.error pos msg;
	  {v_env = v_env; t_env = t_env })
       )
    | None ->
       begin
         (match rhs_type with
          | T.NIL -> Err.error pos "Can't assign Nil to non-record type variable"
          | _ -> ());
         
	 
	 let access = Translate.alloc_local level !order (S.name name) rhs_type in
         let new_entry = E.VarEntry{ty = rhs_type; access = access} in
         let addr = Translate.simple_var_left access "var_dec" level in

         Translate.assign_stm addr initial_value;
	 {
	   v_env = S.enter(v_env, name, new_entry);
	   t_env = t_env
	 }
       end
  in
		

  let check_type_dec (
          (v_env: venv),
          (t_env: tenv),
          (types: A.typeDec list)
        ) =
    let add_dump_type t_env (A.Type {name; _}) =
      S.enter(t_env, name, T.NAME(name, ref None)) in
    
    let dumb_t_env = List.fold_left add_dump_type t_env types in
    
    let f { v_env; t_env } (A.Type {name; ty; pos}) =
      {t_env = S.enter(t_env, name, trans_type(t_env, ty)); v_env = v_env }
    in

    let resolve_dummy_type { v_env; t_env } (A.Type {name; ty; pos}) =
      let actual_type = match S.look (t_env, name) with
        | Some t -> U.actual_ty t_env t
        | None ->
           Error.Error.error pos ("Type " ^S.name(name) ^ " can't be resolved!");
           T.NIL
      in
      {t_env = S.enter(t_env, name, actual_type); v_env = v_env }
    in
    U.check_circular types;
    let dummy_env = List.fold_left f {v_env = v_env; t_env = dumb_t_env } types in
    List.fold_left resolve_dummy_type dummy_env types
  in

  let check_func_dec (
          (v_env: venv),
          (t_env: tenv),
          (fs: A.fundec list)) =
    let look_type_up (s, p): T.ty =
      match S.look(t_env, s) with
	Some t -> t
      | None -> (Err.error p ("Type " ^ S.name(s) ^ "has not been declared"); T.NIL)
    in

    let get_type_for_result = function
      | Some (s, p) -> look_type_up (s, p)
      | None -> T.NIL
    in
   
    let get_type (A.Field {name; escape = _; typ; pos}): T.ty =
      look_type_up (typ, pos)
    in

    let get_name (A.Field {name}): S.symbol = name in

    let get_name_type x = {name = get_name x; ty = get_type x} in

    let check_result_type (expectType, resultType) =
      if T.eq(expectType, T.NIL) then true
      else T.eq(expectType, resultType)
    in
    
    let add_func_header acc (A.Func {name; params; result; body; pos}) =
      let f param = get_type param |> (U.actual_ty t_env) in
      let type_list = List.map f params in
      let result_type = get_type_for_result result in
      let label = Temp.newlabel in (* add label here later to avoid duplicate name*)
      Translate.add_func_header (S.name name) result_type type_list;
      S.enter(acc, name, E.FunEntry{
                             formals = type_list;
                             result = result_type;
                             label = name;
                             level = level});
    in
    
						
    let add_new_func_entry (cur_v_env: venv) (A.Func {name; params; result; body; pos}) = 
      let param_name_type = List.map get_name_type params in
      let result_type = get_type_for_result result in
      let escapes = List.map (fun (A.Field {escape}) -> !escape) params in
      let label = match S.look(cur_v_env, name) with
	| Some(E.FunEntry {label; _}) -> label
	| _ -> Temp.newlabel() in
      let func_level = Translate.new_level level in

      let body_type = ref T.NIL in

      let get_dumb_venv_to_compute_esc () =
        let f v_env {name; ty} =
          S.enter (v_env, name, E.VarEntry{ ty = ty; access = Translate.dummy_access})
        in
        List.fold_left f cur_v_env param_name_type
      in

      let add_arg_bindings ((_:: alloc_addrs): Translate.access list) =
        let f v_env {name; ty} access =
          S.enter (v_env, name, E.VarEntry{ ty = ty; access = access})
        in
        let body_venv = List.fold_left2 f cur_v_env param_name_type alloc_addrs in
        let translate_body () =
          let {exp = bodyIr; ty = result_body_type } = trans_exp(body_venv, t_env, func_level, body, break) in
          body_type := result_body_type;
          (result_body_type, bodyIr)
        in
        translate_body
      in
      
      let dumb_v_esc_venv = get_dumb_venv_to_compute_esc() in
      let esc_vars = Link.extract_esc(dumb_v_esc_venv, t_env, body) in
      let next_esc_order = 1 + List.length esc_vars in
      
      List.iter T.printTy esc_vars;
      
      let gen_arg_mappings
            (result, index)
            (A.Field {escape} as e) =
        let esc_order = if !escape then index else -1 in
        let new_index = if !escape then index + 1 else index in
        let cur_map: arg_name_type_map = {name = get_name e; ty = get_type e; esc_order = esc_order} in
        let new_result = result @ [cur_map] in
        (new_result, new_index)
      in
      let (args, _) = List.fold_left gen_arg_mappings ([], next_esc_order) params in
      Translate.func_dec
        func_level
        (S.name name)
        result_type
        esc_vars
        args
        add_arg_bindings;
      (if check_result_type(result_type, !body_type) then ()
       else 
         let msg = Printf.sprintf "return type '%s'  does not match with '%s'"
                     (T.name !body_type) (T.name result_type) in
         Err.error pos msg);
       cur_v_env
    in
    let base_env = List.fold_left add_func_header v_env fs in
    let newv_env = List.fold_left add_new_func_entry base_env fs in
    {v_env = newv_env; t_env = t_env}
  in

  let tr_dec = function
    | (v_env, t_env, (A.VarDec _ as e)) -> check_var_dec (v_env, t_env, e)
    | (v_env, t_env, A.TypeDec(e)) -> check_type_dec (v_env, t_env, e)
    | (v_env, t_env, A.FunctionDec(e)) -> check_func_dec (v_env, t_env, e)
  in
						       
  let helper = fun {v_env = v_env; t_env = t_env } dec -> tr_dec(v_env, t_env, dec) in
  let result = List.fold_left helper {v_env = v_env; t_env = t_env } exps in
  result

  and trans_var (
        (v_env: venv),
        (t_env: tenv),
        (level: Translate.level),
        (exp: Absyn.var),
        (break: Translate.break_block)
      ): expty =

    let actual_ty = U.actual_ty t_env in
    let check_simple_var ((s: S.symbol), (pos: int)): expty =
      match S.look(v_env, s) with
        Some (E.VarEntry({ty; access})) ->
         {exp = Translate.simple_var access (S.name s) level; ty = actual_ty ty}
      | Some _ ->
         Err.error pos ("Tiger does not support function closure yet!\n" ^ S.name(s) ^ "\n");
         {exp = Translate.int_exp 0; ty = T.NIL}
      | None ->
         Err.error pos ("variable '" ^ S.name(s) ^"' has not been declared\n");
	 {exp = Translate.int_exp 0; ty = T.NIL}
    in
    
    let rec check_field_var (obj, s, pos): expty =
      let { exp = recExp; ty = ty } = tr_var obj in
      let typeWithObj = actual_ty ty in
      match typeWithObj with
      | T.RECORD (tys, _) ->
	 let index = ref (-1) in
         let matchedField = List.find_opt
                              (fun (symbol, _) -> (index := !index + 1; S.eq(s, symbol))) tys
         in
         (match matchedField with
          | Some (_, ty) ->
             let actual_type = actual_ty ty in
             let raw_val = Translate.field_var_exp recExp (Translate.int_exp !index) pos in
             let casted_val = match ty with
               | T.NAME _ -> Translate.cast_generic_to_record raw_val actual_type
               | _ -> raw_val
             in
             {exp = casted_val; ty = actual_type}
          | None -> (
            let msg = Printf.sprintf "Property '%s' does not exist on type '%s'\n"
                        (S.name s) (T.name typeWithObj) in
            Err.error pos msg;
	    {exp = Translate.dummy_exp; ty = T.NIL}))
      | _ ->
         Err.error pos ("Can't access property '"
			^ S.name(s) ^ "' with type '"
			^ T.name(typeWithObj) ^ "'");
	 {exp = Translate.dummy_exp; ty = T.NIL}
           
    and check_array_var ((var: A.var), (size_exp: A.exp), (pos: int)): expty =
      let { exp = arrayExp; ty = ty } = tr_var var in
      let array_type = actual_ty ty in
      match array_type with
      | T.ARRAY (ty, _) ->
	 let  {exp = sizeIrExp; ty = size_type} = trans_exp(v_env, t_env, level, size_exp, break) in
         if T.eq(size_type, T.INT)
         then {exp = Translate.subscript_exp arrayExp sizeIrExp pos; ty = ty}
         else (
           Err.error pos "index with array is not int";
           {exp = Translate.dummy_exp; ty = T.NIL}
         )
      | _ -> (
        Err.error pos ("Can't access member with non-array type");
        {exp = Translate.dummy_exp; ty = T.NIL})

    and tr_var: A.var -> expty = function
      | A.SimpleVar (s, p) -> check_simple_var (s, p)
      | A.FieldVar (var, e, p) -> check_field_var (var, e, p)
      | A.SubscriptVar (var, e, p) -> check_array_var (var, e, p)
    in
    tr_var exp

  (* experimental *)
  and trans_var_left (
      (v_env: venv),
      (t_env: tenv),
      (level: Translate.level),
      (exp: Absyn.var),
      (break: Translate.break_block)
    ): expty =

    let actual_ty = U.actual_ty t_env in
    let check_simple_var ((s: S.symbol), (pos: int)): expty =
      match S.look(v_env, s) with
        Some (E.VarEntry({ty; access})) ->
         let abs_addr = Translate.simple_var_left access (S.name s) level in
         {exp = abs_addr ; ty = actual_ty ty}
      | Some _ ->
         Err.error pos ("Tiger does not support function closure yet!\n");
         {exp = Translate.int_exp 0; ty = T.NIL}
      | None ->
         Err.error pos ("variable '" ^ S.name(s) ^"' has not been declared\n");
	 {exp = Translate.int_exp 0; ty = T.NIL}
    in
    
    let rec check_field_var (obj, s, pos): expty =
      let { exp = rec_access; ty = ty } = tr_var obj in
      let typeWithObj = actual_ty ty in
      match typeWithObj with
      | T.RECORD (tys, _) ->
	 let index = ref (-1) in
         let matchedField = List.find_opt
                              (fun (symbol, _) -> (index := !index + 1; S.eq(s, symbol))) tys
         in
         (match matchedField with
          | Some (_, (T.NAME _ as ty)) ->
             let actual_type = actual_ty ty in
             let generic_addr = Translate.field_var_exp_left rec_access (int_exp !index) pos in
             let casted_addr = Translate.cast_generic_to_record_pointer generic_addr actual_type in
             {exp = casted_addr ; ty = ty}
            
             (*let raw_addr_val = Translate.field_var_exp rec_access (int_exp !index) in
             Translate.cast_generic_to_record raw_addr_val (actual_ty ty)
             Translate.cast_generic_to_record raw_val actual_type*)
          | Some (_, ty) ->               
             {exp = Translate.field_var_exp_left rec_access (int_exp !index) pos; ty = ty}
          | None -> (
            let msg = Printf.sprintf "Property '%s' does not exist on type '%s'\n"
                        (S.name s) (T.name typeWithObj) in
            Err.error pos msg;
	    {exp = Translate.dummy_exp; ty = T.NIL}))
      | _ ->
         Err.error pos ("Can't access property '"
			^ S.name(s) ^ "' with type '"
			^ T.name(typeWithObj) ^ "'");
	 {exp = Translate.dummy_exp; ty = T.NIL}
         
    and check_array_var ((var: A.var), (size_exp: A.exp), (pos: int)): expty =
      let { exp = array_access; ty = ty } = tr_var var in
      let array_type = actual_ty ty in
      match array_type with
      | T.ARRAY (ty, _) ->
	 let  {exp = size_exp; ty = size_type} = trans_exp(v_env, t_env, level, size_exp, break) in
         if T.eq(size_type, T.INT)
         then {exp = Translate.subscript_exp_left array_access size_exp pos; ty = ty}
         else (
           Err.error pos "index with array is not int";
           {exp = Translate.dummy_exp; ty = T.NIL}
         )
      | _ -> (
        Err.error pos ("Can't access member with non-array type");
        {exp = Translate.dummy_exp; ty = T.NIL})

    and tr_var: A.var -> expty = function
      | A.SimpleVar (s, p) -> check_simple_var (s, p)
      | A.FieldVar (var, e, p) -> check_field_var (var, e, p)
      | A.SubscriptVar (var, e, p) -> check_array_var (var, e, p)
    in
    tr_var exp

  (* experimental end *)
  and trans_exp (
       (v_env: venv),
       (t_env: tenv),
       (level: Translate.level),
       (exp: Absyn.exp),
       (break: Translate.break_block)): expty  =
    let actual_ty = U.actual_ty t_env in
    let actual_ty_exp (x: expty) = x.ty |> actual_ty in

    let rec check_type_op (A.OpExp { left; oper; right; pos }): expty =
      let left_result = tr_exp left in
      let right_result = tr_exp right in 
      let { exp = left_val; ty = left_type } = left_result in
      let { exp = right_val; ty = right_type } = right_result in

      U.assert_type_eq (actual_ty left_type, T.INT, pos, "Interger is require");
      U.assert_type_eq (actual_ty right_type, T.INT, pos, "Interger is require");
      {exp = Translate.op_exp left_val oper right_val; ty = T.INT}

    and check_func_call_exp (A.CallExp {func; args; pos}): expty =
      let check_param acc (exp, ty): Translate.exp list =
	let {exp = argIr; ty = arg_type } = tr_exp exp in
        let real_arg_type = actual_ty arg_type in
        let msg = Printf.sprintf "Mismatched types with function args.
                                  Expect: '%s'. Received: '%s'"
                    (T.name ty) (T.name real_arg_type) in
	U.assert_type_eq (ty, real_arg_type, pos, msg);
        let arg_val = match arg_type with
          | T.NIL -> Translate.nil_exp ty
          | _ -> argIr
        in
        let casted_arg_ir = match ty with
          | T.GENERIC_RECORD | T.GENERIC_ARRAY -> Translate.build_bitcast_generic T.STRING arg_val
          | _ -> arg_val
        in
        acc @ [casted_arg_ir]
      in
      match S.look(v_env, func) with
      | Some ( E.FunEntry {formals; result; label; level = dec_level} ) ->
         if (List.length args) <> (List.length formals)
         then Err.error pos
                ("Function requires "^  (args |> List.length |> string_of_int) ^ " arguments");
         let arg_formal_pairs = List.map2 (fun a b -> (a, b)) args formals in
	 let args = List.fold_left check_param [] arg_formal_pairs in
         {exp = Translate.func_call_exp dec_level level (S.name label) args; ty = result}

      | Some _ ->
         Err.error pos (S.name(func) ^ " does not have type function");
	 {exp = Translate.dummy_exp; ty = T.NIL}
      | None ->
         Err.error pos ("Function '" ^ S.name(func) ^ "' can't be found");
	 { exp = Translate.dummy_exp; ty = T.NIL}

    and check_record_exp (A.RecordExp {fields; typ; pos}) =
      let fields_with_name_types = List.map
                                     (fun (symbol, exp, pos) -> (symbol, tr_exp(exp), pos))
                                     fields in
      let field_exps = List.map
                        (fun (symbol, exp, pos) -> (symbol, actual_ty_exp exp, pos))
                        fields_with_name_types in
      
      match S.look(t_env, typ) with
	Some (T.RECORD (types, refer)) ->
	 let rec check_fields = function
           | [] -> []
	   | (s, t, p) :: tl ->
              let matched_field = List.find_opt (fun (symbol, _) -> S.eq(s, symbol)) types
              in
              (match matched_field with
               | Some(symbol, type_exp) ->
                  let msg = Printf.sprintf
                              "Mismatched types with fields property: '%s'.
                               Expect: '%s'. Received: '%s'"
                              (S.name s) (T.name type_exp) (T.name t) in
                  U.assert_type_eq (t, actual_ty(type_exp), p, msg);
                  (symbol, type_exp) :: check_fields(tl)
               | None  ->
                  Err.error pos ("Field '" ^ S.name(s) ^ "' is unknown in type " ^ S.name(typ));
                  check_fields(tl))

	     in
	     if List.length field_exps <> List.length types
	     then (Err.error pos ("RecordExp and record type '" ^ S.name(typ) ^ "' doesn't match");
		   {exp = Translate.dummy_exp(*Translate.recordDec(fieldLetsIR)*); ty = T.RECORD (types, refer)})
	     else
               let proper_nil_fields (_, t) (_, {exp; ty}, _) =
                 match ty with
                 | T.NIL -> Translate.nil_exp t
                 | _ -> exp
               in
	       let typesInCreateOrder = check_fields field_exps in
               let field_irs = List.map2 proper_nil_fields types fields_with_name_types in
	       {exp = (Translate.record_exp types field_irs) ; ty = T.RECORD (typesInCreateOrder, refer)}
			    
      | Some _ ->
         Err.error pos (S.name(typ) ^ " does not have type record");
	 {exp = Translate.dummy_exp; ty = T.RECORD ([], Temp.newtemp ())}
      | None ->
         Err.error pos ("type " ^ S.name(typ)  ^ " can't be found");
	 {exp = Translate.dummy_exp; ty = T.RECORD ([], Temp.newtemp ())}

    and check_seq_exp (exp_pos: (A.exp * int) list): expty =
      match List.length exp_pos with
	0 -> {exp = Translate.dummy_exp; ty=T.NIL}
      | _ -> 
	 let results = List.map (fun (exp, _) -> tr_exp exp) exp_pos in
         if (List.length results) = 0
         then { exp = Translate.dummy_exp; ty = T.NIL }
         else
           let result = List.nth results (List.length(results) -1) in
           result

    and check_assign_exp (A.AssignExp{var; exp; pos}): expty =
      (* check this shit *)
      let {ty = left_type; exp = addr} = trans_var_left (v_env, t_env, level, var, break) in 
      let {ty = right_type; exp = rhs_value} = tr_exp exp in 
      let msg = "Can't assign type " ^ T.name(right_type) ^ " to type " ^ T.name(left_type) in
      U.assert_type_eq (left_type, right_type, pos, msg);
      let value = match right_type with
        | T.NIL -> Translate.nil_exp left_type
        | _ -> rhs_value
      in
      { exp = (Translate.assign_stm addr value; Translate.dummy_exp); ty=T.NIL }

    and check_if_exp (A.IfExp {test = test_exp; then' = then_exp; else' = else_option; pos}): expty =
      (* This is a hack to get type because we have to thunk code gen*)
      let final_type = ref T.NIL in
      let gen_test_val () = 
        let {exp = test_val; ty = test_type} = tr_exp test_exp in
        U.assert_type_eq (actual_ty test_type, T.INT, pos,
                          "if test clause does not have type int");
        test_val
      in

      let gen_then_else (): Translate.exp * (unit -> T.ty * Translate.exp) =
        let { exp = then_val; ty = then_type} = tr_exp then_exp in
        let then_final_val = match then_type with
          | T.NIL -> Translate.dummy_exp
          | _ -> then_val
        in
        final_type := then_type;
        let gen_else_val (): T.ty * Translate.exp = match else_option with
          | None -> final_type := T.NIL; (T.INT, Translate.dummy_exp)
          | Some else_exp ->
             let { exp = else_val; ty = else_type} = tr_exp else_exp in
	     U.assert_type_eq (actual_ty then_type,
			       actual_ty else_type,
			       pos,
			       "Mismatched types between then and else");
             (else_type, else_val)
        in
        (then_final_val, gen_else_val)
      in
      let exp = Translate.if_exp gen_test_val gen_then_else in
      {exp = exp; ty = !final_type}


    and check_while_exp (A.WhileExp {test; body; pos}) =
      let _ = increase_nested_Level() in
      let translate_test (): Translate.exp = 
        let {exp = test_exp; ty = test_type} = tr_exp test in
        U.assert_type_eq (actual_ty test_type, T.INT, pos, "while test clause does not have type int");
        test_exp
      in
      let translate_body (break_block: Translate.break_block) =
        ignore(trans_exp (v_env, t_env, level, body, break_block));
        decrease_nested_level()
      in
      { exp = Translate.while_exp translate_test translate_body ; ty = T.NIL }

      
    and check_for_exp (A.ForExp {lo; hi; pos; _} as for_ast) =
      let while_ast = A.rewrite_for_exp for_ast in
      let get_type e = e |> tr_exp |> actual_ty_exp in
      let loTy = get_type lo in 
      let hiTy = get_type hi in
      let _ = U.assert_type_eq (loTy, T.INT, pos, "from-for clause does not have type int") in
      let _ = U.assert_type_eq (hiTy, T.INT, pos, "to-for clause does not have type int") in
      tr_exp while_ast
		    
    and check_let_exp (A.LetExp{decs; body; pos}) =
      let { v_env; t_env } = trans_dec(v_env, t_env, level, decs, break) in
      let { exp = body; ty } = trans_exp (v_env, t_env, level, body, break) in 
      { exp = body; ty= ty }


    and check_array_exp (A.ArrayExp {typ; size; init; pos}) =
      match S.look(t_env, typ) with
	Some (T.ARRAY(array_type, unique)) ->
         let size_result = tr_exp size in
         let {exp = init_exp; ty = init_ty} = tr_exp init in
         U.assert_type_eq (
             actual_ty_exp size_result,
             T.INT, pos,
             "Size with array must have type " ^ T.name(T.INT));
         U.assert_type_eq (
             actual_ty init_ty,
             array_type,
             pos,
             "Initialize letue with array does not have type " ^ T.name(array_type));
         let element_type = actual_ty array_type in
         let real_init_ty = actual_ty init_ty in
         let casted_init_val = match real_init_ty with
           | T.NIL -> Translate.nil_exp element_type
           | _ -> init_exp
         in
         { exp = Translate.array_exp
                   size_result.exp
                   casted_init_val
                   element_type;
           ty = T.ARRAY(array_type, unique) }
     
      | Some _ ->
         Err.error pos (S.name(typ) ^ " does not exist");
         { exp = Translate.dummy_exp ; ty = T.ARRAY(T.NIL, Temp.newtemp ())}
      | None ->
         Err.error pos ("Type " ^ S.name(typ) ^ " could not be found");
         {exp = Translate.dummy_exp ; ty = T.ARRAY(T.NIL, Temp.newtemp ())}
		
		    
    and tr_exp: A.exp -> expty  = function
      | A.VarExp(var) -> trans_var(v_env, t_env, level, var, break)
      | A.NilExp -> {exp = Translate.dummy_exp; ty = T.NIL}
      | A.IntExp e -> {exp = Translate.int_exp e; ty = T.INT}
      | A.StringExp (str, _) -> {exp = Translate.string_exp str; ty = T.STRING}
      | (A.CallExp _ as e) -> check_func_call_exp e
      | (A.OpExp _ as e) -> check_type_op e
      | (A.RecordExp _ as e) -> check_record_exp e
      | A.SeqExp e -> check_seq_exp e
      | (A.AssignExp _ as e) -> check_assign_exp e
      | (A.IfExp _ as e) -> check_if_exp e
      | (A.WhileExp _ as e) -> check_while_exp e
      | (A.ForExp _ as e) -> check_for_exp e
      | A.BreakExp pos -> (if get_nested_level() > 0 then () else Err.error pos "Break exp is not nested inside loop";
			   {exp = Translate.break_exp break; ty = T.NIL})
      | (A.LetExp _ as e) -> check_let_exp e
      | (A.ArrayExp _ as e) -> check_array_exp e
    in	    
    tr_exp exp

let trans_prog ((my_exp: A.exp), (output_name: string)) =
  let build_external_func = function
    | (_, Env.FunEntry {formals; result; label}) -> Translate.build_external_func (S.name label) formals result
    | _ -> ()
  in
  
  List.iter build_external_func Env.external_functions;
  Escape.find_escape(my_exp);
  
  let escs = Link.extract_esc (Env.base_venv, Env.base_tenv, my_exp) in
  List.iter T.printTy escs;

  let outermost_break_block = Translate.build_main_func escs in

  let main_level = Translate.new_level Translate.outermost in
  ignore(trans_exp (Env.base_venv, Env.base_tenv, main_level, my_exp, outermost_break_block)); 
  Translate.build_return_main();
  (*dump_module Translate.the_module;*)
  print_module ("llvm_byte_code/"^ output_name ^ ".ll") Translate.the_module;



