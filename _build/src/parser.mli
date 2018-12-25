
(* The type of tokens. *)

type token = 
  | WHILE
  | VAR
  | UMINUS
  | TYPE
  | TO
  | TIMES
  | THEN
  | STRING of (string)
  | SEMI
  | RPAREN
  | RBRACK
  | RBRACE
  | PLUS
  | OR
  | OF
  | NIL
  | NEQ
  | MINUS
  | LT
  | LPAREN
  | LET
  | LE
  | LBRACK
  | LBRACE
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | GT
  | GE
  | FUNCTION
  | FOR
  | EQ
  | END
  | ELSE
  | DOT
  | DO
  | DIVIDE
  | COMMA
  | COLON
  | BREAK
  | ASSIGN
  | ARRAY
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (A.exp)
