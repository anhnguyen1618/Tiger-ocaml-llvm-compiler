module E = Env
module T = Types
module A = Absyn
module S = Symbol
module Err = Error.Error

type venv = E.enventry Symbol.table
type tenv = Types.ty Symbol.table
type expty = {exp: Translate.exp; ty: T.ty}
type decty =  {v_env : venv; t_env: tenv; expList: Translate.exp list}

type type_map = {name: S.symbol; ty: T.ty}

let nested_loop_level = ref 0
let change_nested_loop_level oper = nested_loop_level := oper !nested_loop_level 1
let increase_nested_Level () = change_nested_loop_level (+)
let decrease_nested_level () = change_nested_loop_level (-)
let get_nested_level () = !nested_loop_level

let assert_type_eq (first, second, pos, msg) =
  if T.eq(first, second) then () else (Err.error pos msg)
                                                
let actual_ty t_env (ty: T.ty) =
  let rec h = function
    | T.NAME (n, result) ->
       (match !result with
        | Some t -> t
        | None -> ( match S.look(t_env, n) with
		    | Some t ->
		       let typ = h t in
		       result := Some(typ);
		       typ
		    | None -> T.NIL))
    | e -> e
  in
  h ty

let print_circular circular_nodes =
  let print circle_nodes =
    print_string "ERROR: Circular type decs:\n";
    print_string (String.concat " -> " circle_nodes);
    print_string "/n"
  in
  List.iter print circular_nodes


type type_node = { name: S.symbol; ty: A.ty; pos: int }
let check_circular (types: A.typeDec list) =
  let build_node_info ((A.Type x) as node) = (node, ref (x.name), ref false, ref false) in
  let type_nodes = List.map build_node_info types in
  let rec traverse (A.Type {name; ty; pos}, start_node, is_visited, is_cir) =
    if !is_visited then (false, []) else
      ( is_visited := true;
	match ty with
	| A.NameTy(next, _) ->
	   let nextNode = List.find_opt
                            (fun (A.Type {name; ty; pos}, _, _, _) -> S.eq(name, next))
                            type_nodes in
	   ( match nextNode with
	     | Some ((A.Type e) as node, next_start_node, next_is_visited, next_is_cir) ->
		if !next_is_visited && S.eq(!start_node, !next_start_node)
		then
		  (next_is_cir := true;
		   Err.error e.pos ("Circular type declaration: " ^ S.name(e.name));
		   (true, [S.name(name); S.name(next)]))
		else if !next_is_visited then (false, [])
		else
		  (next_start_node := !start_node;
		   let (add_new, cir_nodes) =
                     traverse (node, next_start_node, next_is_visited, next_is_cir)
		   in
		   if List.length cir_nodes > 0 && add_new
		   then
		     (not (!is_cir), S.name(name) :: cir_nodes)
		   else (false, cir_nodes)
		  )
	     | None -> (false, []))
	| _ -> (false, []))
  in
  
  let h cir (e, start_node, is_visited, is_cir) =
    if !is_visited then cir else
      (let (_, cirNodes) = traverse (e, start_node, is_visited, is_cir)
       in
       if List.length cirNodes > 0
       then cirNodes::cir
       else cir)
  in
  List.fold_left h [] type_nodes


let trans_type ((t_env: tenv), (ty: A.ty)): T.ty =

  let look_up_type (s, p) =
    match S.look(t_env, s) with
      Some t -> t
    | None -> (Err.error p ("Type " ^ S.name(s) ^ " has not been declared"); T.NIL) in

  let map_field_to_record (A.Field {name; typ; pos; escape = _}) = (name, look_up_type(typ, pos)) in
		    
  let check_record fields = T.RECORD (List.map map_field_to_record fields, ref ()) in

  let check_name_type = look_up_type in

  let check_array_type e = T.ARRAY(look_up_type e, ref()) in
			 
  let trans_ty = function
    | A.NameTy (s, p) -> check_name_type (s, p)
    | A.RecordTy e -> check_record e
    | A.ArrayTy (s, p) -> check_array_type (s, p)
  in
  trans_ty ty

let transDec (
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
    check_circular types |> print_circular;
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
   
    let get_type (A.Field {name; escape = _; typ; pos}): type_map =
      {name = name; ty = look_type_up (typ, pos)}
    in

    let check_result_type (expectType, resultType) =
      if T.eq(expectType, T.UNIT) then true
      else T.eq(expectType, resultType)
    in
    
    let add_func_header acc (A.Func {name; params; result; body; pos}) =
      let f param = get_type param |> (fun x -> x.ty) |> (actual_ty t_env) in
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
      let types: type_map list = List.map get_type params in
      let result_type = get_type_for_result result in
      let escapes = List.map (fun (A.Field x) -> !(x.escape)) params in
      let label = match S.look(cur_v_env, name) with
	| Some(E.FunEntry {label; _}) -> label
	| _ -> Temp.newlabel() in
					       
      let func_level = Translate.outermost
      (*Translate.newLevel
        {parent = level; name = label; formals = escapes}*) in

      let param_accessed = [](*Translate.formals func_level*) in
							      
      let add_params_to_body (temp, i) ({name; ty}: type_map) =
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
       else (Err.error pos ("return type " ^ T.name(body_type) ^ " does not match with " ^ T.name(result_type)));
       cur_v_env)
    in

    let base_env = List.fold_left add_func_header v_env fs in
    let newv_env = List.fold_left add_new_func_entry base_env fs in
    {v_env = newv_env; t_env = t_env; expList = expList}
  in

  let trDec = function
    | (v_env, t_env, (A.VarDec _ as e), expList) -> check_var_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.TypeDec(e), expList) -> check_type_dec (v_env, t_env, e, expList)
    | (v_env, t_env, A.FunctionDec(e), expList) -> check_func_dec (v_env, t_env, e, expList)
  in
						       
  let helper = fun {v_env = v_env; t_env = t_env; expList} dec -> trDec(v_env, t_env, dec, expList) in
  let result = List.fold_left helper {v_env = v_env; t_env = t_env; expList = []} exps in
  result
    




