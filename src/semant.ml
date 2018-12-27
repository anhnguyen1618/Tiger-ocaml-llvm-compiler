module E = Env
module T = Types
module A = Absyn
module S = Symbol
module Err = Error.Error
module U = Util

type venv = E.enventry Symbol.table
type tenv = T.ty Symbol.table
type expty = {exp: Translate.exp; ty: T.ty}
type decty =  {v_env : venv; t_env: tenv; expList: Translate.exp list}

type arg_name_type_map = { name: S.symbol; ty: T.ty }

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
    T.RECORD (List.map map_field_to_record fields, ref ()) in

  let check_array_type e = T.ARRAY(look_up_type e, ref()) in
			 
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
          A.VarDec { name; typ; init; pos; escape },
          expList
        ) =
    let {exp = initueIrExp; ty = rhs_type} = {exp = (); ty = T.UNIT}(*transExp (v_env, t_env, level, init, break) *)
    in
    
    let create_assign_stm access =
      expList (* @ [Translate.assignStm(Translate.simpleVar(access, level), initueIrExp)] *)
    in
    match typ with
      Some (s, p) ->
       (match S.look(t_env, s) with
	  Some lhs_type ->
           if T.eq(lhs_type, rhs_type)
	   then (
	     let access = () in(*Translate.allocLocal(level)(!escape)*)
             let new_entry = E.VarEntry{ty = lhs_type; access = access} in
	     let new_v_env = S.enter(v_env, name, new_entry) in
	     {
               v_env = new_v_env;
	       t_env = t_env;
	       expList = create_assign_stm (access)
	     }
           )
	   else (
             let msg = Printf.sprintf
                         "Can't assign exp type '%s' to type '%s'"
                         (T.name(rhs_type)) (S.name(s)) in 
             Err.error p msg;
	     {v_env = v_env; t_env = t_env; expList = expList}
           )
	| None -> (
          let msg = Printf.sprintf
                      "Type '%s' has not been declared"
                      (S.name(s)) in
          Err.error pos msg;
	  {v_env = v_env; t_env = t_env; expList = expList})
       )
    | None -> ( if T.eq(rhs_type, T.NIL) (* case  var a := nil *)
		then (Err.error pos ("Can't assign Nil to non-record type variable"));		
		let access = () (*Translate.allocLocal(level)(!escape)*) in
                let new_entry = E.VarEntry{ty = rhs_type; access = access} in
		{
		  v_env = S.enter(v_env, name, new_entry);
		  t_env = t_env;
		  expList = create_assign_stm (access)
		}
	      )
  in
		

  let check_type_dec (
          (v_env: venv),
          (t_env: tenv),
          (types: A.typeDec list),
          expList
        ) =
    let add_dump_type t_env (A.Type {name; _}) =
      S.enter(t_env, name, T.NAME(name, ref None)) in
    
    let dumb_t_env = List.fold_left add_dump_type t_env types in
    
    let f { v_env; t_env; expList } (A.Type {name; ty; pos}) =
      {t_env = S.enter(t_env, name, trans_type(t_env, ty)); v_env = v_env; expList = expList}
    in
    U.check_circular types;
    List.fold_left f {v_env = v_env; t_env = dumb_t_env; expList = expList} types
  in

  let check_func_dec (
          (v_env: venv),
          (t_env: tenv),
          (fs: A.fundec list),
          expList) =
    let look_type_up (s, p): T.ty =
      match S.look(t_env, s) with
	Some t -> t
      | None -> (Err.error p ("Type " ^ S.name(s) ^ "has not been declared"); T.NIL)
    in

    let get_type_for_result = function
      | Some (s, p) -> look_type_up (s, p)
      | None -> T.UNIT
    in
   
    let get_type (A.Field {name; escape = _; typ; pos}): arg_name_type_map =
      {name = name; ty = look_type_up (typ, pos)}
    in

    let check_result_type (expectType, resultType) =
      if T.eq(expectType, T.UNIT) then true
      else T.eq(expectType, resultType)
    in
    
    let add_func_header acc (A.Func {name; params; result; body; pos}) =
      let f param = get_type param |> (fun x -> x.ty) |> (U.actual_ty t_env) in
      let type_list = List.map f params in
      let result_type = get_type_for_result result in
      let label = Temp.newlabel in
      S.enter(acc, name, E.FunEntry{
                             formals = type_list;
                             result = result_type;
                             label = name;
                             level = level})
    in
						
    let add_new_func_entry (cur_v_env: venv) (A.Func {name; params; result; body; pos}) = 
      let types: arg_name_type_map list = List.map get_type params in
      let result_type = get_type_for_result result in
      let escapes = List.map (fun (A.Field x) -> !(x.escape)) params in
      let label = match S.look(cur_v_env, name) with
	| Some(E.FunEntry {label; _}) -> label
	| _ -> Temp.newlabel() in
					       
      let func_level = Translate.outermost
      (*Translate.newLevel
        {parent = level; name = label; formals = escapes}*) in

      let param_accessed = [](*Translate.formals func_level*) in
							      
      let add_params_to_body (temp, i) ({name; ty}: arg_name_type_map) =
        let mapping = S.enter(
              temp,
              name,
	      E.VarEntry({ ty = ty; access = (List.nth param_accessed i)})) in
	( mapping, i + 1)
      in

      
      
      let startAccessIndex = 1 in (* First access is static link, first front- args is allocated at index 1*)
      let (bodyVenv, _) = List.fold_left add_params_to_body (cur_v_env, startAccessIndex) types in
      let {exp = bodyIr; ty = body_type } = (*transExp(bodyVenv, t_env, func_level, body, break) *) {exp = (); ty = T.UNIT}
      in
      (*Translate.procEntryExit {level = func_level; body = bodyIr};*)
      (if check_result_type(result_type, body_type) then ()
       else 
         let msg = Printf.sprintf "return type '%s'  does not match with '%s'"
                     (T.name body_type) (T.name result_type) in
         Err.error pos msg);
       cur_v_env
    in

    let base_env = List.fold_left add_func_header v_env fs in
    let newv_env = List.fold_left add_new_func_entry base_env fs in
    {v_env = newv_env; t_env = t_env; expList = expList}
  in

  let tr_dec = function
    | (v_env, t_env, (A.VarDec _ as e), expList) -> check_var_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.TypeDec(e), expList) -> check_type_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.FunctionDec(e), expList) -> check_func_dec (v_env, t_env, e, expList)
  in
						       
  let helper = fun {v_env = v_env; t_env = t_env; expList} dec -> tr_dec(v_env, t_env, dec, expList) in
  let result = List.fold_left helper {v_env = v_env; t_env = t_env; expList = []} exps in
  result

  and trans_var (
        (v_env: venv),
        (t_env: tenv),
        (level: Translate.level),
        (exp: Absyn.var),
        (break: Temp.label)
      ): expty =

    let actual_ty = U.actual_ty t_env in
    let check_simple_var ((s: S.symbol), (pos: int)): expty =
      match S.look(v_env, s) with
        Some (E.VarEntry({ty; access})) ->
         {exp = (*Translate.simpleVar(access, level)*) (); ty = actual_ty ty}
      | Some _ ->
         {exp = (*Translate.intExp(0)*) (); ty = T.NIL}
      | None ->
         Err.error pos ("variable '" ^ S.name(s) ^"' has not been declared\n");
	 {exp = (*Translate.intExp(0)*) (); ty = T.NIL}
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
         | Some (_, ty) -> {exp = ()(*Translate.fieldVar(recExp, !index)*); ty = ty}
         | None -> (
           let msg = Printf.sprintf "Property '%s' does not exist on type '%s'\n"
                       (S.name s) (T.name typeWithObj) in
           Err.error pos msg;
	   {exp = () (*Translate.intExp(0)*); ty = T.NIL}))
      | _ ->
         Err.error pos ("Can't access property '"
			^ S.name(s) ^ "' with type '"
			^ T.name(typeWithObj) ^ "'");
	 {exp = () (*Translate.intExp(0)*); ty = T.NIL}
           
    and check_array_var ((var: A.var), (size_exp: A.exp), (pos: int)): expty =
      let { exp = arrayExp; ty = ty } = tr_var var in
      let array_type = actual_ty ty in
      match array_type with
      | T.ARRAY (ty, _) ->
	 let  {exp = sizeIrExp; ty = size_type} = trans_exp(v_env, t_env, level, size_exp, break) in
         if T.eq(size_type, T.INT)
         then {exp = () (*Translate.subscriptVar(arrayExp, sizeIrExp)*); ty = ty}
         else (
           Err.error pos "index with array is not int";
           {exp = ()(*Translate.intExp(0)*); ty = T.NIL}
         )
      | _ -> (
        Err.error pos ("Can't access member with non-array type");
        {exp = () (*Translate.intExp(0)*); ty = T.NIL})

    and tr_var: A.var -> expty = function
      | A.SimpleVar (s, p) -> check_simple_var (s, p)
      | A.FieldVar (var, e, p) -> check_field_var (var, e, p)
      | A.SubscriptVar (var, e, p) -> check_array_var (var, e, p)
    in
    tr_var exp

  and trans_exp (
       (v_env: venv),
       (t_env: tenv),
       (level: Translate.level),
       (exp: Absyn.exp),
       (break: Temp.label)): expty  =
    let actual_ty = U.actual_ty t_env in
    let actual_ty_exp (x: expty) = x.ty |> actual_ty in

    let rec check_type_op (A.OpExp{left; oper; right; pos}): expty =
      let ( left_result, right_result ) = (tr_exp left, tr_exp right) in
      let { exp = leftIr; ty = left_type } = left_result in
      let { exp = rightIr; ty = right_type } = right_result in

      U.assert_type_eq (actual_ty left_type, T.INT, pos, "Interger is require");
      U.assert_type_eq (actual_ty right_type, T.INT, pos, "Interger is require");
      {exp = ()(*Translate.opExp(leftIr, oper, rightIr)*); ty = T.INT}

    and check_func_call_exp (A.CallExp {func; args; pos}): expty =
      let check_param acc (exp, ty): Translate.exp list =
	let {exp = argIr; ty = arg_type } = tr_exp exp in
        let real_arg_type = actual_ty arg_type in
        let msg = Printf.sprintf "Mismatched types with function args.
                                  Expect: '%s'. Received: '%s'"
                    (T.name ty) (T.name real_arg_type) in
	U.assert_type_eq (ty, real_arg_type, pos, msg);
        argIr :: acc
      in
      match S.look(v_env, func) with
      | Some ( E.FunEntry {formals; result; label; level = decLevel} ) ->
         let arg_formal_pairs = List.map2 (fun a b -> (a, b)) args formals in
	 let argIrs = List.fold_left check_param [] arg_formal_pairs in
	 {exp = (*Translate.letCallExp(decLevel, level, label, argIrs)*)(); ty = result}

      | Some _ ->
         Err.error pos (S.name(func) ^ " does not have type function");
	 {exp = (*Translate.nilExp()*)(); ty = T.UNIT}
      | None ->
         Err.error pos ("Function '" ^ S.name(func) ^ "' can't be found");
	 { exp = (*Translate.nilExp()*) (); ty = T.UNIT}

    and check_record_exp (A.RecordExp {fields; typ; pos}) =
      let fields_with_name_types = List.map
                                     (fun (symbol, exp, pos) -> (symbol, tr_exp(exp), pos))
                                     fields in
      let fieldLetsIR = List.map
                          (fun (_, { exp; _ }, _) -> exp)
                          fields_with_name_types in
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
		   {exp = (*Translate.recordDec(fieldLetsIR)*) (); ty = T.RECORD (types, refer)})
	     else
	       let typesInCreateOrder = check_fields field_exps in
	       {exp = (*Translate.recordDec(fieldLetsIR)*)(); ty = T.RECORD (typesInCreateOrder, refer)}
			    
      | Some _ ->
         Err.error pos (S.name(typ) ^ " does not have type record");
	 {exp = (*Translate.intExp(0)*)(); ty = T.RECORD ([], ref ())}
      | None ->
         Err.error pos ("type " ^ S.name(typ)  ^ " can't be found");
	 {exp = (*Translate.intExp(0)*)(); ty = T.RECORD ([], ref ())}

    and check_seq_exp (exp_pos: (A.exp * int) list): expty =
      match List.length exp_pos with
	0 -> {exp = ()(*Translate.nilExp()*); ty=T.UNIT}
      | _ -> 
	 let results = List.map (fun (exp, _) -> tr_exp exp) exp_pos in
         let irExps = List.map (fun x -> x.exp) results in
         if (List.length results) = 0
         then { exp = (); ty = T.NIL }
         else
           let typ = List.nth results (List.length(results) -1) in
	   {exp = ()(*Translate.seqExp(irExps)*); ty = typ.ty}


    and check_assign_exp (A.AssignExp{var; exp; pos}): expty =
      let {ty = left_type; exp = leftExp} = trans_var (v_env, t_env, level, var, break) in 
      let {ty = right_type; exp = rightExp} = tr_exp exp in 
      let msg = "Can't assign type " ^ T.name(right_type) ^ " to type " ^ T.name(left_type) in
      U.assert_type_eq (left_type, right_type, pos, msg);
      { exp=(*Translate.assignStm(leftExp, rightExp)*)(); ty=T.UNIT }

    and check_if_exp (A.IfExp {test = testExp; then' = thenExp; else' = elseOption; pos}): expty  =
      let {exp = testIr; ty = testTy} = tr_exp testExp in
      let {exp = thenIr; ty = thenTy} = tr_exp thenExp in
      U.assert_type_eq (actual_ty testTy, T.INT, pos,
                          "if test clause does not have type int");
      match elseOption with
      | None -> {exp = () (*Translate.ifExp(testIr, thenIr, NONE)*); ty= thenTy}
      | Some elseExp ->
	 let {exp = elseIr; ty = elseTy} = tr_exp elseExp in
	 U.assert_type_eq (actual_ty thenTy,
			   actual_ty elseTy,
			   pos,
			   "Mismatched types between then and else");
	 {exp = (*Translate.ifExp(testIr, thenIr, Some(elseIr))*)(); ty = elseTy}


    and check_while_exp (A.WhileExp{test; body; pos}) =
      let _ = increase_nested_Level() in
      let {exp = testExp; ty = testTy} = tr_exp test in
      let doneLabel = Temp.newlabel() in
      let {exp = bodyExp; ty = _} = trans_exp (v_env, t_env, level, body, doneLabel) in
      let _ = decrease_nested_level()  in
      U.assert_type_eq (actual_ty testTy, T.INT, pos, "while test clause does not have type int");		      
      { exp = () (*Translate.whileExp(testExp, bodyExp, doneLabel)*); ty = T.UNIT }

      
    and check_for_exp (e) =

      (*let whileAST = A.rewriteForExp(e)
      (* let loTy = (actual_ty_exp o tr_exp o #lo) e
		    let hiTy = (actual_ty_exp o tr_exp o #hi) e
		    let _ = checkTypeEq (loTy, T.INT, pos, "from-for clause does not have type int")
		    let _ = checkTypeEq (hiTy, T.INT, pos, "to-for clause does not have type int") *)
      in*)
    (*tr_exp whileAST*) {exp = (); ty = T.UNIT }
		    
    and check_let_exp (A.LetExp{decs; body; pos}) =

      let {v_env; t_env; expList} = trans_dec(v_env, t_env, level, decs, break) in
      let {exp = body; ty} = trans_exp (v_env, t_env, level, body, break) in 
      let newBody = () (*Translate.concatExpList(expList, body)*) in
      {exp = newBody; ty= ty}


    and check_array_exp (A.ArrayExp {typ; size; init; pos}) =
      match S.look(t_env, typ) with
	Some (T.ARRAY(array_type, unique)) ->
         let size_result = tr_exp size in
         let init_result = tr_exp init in
         U.assert_type_eq (
             actual_ty_exp size_result,
             T.INT, pos,
             "Size with array must have type " ^ T.name(T.INT));
         U.assert_type_eq (
             actual_ty_exp init_result,
             array_type,
             pos,
             "Initialize letue with array does not have type " ^ T.name(array_type));
         {exp = ()(*Translate.arrayDec(sizeResult.exp, initResult.exp)*); ty = T.ARRAY(array_type, unique)}
     
      | Some _ ->
         Err.error pos (S.name(typ) ^ " does not exist");
         { exp = ()(*Translate.unitExp()*); ty = T.ARRAY(T.NIL, ref ())}
      | None ->
         Err.error pos ("Type " ^ S.name(typ) ^ " could not be found");
         {exp = ()(*Translate.unitExp()*); ty = T.ARRAY(T.NIL, ref ())}
		
		    
    and tr_exp: A.exp -> expty  = function
      | A.VarExp(var) -> trans_var(v_env, t_env, level, var, break)
      | A.NilExp -> {exp = (*Translate.nilExp()*)(); ty = T.NIL}
      | A.IntExp e -> {exp = ()(*Translate.intExp(e)*); ty = T.INT}
      | A.StringExp (str, _) -> {exp = () (*Translate.stringExp(str)*); ty = T.STRING}
      | (A.CallExp _ as e) -> check_func_call_exp e
      | (A.OpExp _ as e) -> check_type_op e
      | (A.RecordExp _ as e) -> check_record_exp e
      | A.SeqExp e -> check_seq_exp e
      | (A.AssignExp _ as e) -> check_assign_exp e
      | (A.IfExp _ as e) -> check_if_exp e
      | (A.WhileExp _ as e) -> check_while_exp e
      | (A.ForExp _ as e) -> check_for_exp e
      | A.BreakExp pos -> (if get_nested_level() > 0 then () else Err.error pos "Break exp is not nested inside loop";
			   {exp = ()(*Translate.breakExp(break) *); ty = T.STRING})
      | (A.LetExp _ as e) -> check_let_exp e
      | (A.ArrayExp _ as e) -> check_array_exp e
    in	    
    tr_exp exp
(*
    let transProg (my_exp : A.exp): F.frag list = 
	let
	    let mainlabel = Temp.newlabel()
	    let mainlevel = Translate.newLevel {parent=Translate.outermost, name=mainlabel, formals=[]}
	    let _ = FindEscape.findEscape my_exp
	    (* The reason that we have to use mainlevel instead with outermost here is that we can't alloc local on outermost *)
	    (* See alloclocal letction in translate.sml*)
	    let {exp = mainexp, ty = _} = transExp(Env.base_venv, Env.base_tenv, mainlevel, my_exp, mainlabel)
	    let _ = Translate.procEntryExit {level=mainlevel, body=mainexp};
	    let resultIR = Translate.getResult()
					      
	    let printFn = fn exp -> Printtree.printtree (TextIO.stdOut, exp)
	in
	    Translate.convertToStm mainexp;
	    resultIR
	end

    let testIR (name: string) =
	transProg(Parse.parse name)
   
 *)  
    


