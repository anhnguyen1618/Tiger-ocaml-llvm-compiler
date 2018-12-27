module E = Env
module T = Types
module A = Absyn
module S = Symbol
module Err = Error.Error

type venv = E.enventry Symbol.table
type tenv = Types.ty Symbol.table
type expty = {exp: Translate.exp; ty: T.ty}
type decty =  {venv : venv; tenv: tenv; expList: Translate.exp list}

let nested_loop_level = ref 0
let change_nested_loop_level oper = nested_loop_level := oper !nested_loop_level 1
let increase_nested_Level () = change_nested_loop_level (+)
let decrease_nested_level () = change_nested_loop_level (-)
let get_nested_level () = !nested_loop_level

let assert_type_eq (first, second, pos, msg) =
  if T.eq(first, second) then () else (Err.error pos msg)
                                                
let actual_ty t_env ty =
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
  if List.length circular_nodes > 0 then
    print_string "Circular type decs:\n";
  print_string (String.concat " -> " circular_nodes)

type type_node = { name: S.symbol; ty: A.ty; pos: int }
let check_circular (xs: type_node list) =
  let type_nodes = List.map (fun x -> (x, ref (x.name), ref false, ref false)) xs in
  let rec traverse ({name; ty; pos}, start_node, is_visited, is_cir) =
    if !is_visited then (false, []) else
      ( is_visited := true;
	match ty with
	| A.NameTy(next, _) ->
	   let nextNode = List.find_opt
                            (fun ({name; ty; pos}, _, _, _) -> S.eq(name, next))
                            type_nodes in
	   ( match nextNode with
	     | Some (e, next_start_node, next_is_visited, next_is_cir) ->
		if !next_is_visited && S.eq(!start_node, !next_start_node)
		then
		  (next_is_cir := true;
		   Err.error e.pos ("Circular type declaration: " ^ S.name(e.name));
		   (true, [S.name(name); S.name(next)]))
		else if !next_is_visited then (false, [])
		else
		  (next_start_node := !start_node;
		   let (add_new, cir_nodes) =
                     traverse (e, next_start_node, next_is_visited, next_is_cir)
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



