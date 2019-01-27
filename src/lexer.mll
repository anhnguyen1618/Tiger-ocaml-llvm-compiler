{
open Error
module P = Parser

exception Eof

let incr_linenum lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  Error.line_num := !Error.line_num + 1;
  Error.line_pos := pos.Lexing.pos_cnum :: (!(Error.line_pos))

let str_incr_linenum str lexbuf =
  String.iter (function '\n' -> incr_linenum lexbuf
  	      		| _ -> ()) str

let append_char str ch =
  str ^ (String.make 1 (Char.chr ch))

}

let alpha = ['a'-'z' 'A'-'Z']
let digit = ['0'-'9']
let id = alpha+ (alpha|digit|'_')*

rule comment level = parse
    "*/" { match level with
    	   | 0 -> token lexbuf
	   | level -> comment (level - 1) lexbuf
	 }
  | "/*" { comment (level + 1) lexbuf }
  | '\n' { incr_linenum lexbuf;
           comment level lexbuf
         }
  | _    { comment level lexbuf }
  | eof  { Error.error lexbuf.Lexing.lex_start_pos "Unterminated comment";
           token lexbuf
         }

and string pos buf = parse
    '"'                               { lexbuf.Lexing.lex_start_p <- pos;
                                        P.STRING buf
                                      }
  | "\\n"                             { string pos (buf ^ "\n") lexbuf }
  | "\\t"                             { string pos (buf ^ "\t") lexbuf }
  | "\\\""                            { string pos (buf ^ "\"") lexbuf }
  | "\\\\"                            { string pos (buf ^ "\\") lexbuf }
  | "\\^" (['@' 'A'-'Z'] as x)        { string pos (append_char buf (Char.code x - Char.code '@')) lexbuf }
  | "\\^" (['a'-'z'] as x)            { string pos (append_char buf (Char.code x - Char.code 'a' + 1)) lexbuf }
  | "\\" (digit digit digit as x)     { string pos (append_char buf (int_of_string x)) lexbuf }
  | "\\" ([' ' '\t' '\n']+ as x) "\\" { str_incr_linenum x lexbuf;
                                        string pos buf lexbuf
                                      }
  | "\\" 			      { Error.error lexbuf.Lexing.lex_start_pos "Illegal_escape";
                                        string pos buf lexbuf
                                      }
  | [^ '\\' '"']+ as x                { str_incr_linenum x lexbuf;
                                        string pos (buf ^ x) lexbuf
                                      }
  | eof                               { Error.error lexbuf.Lexing.lex_start_pos "Unterminated string";
                                        token lexbuf
                                      }

and token = parse
    [' ' '\t']    { token lexbuf }
  | '\n'	  { incr_linenum lexbuf; token lexbuf }
  | "/*"          { comment 0 lexbuf }
  | '"'           { string lexbuf.Lexing.lex_start_p "" lexbuf }
  | "array"	  { P.ARRAY }
  | "break"	  { P.BREAK }
  | "do"	  { P.DO }
  | "else"	  { P.ELSE }
  | "end"	  { P.END }
  | "for"	  { P.FOR }
  | "function"	  { P.FUNCTION }
  | "if"	  { P.IF }
  | "in"	  { P.IN }
  | "let"	  { P.LET }
  | "nil"	  { P.NIL }
  | "of"	  { P.OF }
  | "then"	  { P.THEN }
  | "to"	  { P.TO }
  | "type"	  { P.TYPE }
  | "var"	  { P.VAR }
  | "while"	  { P.WHILE }
  | digit+ as lxm { P.INT (int_of_string lxm) }
  | id as lxm	  { P.ID lxm }
  | ":="	  { P.ASSIGN }
  | '|'		  { P.OR }
  | '&'		  { P.AND }
  | '='		  { P.EQ }
  | "<>"	  { P.NEQ }
  | '<'		  { P.LT }
  | "<="	  { P.LE }
  | '>'		  { P.GT }
  | ">="	  { P.GE }
  | '+'		  { P.PLUS }
  | '-'		  { P.MINUS }
  | '*'		  { P.TIMES }
  | '/'		  { P.DIVIDE }
  | '('		  { P.LPAREN }
  | ')'		  { P.RPAREN }
  | '['		  { P.LBRACK }
  | ']'		  { P.RBRACK }
  | '{'           { P.LBRACE }
  | '}'		  { P.RBRACE }
  | '.'		  { P.DOT }
  | ':'		  { P.COLON }
  | ','		  { P.COMMA }
  | ';'		  { P.SEMI }
  | eof		  { P.EOF }
  | _	  { 
    		    print_string "Special charactor is \n";
		        print_string (Printf.sprintf "%C\n" (Lexing.lexeme_char lexbuf 0));
		        Error.error lexbuf.Lexing.lex_start_pos ("Illegal_charac");
                    token lexbuf
                  }

{

let string_of_token = function
    P.INT x    -> "INT(" ^ string_of_int x ^ ")"
  | P.STRING x -> "STRING(" ^ x ^ ")"
  | P.ID x     -> "ID(" ^ x ^ ")"
  | P.FOR      -> "FOR"
  | P.WHILE    -> "WHILE"
  | P.BREAK    -> "BREAK"
  | P.LET      -> "LET"
  | P.IN       -> "IN"
  | P.NIL      -> "NIL"
  | P.TO       -> "TO"
  | P.END      -> "END"
  | P.FUNCTION -> "FUNCTION"
  | P.VAR      -> "VAR"
  | P.TYPE     -> "TYPE"
  | P.ARRAY    -> "ARRAY"
  | P.IF       -> "IF"
  | P.THEN     -> "THEN"
  | P.ELSE     -> "ELSE"
  | P.DO       -> "DO"
  | P.OF       -> "OF"
  | P.LPAREN   -> "LPAREN"
  | P.RPAREN   -> "RPAREN"
  | P.LBRACK   -> "LBRACK"
  | P.RBRACK   -> "RBRACK"
  | P.LBRACE   -> "LBRACE"
  | P.RBRACE   -> "RBRACE"
  | P.ASSIGN   -> "ASSIGN"
  | P.DOT      -> "DOT"
  | P.COLON    -> "COLON"
  | P.COMMA    -> "COMMA"
  | P.SEMI     -> "SEMI"
  | P.OR       -> "OR"
  | P.AND      -> "AND"
  | P.EQ       -> "EQ"
  | P.NEQ      -> "NE"
  | P.LT       -> "LT"
  | P.LE       -> "LE"
  | P.GT       -> "GT"
  | P.GE       -> "GE"
  | P.PLUS     -> "PLUS"
  | P.MINUS    -> "MINUS"
  | P.TIMES    -> "TIMES"
  | P.DIVIDE   -> "DIV"
  | P.UMINUS   -> "UMINUS"
  | P.EOF      -> "EOF"

}