module A = Absyn

type depth = int
type escEnv = (depth * bool ref) Symbol.table

                (* looks through the variable references to the underlying var *)
let rec traverseVar: escEnv * depth * A.var -> unit = function
  | (env, d, (A.SimpleVar(id, pos))) -> 
     (match Symbol.look (env,id) with
      | Some (depth, escape) -> escape := depth < d
      | None -> ())
  | (env, d, (A.FieldVar(var, id, pos))) ->
      traverseVar(env, d, var)
  | (env, d, A.SubscriptVar(var, exp, pos)) ->
      traverseVar(env, d, var)

and traverseExp = function
  | (env, d, A.OpExp{left; oper; right; pos}) ->
    traverseExp(env, d, left);
    traverseExp(env, d, right)
  | (env, d, A.VarExp(var)) -> traverseVar(env, d, var)
  | (env, d, A.NilExp) -> ()
  | (env, d, A.IntExp(int)) ->  ()
  | (env, d, A.StringExp(str, pos)) -> ()
  | (env, d, A.CallExp{func; args; pos}) ->
     List.iter(fun x -> traverseExp(env,d,x)) args
  | (env, d, A.RecordExp{fields = args; typ = typ; pos = pos}) ->
     List.iter (fun (_,x,_) -> traverseExp(env,d,x)) args
  | (env, d, A.SeqExp(exps)) ->
     List.iter(fun (x,_) -> traverseExp(env,d,x))(exps)
  | (env, d, A.AssignExp{var; exp; pos}) ->
    traverseExp(env, d, exp);
    traverseVar(env, d, var)
  | (env, d, A.IfExp{test; then'; else'; pos}) ->
    traverseExp(env,d,then');
    traverseExp(env,d,test);
     (match else' with
       Some (exp) -> traverseExp(env,d,then')
     | None -> ())
  | (env, d, A.WhileExp{test; body; pos}) ->
    traverseExp(env,d,test);
    traverseExp(env,d,body)
  | (env, d, A.ForExp{var; escape; lo; hi; body; pos}) ->
      let loopEnv = Symbol.enter(env, var, (d, escape)) in
      traverseExp(env, d, lo);
      traverseExp(env, d, hi);
      traverseExp(loopEnv, d, body)
      
  | (env, d, A.BreakExp(pos)) -> ()
  | (env, d, A.LetExp{decs; body; pos}) ->
     let bodyEnv = traverseDecs(env, d, decs) in
     traverseExp(bodyEnv, d, body)
  | (env, d, A.ArrayExp{typ; size; init; pos}) ->
     traverseExp(env, d, size);
     traverseExp(env, d, init)

and traverseDecs (env, d, (decs:Absyn.dec list)) : escEnv =
  let addField (A.Field {name; escape; typ; pos}) env =
    Symbol.enter(env, name, (d + 1, escape))
  in
  let traverseFun(fields, body) =
    let funEnv = List.fold_right (addField) fields env
    in
    traverseExp(funEnv, d + 1, body)
  in
  let traverseDec = function
    | (env, d, A.FunctionDec(fundecs)) ->
      List.iter (fun (A.Func{name; params; result; body; pos}) -> traverseFun(params, body)) fundecs;
      env
    | (env, d, A.VarDec{name; escape; typ; init; pos}) ->
       Symbol.enter(env, name, (d, escape))
    | (env, d, A.TypeDec(typedecs)) -> env
  in
  List.fold_right(fun x env -> traverseDec(env, d, x)) decs env

let findEscape(prog: Absyn.exp) = traverseExp(Symbol.empty, 0, prog)

