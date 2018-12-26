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

let assert_eq (firstType, secondType, pos, errormsg) =
  if T.eq(firstType, secondType) then () else (Err.error pos errormsg)
                                                
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

let printCircular circularArrays =
  if List.length circularArrays > 0 then
    print_string "Circular type decs:\n";
  print_string (String.concat " -> " circularArrays)


