module T = Types
module Err = Error.Error
module S = Symbol
module A = Absyn

type tenv = T.ty Symbol.table
         
let assert_type_eq (
        (first: T.ty),
        (second: T.ty),
        (pos: int),
        (msg: string)
      ): unit =
  if T.eq(first, second) then () else (Err.error pos msg)
                                                
let actual_ty (t_env: tenv) (ty: T.ty): T.ty =
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

let print_circular (circular_nodes: string list list): unit =
  let print circle_nodes =
    print_string "ERROR: Circular type decs:\n";
    print_string (String.concat " -> " circle_nodes);
    print_string "/n"
  in
  List.iter print circular_nodes

let build_circular (types: A.typeDec list): string list list =
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

let check_circular (types: A.typeDec list) =
  build_circular types |> print_circular
