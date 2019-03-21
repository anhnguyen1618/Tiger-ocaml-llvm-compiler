/* parser.mly */

%{
    open Error

let parse_error msg =
  Error.error 0  "lexbuf_ref is unset"
       

let addFuncDec  = function
                    | (Absyn.FunctionDec(prevDecs), curDec) -> Absyn.FunctionDec(prevDecs @ [curDec] )
                    | (_, dec) -> Absyn.FunctionDec([dec])

let addTypeDec x = match x with
                  | (Absyn.TypeDec(nextTypes), curType) -> Absyn.TypeDec(nextTypes @ [curType])
                  | (_, curType) -> Absyn.TypeDec([curType])

let dumb_order = -1
%}

%token <int>    INT
%token <string> STRING
%token <string> ID
%token          FOR WHILE BREAK LET IN NIL TO END
%token          FUNCTION VAR TYPE ARRAY IF THEN ELSE DO OF
%token          LPAREN RPAREN LBRACK RBRACK LBRACE RBRACE
%token          DOT COLON COMMA SEMI ARROW
%token          PLUS MINUS TIMES DIVIDE UMINUS
%token          EQ NEQ LT LE GT GE
%token          AND OR
%token          ASSIGN
%token          EOF

%nonassoc FUNCTION DO OF ASSIGN 
%left OR
%left AND
%right THEN
%right ELSE
%right TYPE
%right ARROW

%nonassoc EQ NEQ LT LE GT GE
%left PLUS MINUS
%left TIMES DIVIDE
%left UMINUS

%start prog
%type <Absyn.exp> prog
%%

prog:
  exp EOF                                             { $1 }
;

exp:

  NIL                                              { Absyn.NilExp }
| INT                                              { Absyn.IntExp $1 }
| STRING                                           { Absyn.StringExp($1, $startofs) }

| ID LBRACK exp RBRACK OF exp                      { Absyn.ArrayExp {typ = Symbol.symbol($1); size = $3; init = $6; pos = $startofs($1)} }
| ID LBRACE field_value_list RBRACE                { Absyn.RecordExp {fields = $3; typ = Symbol.symbol($1); pos = $startofs} }


| lvalue                                           { Absyn.VarExp $1 }

| lvalue ASSIGN exp                                { Absyn.AssignExp({ var = $1; exp = $3; pos = $startofs }) }

| ID LPAREN args RPAREN                            { Absyn.CallExp({func = Symbol.symbol($1); args = $3; pos = $startofs }) }

| exp OR exp                                       { Absyn.IfExp({ test = $1; then' = Absyn.IntExp(1); else' = Some($3); pos = $startofs}) }
| exp AND exp                                      { Absyn.IfExp({ test = $1; then' = $3; else' = Some(Absyn.IntExp(0)); pos = $startofs}) }
| exp EQ exp                                       { Absyn.OpExp({ left=$1; oper= Absyn.EqOp; right= $3; pos= $startofs}) }
| exp NEQ exp                                      { Absyn.OpExp({ left=$1; oper= Absyn.NeqOp; right= $3; pos= $startofs}) }
| exp LT exp                                       { Absyn.OpExp({ left=$1; oper= Absyn.LtOp; right= $3; pos= $startofs}) }
| exp LE exp                                       { Absyn.OpExp({ left=$1; oper= Absyn.LeOp; right= $3; pos= $startofs}) }
| exp GT exp                                       { Absyn.OpExp({ left=$1; oper= Absyn.GtOp; right= $3; pos= $startofs}) }
| exp GE exp                                       { Absyn.OpExp({ left=$1; oper= Absyn.GeOp; right= $3; pos= $startofs}) }
| exp PLUS exp                                     { Absyn.OpExp({ left=$1; oper= Absyn.PlusOp; right= $3; pos= $startofs}) }
| exp MINUS exp                                    { Absyn.OpExp({ left=$1; oper= Absyn.MinusOp; right= $3; pos= $startofs}) }
| exp TIMES exp                                    { Absyn.OpExp({ left=$1; oper= Absyn.TimesOp; right= $3; pos= $startofs}) }
| exp DIVIDE exp                                   { Absyn.OpExp({ left=$1; oper= Absyn.DivideOp; right= $3; pos= $startofs}) }
| MINUS exp %prec UMINUS                           { Absyn.OpExp({ left=Absyn.IntExp(0); oper=Absyn.MinusOp; right=$2; pos= $startofs}) }

