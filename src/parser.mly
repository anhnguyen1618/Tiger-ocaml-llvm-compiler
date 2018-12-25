/* parser.mly */

%{

open Location

module A = Absyn
module S = Symbol

let parse_error msg =
  match !lexbuf_ref with
  | Some lexbuf ->
      Error.error (curr_loc lexbuf) (Error.Syntax (Lexing.lexeme lexbuf))
  | None ->
      Error.internal "lexbuf_ref is unset"

let addFuncDec  = function
                    | (A.FunctionDec(oldFuncDecs), newFuncDecs) -> A.FunctionDec(oldFuncDecs @ newFuncDecs)
                    | (_, newFuncDecs) -> A.FunctionDec(newFuncDecs)

let addTypeDec x = match x with
                  | (A.TypeDec(oldTypes), newTypes) -> A.TypeDec(oldTypes @ newTypes)
                  | (_, newTypes) -> A.TypeDec(newTypes)
%}

%token <int>    INT
%token <string> STRING
%token <string> ID
%token          FOR WHILE BREAK LET IN NIL TO END
%token          FUNCTION VAR TYPE ARRAY IF THEN ELSE DO OF
%token          LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE
%token          DOT COLON COMMA SEMI
%token          PLUS MINUS TIMES DIV UMINUS
%token          EQ NE LT LE GT GE
%token          AND OR
%token          ASSIGN
%token          EOF

%nonassoc FUNCTION TYPE VAR TYPE IF DO OF ASSIGN ARRAY WHILE FOR TO
%left OR
%left AND
%right THEN
%right ELSE

%nonassoc EQ NEQ LT LE GT GE
%left PLUS MINUS
%left TIMES DIVIDE
%left UMINUS

%start prog
%type <A.exp> prog

%%

prog:
  exp                                              { $1 }
;

exp:

  NIL                                              { A.NilExp }
| INT                                              { A.IntExp $1 }
| STRING                                           { A.StringExp($1, $startpos) }

| id LBRACK exp RBRACK OF exp                      { A.ArrayExp {typ = Symbol.symbol($1), size = $3, init = $6, pos = $startpos($1)} }
| id LBRACE field_value_list RBRACE                { A.RecordExp {fields = $3, typ = Symbol.symbol($1), pos = $startpos} }


| lvalue                                           { A.VarExp $1 }

| lvalue ASSIGN exp                                { A.AssignExp({ var = $1, exp = $3, pos = $startpos($2) }) }

| id LPAREN args RPAREN                            { A.CallExp({func = Symbol.symbol($1), args = $3, pos = $startpos }) }

| exp OR exp                                       { A.IfExp({ test = $1, then' = A.IntExp(1), else' = Some($3), pos = $startpos}) }
| exp AND exp                                      { A.IfExp({ test = $1, then' = $3, else' = Some(A.IntExp(0)), pos = $startpos}) }
| exp EQ exp                                       { A.OpExp({left=$1, oper= A.EqOp, right= $3, pos= $startpos}) }
| exp NE exp                                       { A.OpExp({left=$1, oper= A.NeqOp, right= $3, pos= $startpos}) }
| exp LT exp                                       { A.OpExp({left=$1, oper= A.LtOp, right= $3, pos= $startpos}) }
| exp LE exp                                       { A.OpExp({left=$1, oper= A.LeOp, right= $3, pos= $startpos}) }
| exp GT exp                                       { A.OpExp({left=$1, oper= A.GtOp, right= $3, pos= $startpos}) }
| exp GE exp                                       { A.OpExp({left=$1, oper= A.GeOp, right= $3, pos= $startpos}) }
| exp PLUS exp                                     { A.OpExp({left=$1, oper= A.PlusOp, right= $3, pos= $startpos}) }
| exp MINUS exp                                    { A.OpExp({left=$1, oper= A.MinusOp, right= $3, pos= $startpos}) }
| exp TIMES exp                                    { A.OpExp({left=$1, oper= A.TimesOp, right= $3, pos= $startpos}) }
| exp DIV exp                                      { A.OpExp({left=$1, oper= A.DivideOp, right= $3, pos= $startpos}) }
| MINUS exp %prec UMINUS                           { A.OpExp({left=A.IntExp(0), oper=A.MinusOp, right=$2, pos= $startpos}) }

