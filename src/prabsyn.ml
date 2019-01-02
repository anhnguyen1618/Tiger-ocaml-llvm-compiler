open Printf
open Absyn

module S = Symbol

let join sep f xs =
  String.concat sep (List.map f xs)

let rec expr_to_string = function
  | VarExp v ->
     var_to_string v

  | NilExp ->
     "nil"

  | IntExp n ->
     string_of_int n

  | StringExp (s, _) ->
     sprintf "\"%s\"" (String.escaped s)

  | CallExp { func; args; pos } ->
     sprintf "%sls(%s)"
       (S.name func)
       (join ", " expr_to_string args)

  | OpExp { left; right; oper; _ } ->
     sprintf "(%s %s %s)" (expr_to_string left) (op_to_string oper) (expr_to_string right)

  | RecordExp { typ; fields; _ } ->
     sprintf "%s{ %s }"
       (S.name typ)
       (join
          ", "
          (fun (k, v, _) ->
            sprintf "%s=%s" (S.name k) (expr_to_string v))
          fields)

  | SeqExp exps ->
     sprintf "(%s)" (join "; " (fun (x, _) -> expr_to_string x) exps)

  | AssignExp { var; exp; _ } ->
     sprintf "%s := %s" (var_to_string var) (expr_to_string exp)

  | IfExp { test; then'; else'; _ } ->
     let else_str =
       (match else' with
       | Some expr -> " else " ^ expr_to_string expr
       | None      -> ""
       ) in
     sprintf "if %s\n then %s \n%s" (expr_to_string test) (expr_to_string then') else_str

  | WhileExp { test; body; _ } ->
     sprintf "while %s \n do %s" (expr_to_string test) (expr_to_string body)

  | ForExp { var; lo; hi; body; _ } ->
     sprintf "for %s := %s to %s do\n %s"
       (S.name var)
       (expr_to_string lo)
       (expr_to_string hi)
       (expr_to_string body)

  | BreakExp _ ->
     "break"

  | LetExp { decs; body; _ } ->
     sprintf "let\n  %s \nin\n  %s \nend"
       (join " " let_decl_to_string decs)
       (expr_to_string body)

  | ArrayExp { typ; init; _ } ->
     sprintf "%s of %s"
       (S.name typ)
       (expr_to_string init)


and var_to_string = function
  | SimpleVar (sym, _) -> S.name sym
  | FieldVar (var, field, _) -> sprintf "%s.%s" (var_to_string var) (S.name field)
  | SubscriptVar (var, expr, _) -> sprintf "%s[%s]" (var_to_string var) (expr_to_string expr)

and let_decl_to_string = function
  | VarDec { name; typ; init; _ } ->
     sprintf "var %s%s := %s"
       (S.name name)
       (match typ with
        | Some (t, _) -> ": " ^ S.name t
        | None -> "")
       (expr_to_string init)

  | FunctionDec fun_decls ->
     join " " fun_decl_to_string fun_decls
  | TypeDec type_decls ->
     join " " type_decl_to_string type_decls


and fun_decl_to_string (Func { name; params; body; result; _ }) =
  sprintf "function %s(%s)%s = %s"
    (S.name name)
    (join ", " field_to_string params)
    (match result with
     | Some (t, _) -> ": " ^ S.name t
     | None -> "")
    (expr_to_string body)

and type_decl_to_string (Type { name; ty; _ }) =
  sprintf "type %s = %s"
    (S.name name)
    (type_to_string ty)

and field_to_string (Field { name; typ; _ }) =
  sprintf "%s: %s"
    (S.name name)
    (S.name typ)

and type_to_string = function
  | NameTy (name, _) -> S.name name
  | RecordTy fields -> sprintf "{ %s }" (join ", " field_to_string fields)
  | ArrayTy (size, base_type, _) -> sprintf "array of %s" (S.name base_type)

and op_to_string = function
  | PlusOp   -> "+"
  | MinusOp  -> "-"
  | TimesOp  -> "*"
  | DivideOp -> "/"
  | EqOp     -> "="
  | NeqOp    -> "<>"
  | LtOp     -> "<"
  | LeOp     -> "<="
  | GtOp     -> ">"
  | GeOp     -> ">="