| IF exp THEN exp ELSE exp                         { Absyn.IfExp({ test = $2; then' = $4; else' = Some $6; pos = $startofs}) }
| IF exp THEN exp                                  { Absyn.IfExp({ test = $2; then' = $4; else' = None; pos = $startofs}) }
| WHILE exp DO exp                                 { Absyn.WhileExp({test = $2; body = $4; pos = $startofs}) }
| FOR ID ASSIGN exp TO exp DO exp                  { Absyn.ForExp({var = Symbol.symbol($2); escape = (ref false); lo = $4; hi = $6 ; body = $8; pos = $startofs}) }
| BREAK                                            { Absyn.BreakExp($startofs) }

| LET decs IN sequence END                         { Absyn.LetExp({decs = $2; body = Absyn.SeqExp($4); pos = $startofs }) }

| LPAREN sequence RPAREN                           { Absyn.SeqExp($2) }
;

field_value_list:
  ID EQ exp                                        { [(Symbol.symbol($1), $3, $startofs)] }
| ID EQ exp COMMA field_value_list                 { (Symbol.symbol($1), $3, $startofs) :: $5 }
;

lvalue:
  ID lvaluetail                                    { $2(Absyn.SimpleVar(Symbol.symbol($1), $startofs)) }
;

lvaluetail:
                                                    { fun x -> x }
| DOT ID lvaluetail                                 { fun var -> $3(Absyn.FieldVar(var, Symbol.symbol($2), $startofs)) }
| LBRACK exp RBRACK lvaluetail                      { fun var -> $4(Absyn.SubscriptVar(var, $2, $startofs)) }

fields:
  /* empty */                                       {[]}
  | ID COLON ID tyfieldstail                        { (Absyn.Field {name = Symbol.symbol($1);
								    escape = (ref false);
								    typ = Symbol.symbol($3);
								    pos = $startofs}) :: $4 }
;

tyfieldstail :  {[]}
| COMMA ID COLON ID tyfieldstail { (Absyn.Field {name = Symbol.symbol($2); escape = (ref false);
                                    typ = Symbol.symbol($4); pos = $startofs($2)}) :: $5 }

sequence:
  /* empty */                                      { []}
| exp                                              { ($1, $startofs) :: [] }
| exp SEMI sequence_rest                           { ($1, $startofs) :: $3 }
;

sequence_rest:
  exp                                              { ($1, $startofs) :: [] }
| exp SEMI sequence_rest                           { ($1, $startofs) :: $3 }
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
| COLON ID                                         { Some (Symbol.symbol($2), $startofs($2)) }

varDec:
  VAR ID type_opt ASSIGN exp                 { Absyn.VarDec({name = Symbol.symbol($2); escape = (ref false);
                                                              order = ref dumb_order; typ = $3;
                                                              init = $5; pos = $startofs}) }
;

functionDec:
  FUNCTION ID LPAREN fields RPAREN type_opt EQ exp { Absyn.FunctionDec([Absyn.Func { name = Symbol.symbol($2); params = $4;
                                                      result = $6; body = $8; pos = $startofs}]) }
| functionDec FUNCTION ID LPAREN fields RPAREN type_opt EQ exp { addFuncDec ($1, 
                                                                  Absyn.Func { name = Symbol.symbol($3); params = $5;
                                                                        result = $7; body = $9; pos = $startofs($2)}) }
;

typeDec:
  TYPE ID EQ ty                                    { Absyn.TypeDec([Absyn.Type { name = Symbol.symbol($2); ty = $4; pos = $startofs }]) }
| typeDec TYPE ID EQ ty                             { addTypeDec ($1, Absyn.Type { name = Symbol.symbol($3); ty = $5; pos = $startofs }) }
;



ty:
  ID                                               { Absyn.NameTy (Symbol.symbol($1), $startofs) }
| LBRACE fields RBRACE                             { Absyn.RecordTy $2 }
| ARRAY OF ID                                      { Absyn.ArrayTy (Symbol.symbol($3), $startofs) }
| ty ARROW ty                                      { Absyn.FuncTy([$1], $3 , $startofs) }
| LPAREN typeArgs RPAREN ARROW ty                  { Absyn.FuncTy($2, $5, $startofs) }
;

typeArgs:
  /* empty */                                     { [] }
| ty                                              { [$1] }
| ty COMMA typeArgs                               { $1 :: $3 }
;

decs: dec decs                        {$1 :: $2 }
| /*empty*/                           {[]}

dec:
  varDec                              { $1 }
| functionDec                         { $1 }
| typeDec                             { $1 }
;




%%
