module A = Absyn

type depth = int
type esc_env = (depth * bool ref) Symbol.table

                (* looks through the variable references to the underlying var *)
let rec traverse_var: esc_env * depth * A.var -> unit = function
  | (env, d, (A.SimpleVar(id, pos))) -> 
     (match Symbol.look (env,id) with
      | Some (depth, escape) -> escape := depth < d
      | None -> ())
  | (env, d, (A.FieldVar(var, id, pos))) ->
      traverse_var(env, d, var)
  | (env, d, A.SubscriptVar(var, exp, pos)) ->
      traverse_var(env, d, var)

and traverse_exp = function
  | (env, d, A.OpExp{left; oper; right; pos}) ->
    traverse_exp(env, d, left);
    traverse_exp(env, d, right)
  | (env, d, A.VarExp(var)) -> traverse_var(env, d, var)
  | (env, d, A.NilExp) -> ()
  | (env, d, A.IntExp(int)) ->  ()
  | (env, d, A.StringExp(str, pos)) -> ()
  | (env, d, A.CallExp{func; args; pos}) ->
     List.iter(fun x -> traverse_exp(env,d,x)) args
  | (env, d, A.RecordExp{fields = args; typ = typ; pos = pos}) ->
     List.iter (fun (_,x,_) -> traverse_exp(env,d,x)) args
  | (env, d, A.SeqExp(exps)) ->
     List.iter(fun (x,_) -> traverse_exp(env,d,x))(exps)
  | (env, d, A.AssignExp{var; exp; pos}) ->
    traverse_exp(env, d, exp);
    traverse_var(env, d, var)
  | (env, d, A.IfExp{test; then'; else'; pos}) ->
    traverse_exp(env,d,then');
    traverse_exp(env,d,test);
     (match else' with
       Some (exp) -> traverse_exp(env,d,then')
     | None -> ())
  | (env, d, A.WhileExp{test; body; pos}) ->
    traverse_exp(env,d,test);
    traverse_exp(env,d,body)
  | (env, d, A.ForExp{var; escape; lo; hi; body; pos}) ->
      let loopEnv = Symbol.enter(env, var, (d, escape)) in
      traverse_exp(env, d, lo);
      traverse_exp(env, d, hi);
      traverse_exp(loopEnv, d, body)
      
  | (env, d, A.BreakExp(pos)) -> ()
  | (env, d, A.LetExp{decs; body; pos}) ->
     let bodyEnv = traverseDecs(env, d, decs) in
     traverse_exp(bodyEnv, d, body)
  | (env, d, A.ArrayExp{typ; size; init; pos}) ->
     traverse_exp(env, d, size);
     traverse_exp(env, d, init)

and traverseDecs (env, d, (decs:Absyn.dec list)) : esc_env =
  let add_field (A.Field {name; escape; typ; pos}) env =
    Symbol.enter(env, name, (d + 1, escape))
  in
  let traverse_fun(fields, body) =
    let funEnv = List.fold_right (add_field) fields env
    in
    traverse_exp(funEnv, d + 1, body)
  in
  let traverse_dec = function
    | (env, d, A.FunctionDec(fundecs)) ->
      List.iter (fun (A.Func{name; params; result; body; pos}) -> traverse_fun(params, body)) fundecs;
      env
    | (env, d, A.VarDec{name; escape; typ; init; pos}) ->
       Symbol.enter(env, name, (d, escape))
    | (env, d, A.TypeDec(typedecs)) -> env
  in
  List.fold_right(fun x env -> traverse_dec(env, d, x)) decs env

let find_escape(prog: Absyn.exp) = traverse_exp(Symbol.empty, 0, prog)

