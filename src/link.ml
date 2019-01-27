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
type expty = T.ty
type decty =  { v_env : venv; t_env: tenv }

(* state*)
let escape_vars: T.ty list ref  = ref []
let current_counter = ref 1 (* 0 belongs to static link *)

let increase_counter () = current_counter := !current_counter + 1

let get_counter () = !current_counter

let reset_global_state () =
  let empty_list: T.ty list = [] in
  escape_vars := empty_list;
  current_counter := 1


let trans_type ((t_env: tenv), (ty: A.ty)): T.ty =
  let look_up_type ((s: S.symbol), (p: int)): T.ty =
    match S.look(t_env, s) with
      Some t -> t
    | None -> T.NIL in

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
            (exps: Absyn.dec list)
          ): decty =
 
  let check_var_dec (
          (v_env: venv),
          (t_env: tenv),
          A.VarDec { name; typ; init; pos; escape; order }
        ) =
    let rhs_type = trans_exp (v_env, t_env, init) in
    if !escape
    then
      begin
        escape_vars := rhs_type :: !escape_vars;
        order := !current_counter;
        increase_counter()
      end;
    match typ with
      Some (s, p) ->
       begin
         match S.look(t_env, s) with
	 | Some lhs_type ->
            let new_entry = E.VarEntry{ty = lhs_type; access = Translate.dummy_access} in
	    let new_v_env = S.enter(v_env, name, new_entry) in
            {
              v_env = new_v_env;
	      t_env = t_env;
	    }
	 | None -> {v_env = v_env; t_env = t_env }
       end
    | None ->
       let new_entry = E.VarEntry{ty = rhs_type; access = Translate.dummy_access} in
       {
	 v_env = S.enter(v_env, name, new_entry);
	 t_env = t_env
       }
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
    U.check_circular types;
    List.fold_left f {v_env = v_env; t_env = dumb_t_env } types
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
   
    let get_type (A.Field {name; escape = _; typ; pos}): arg_name_type_map =
      {name = name; ty = look_type_up (typ, pos); esc_order = -1}
    in
    
    let add_func_header acc (A.Func {name; params; result; body; pos}) =
      let f param = get_type param |> (fun x -> x.ty) |> (U.actual_ty t_env) in
      let type_list = List.map f params in
      let result_type = get_type_for_result result in
      S.enter(acc, name, E.FunEntry{
                             formals = type_list;
                             result = result_type;
                             label = name;
                             level = Translate.outermost})
    in

    let base_env = List.fold_left add_func_header v_env fs in
    {v_env = base_env; t_env = t_env}
  in

  let tr_dec = function
    | (v_env, t_env, (A.VarDec _ as e)) -> check_var_dec (v_env, t_env, e)
    | (v_env, t_env, A.TypeDec(e)) -> check_type_dec (v_env, t_env, e)
    | (v_env, t_env, A.FunctionDec(e)) -> check_func_dec(v_env, t_env, e)
  in
						       
  let helper = fun {v_env; t_env} dec -> tr_dec(v_env, t_env, dec) in
  let result = List.fold_left helper {v_env = v_env; t_env = t_env } exps in
  result

  and trans_var (
        (v_env: venv),
        (t_env: tenv),
        (exp: Absyn.var)
      ): expty =

    let actual_ty = U.actual_ty t_env in
    let check_simple_var (s: S.symbol): expty =
      match S.look(v_env, s) with
        Some (E.VarEntry({ty; _})) -> actual_ty ty
      | _ -> print_string ("couldn't find variable " ^ S.name(s) ^ "\n"); T.NIL
    in
    
    let rec check_field_var (obj, s, pos): expty =
      let ty = tr_var obj in
      let object_type = actual_ty ty in
      match object_type with
      | T.RECORD (tys, _) ->
	 let index = ref (-1) in
         let matchedField = List.find_opt
                              (fun (symbol, _) -> (index := !index + 1; S.eq(s, symbol))) tys
         in
         begin
           match matchedField with
           | Some (_, ty) -> ty
           | None -> T.NIL
         end
      | _ -> T.NIL
           
    and check_array_var ((var: A.var), (size_exp: A.exp)): expty =
      ignore(trans_exp (v_env, t_env, size_exp));
      let array_type = var |> tr_var |> actual_ty in
      match array_type with
      | T.ARRAY (ty, _) -> ty
      | _ -> T.NIL


    and tr_var: A.var -> expty = function
      | A.SimpleVar (s, _) -> check_simple_var s
      | A.FieldVar (var, e, p) -> check_field_var (var, e, p)
      | A.SubscriptVar (var, size, _) -> check_array_var(var, size)
    in
    tr_var exp

  (* experimental end *)
  and trans_exp (
       (v_env: venv),
       (t_env: tenv),
       (exp: Absyn.exp)): expty  =

    let rec check_func_call_exp (A.CallExp {func; args; pos}): expty =
      match S.look(v_env, func) with
      | Some ( E.FunEntry {result; formals} ) ->
         List.iter (fun x -> x |> tr_exp |> ignore) args;
         result
      | _ -> T.NIL

    and check_record_exp (A.RecordExp {fields; typ; pos}) =      
      match S.look(t_env, typ) with
      | Some (T.RECORD (types, refer) as x) ->
	 begin
           if List.length fields <> List.length types
	   then T.NIL
	   else
	   (List.iter (fun (_, e, _) -> ignore(tr_exp e)) fields;
	    x)
         end
      | _ -> T.RECORD ([], Temp.newtemp ())

    and check_seq_exp (exp_pos: (A.exp * int) list): expty =
      match List.length exp_pos with
	0 -> T.NIL
      | _ -> 
	 let results = List.map (fun (exp, _) -> tr_exp exp) exp_pos in
         if (List.length results) = 0
         then T.NIL
         else List.nth results (List.length(results) -1)
         
    and check_while_exp (A.WhileExp {test; body; pos}) =
      ignore(tr_exp test);
      ignore(trans_exp (v_env, t_env, body));
      T.NIL
      
    and check_for_exp (A.ForExp {lo; hi; pos; body} as for_ast) =
      let get_type e = e |> tr_exp |> (U.actual_ty t_env) in
      ignore(get_type lo);
      ignore(get_type hi);
      ignore(tr_exp body);
      T.NIL

    and check_assign_exp (A.AssignExp{var; exp; pos}): expty =
      ignore(trans_var(v_env, t_env, var));
      ignore(tr_exp exp);
      T.NIL

    and check_if_exp (A.IfExp {test = test_exp; then' = then_exp; else' = else_option; pos}): expty =
      ignore(tr_exp test_exp);
      ignore(tr_exp then_exp);
      match else_option with
      | None -> T.NIL
      | Some else_exp -> tr_exp else_exp
		    
    and check_let_exp (A.LetExp{decs; body; pos}) =
      let { v_env; t_env } = trans_dec(v_env, t_env, decs) in
      trans_exp (v_env, t_env, body)

    and check_array_exp (A.ArrayExp {typ; size; init; pos}) =
      ignore(tr_exp size);
      ignore(tr_exp init);
      match S.look(t_env, typ) with
	Some x -> x
      | None -> Err.error pos ("Type " ^ S.name(typ) ^ " is unknown");
                T.NIL
		    
    and tr_exp: A.exp -> expty  = function
      | A.VarExp(var) -> trans_var(v_env, t_env, var)
      | A.NilExp -> T.NIL
      | A.IntExp e -> T.INT
      | A.StringExp (str, _) -> T.STRING
      | (A.CallExp _ as e) -> check_func_call_exp e
      | (A.OpExp _) -> T.INT
      | (A.RecordExp _ as e) -> check_record_exp e
      | A.SeqExp e -> check_seq_exp e
      | (A.AssignExp _ as e) -> check_assign_exp e
      | (A.IfExp _ as e) -> check_if_exp e
      | (A.WhileExp _ as e) -> check_while_exp e
      | (A.ForExp _ as e ) -> check_for_exp e
      | A.BreakExp pos -> T.NIL
      | (A.LetExp _ as e) -> check_let_exp e
      | (A.ArrayExp _ as e) -> check_array_exp e
    in
    tr_exp exp

let extract_esc (v_env, t_env, body): T.ty list =
  reset_global_state ();
  ignore(trans_exp (v_env, t_env, body));
  List.rev !escape_vars
