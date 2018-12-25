open Printf
open Absyn

let expr_to_string = function
  | VarExp v ->
     var_to_string v

  | NilExp ->
     "nil"

  | IntExp n ->
     string_of_int n

  | StringExp (s, _) ->
     sprintf "\"%s\"" (String.escaped s)

  | CallExp { func; args; pos } ->
     sprintf "%s(%s)"
       (S.name call_func)
       (Utils.join ", " expr_to_string args)

  | OpExp { left; right; oper; _ } ->
     sprintf "(%s %s %s)" (expr_to_string eft) (op_to_string oper) (expr_to_string right)

  | RecordExp { typ; fields; _ } ->
     sprintf "%s{ %s }"
       (S.name typ)
       (Utils.join
          ", "
          (fun (k, v, _) ->
            sprintf "%s=%s" (S.name k) (expr_to_string v))
          fields)

  | SeqExp exps ->
     sprintf "(%s)" (Utils.join "; " expr_to_string exps)

  | AssignExp { var; exp; _ } ->
     sprintf "%s := %s" (var_to_string var) (expr_to_string exp)

  | IfExp { test; then'; else'; _ } ->
     let else_str =
       (match else' with
       | Some expr -> " else " ^ expr_to_string expr
       | None      -> ""
       ) in
     sprintf "if (%s) then %s%s" (expr_to_string test) (expr_to_string then') else_str

  | WhileExp { test; body; _ } ->
     sprintf "while %s do %s" (expr_to_string test) (expr_to_string body)

  | ForExp { var; lo; hi; body; _ } ->
     sprintf "for %s := %s to %s do %s"
       (S.name var)
       (expr_to_string lo)
       (expr_to_string hi)
       (expr_to_string body)

  | BreakExp ->
     "break"

  | LetExp { decs; body; _ } ->
     sprintf "let %s in %s end"
       (Utils.join " " let_decl_to_string decs)
       (expr_to_string body)

  | ArrayExp { typ; size; init; _ } ->
     sprintf "%s [%s] of %s"
       (S.name typ)
       (expr_to_string size)
       (expr_to_string init)


and var_to_string = function
  | SimpleVar (sym, _) -> S.name sym
  | FieldVar (var, field, _) -> sprintf "%s.%s" (var_to_string var) (S.name field)
  | SubscriptVar (var, expr, _) -> sprintf "%s[%s]" (var_to_string var) (expr_to_string expr)

and let_decl_to_string = function
  | VarDecl var_decl ->
     var_decl_to_string var_decl
  | FunDecl fun_decls ->
     Utils.join " " fun_decl_to_string fun_decls
  | TypeDecl type_decls ->
     Utils.join " " type_decl_to_string type_decls

and var_decl_to_string { name; typ; var; _ } =
  sprintf "var %s%s := %s"
    (S.name name)
    (match typ with
    | Some t -> ": " ^ S.name t
    | None -> "")
    (expr_to_string var)

and fun_decl_to_string { name; params; body; typ; _ } =
  sprintf "function %s(%s)%s = %s"
    (S.name name)
    (Utils.join ", " field_to_string params)
    (match type with
    | Some t -> ": " ^ S.name t
    | None -> "")
    (expr_to_string body)

and type_decl_to_string { name; ty; _ } =
  sprintf "type %s = %s"
    (S.name name)
    (type_to_string ty)

and field_to_string { name; typ; _ } =
  sprintf "%s: %s"
    (S.name name)
    (S.name typ)

and type_to_string = function
  | NameType (name, _) -> S.name name
  | RecordType fields -> sprintf "{ %s }" (Utils.join ", " field_to_string fields)
  | ArrayType (base_type, _) -> sprintf "array of %s" (S.name base_type)

and op_to_string = function
  | PlusOp   -> "+"
  | MinusOp  -> "-"
  | TimesOp  -> "*"
  | DivideOp -> "/"
  | ModuloOp -> "%"
  | EqOp     -> "="
  | NeqOp    -> "<>"
  | LtOp     -> "<"
  | LeOp     -> "<="
  | GtOp     -> ">"
  | GeOp     -> ">="