| IF exp THEN exp ELSE exp                         { A.IfExp({ test = $2, then' = $4, else' = Some $6 pos = $startpos}) }
| IF exp THEN exp                                  { A.IfExp({ test = $2, then' = $4, else' = None, pos = $startpos}) }
| WHILE exp DO exp                                 { A.WhileExp({test = $2, body = $4, pos = $startpos}) }
| FOR id ASSIGN exp TO exp DO exp                  { A.ForExp({var = Symbol.symbol($2), escape = (ref true), lo = $4, hi = $6 , body = $8, pos = $startpos}) }
| BREAK                                            { A.BreakExp($startpos) }

| LET decs IN sequence END                         { A.LetExp({decs = $2, body = A.SeqExp($4), pos = $startpos }) }

| LPAREN sequence RPAREN                           { A.SeqExp($2) }
;

id:
  ID                                               { A.NameTy (Symbol.symbol($1), $startpos) }
;

field_value_list:
  id EQ exp                                        { [($1, $3, $startpos)] }
| id EQ exp COMMA field_value_list                 { ($1, $3, $startpos) :: $5 } (*Check later*)
;

lvalue:
  id                                               { A.SimpleVar($1, $startpos) }
| lvalue DOT id                                    { A.FieldVar ($1, Symbol.symbol($3), $startpos($2)) }
| lvalue LBRACK exp RBRACK                         { A.SubscriptVar($1, $3, $startpos($2)) }
;

fields:
  id COLON id tyfieldstail ({name = Symbol.symbol($1), escape = (ref true), typ = Symbol.symbol($3), pos = $startpos}::tyfieldstail)
;

tyfieldstail : (* empty*) ([])
| COMMA id COLON id tyfieldstail ({name = Symbol.symbol($2), escape = (ref true), typ = Symbol.symbol($4), pos = $startpos($2)}::tyfieldstail)

sequence:
  /* empty */                                      { []}
| exp                                              { [($1, $startpos)] }
| exp SEMI sequence_rest                           { ($1, $startpos) :: $3 }
;

sequence_rest:
  exp                                              { [($1, $startpos)] }
| exp SEMI sequence_rest                           { [($1, $startpos)] :: $3 }
;

args:
  /* empty */                                      { [] }
| exp                                              { $1 :: [] }
| exp COMMA args_rest                              { $1 :: $3 }
;

args_rest:
  exp                                              { $1 :: [] }
| exp COMMA args_rest                              { $1 :: $3 }
;

type_opt:
  /* empty */                                      { None } 
| COLON id                                         { Some ($startpos $2) }

varDec:
  VAR id COLON type_opt ASSIGN exp                 { A.VarDec({name = Symbol.symbol($2), escape = (ref true),
                                                              typ = $4,
                                                              init = $6, pos = $startpos}) }
;

functionDec:
  FUNCTION id LPAREN fields RPAREN type_opt EQ exp { A.FunctionDec([{ name = Symbol.symbol($2), params = $4,
                                                      result = $6, body = $8, pos = $startpos}]) }
| functionDec FUNCTION id LPAREN fields RPAREN type_opt EQ exp { addFuncDec (fundec, [
                                                                { name = Symbol.symbol($3), params = $5,
                                                                result = $7, body = $9, pos = $startpos}]) }
;

typeDec:
  TYPE id EQ ty                                    { A.TypeDec([{ name = Symbol.symbol($2), ty = $4, pos = $startpos }]) }
| TYPE id EQ ty typeDec                            { addTypeDec(tydec, [{ name = Symbol.symbol($2), ty = $4, pos = $startpos }]) }
;



ty:
  id                                               { A.NameTy (Symbol.symbol($1), $startpos) }
| LBRACE fields RBRACE                             { A.RecordTy $2 }
| ARRAY OF id                                      { A.ArrayTy ($3, $startpos) }
;

dec:
  varDec                              { $1 }
| functionDec                         { $1 }
| typeDec                             { $1 }
;

decs: dec decs                        {$1 :: $2 }
| (*empty*)                           {[]}


%%
