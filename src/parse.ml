open Prabsyn
open Lexing
open Lexer
open Error

let print_position lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  print_string (Printf.sprintf "Syntax error %C at: %s:%d:%d" (Lexing.lexeme_char lexbuf 0) pos.pos_fname
  pos.Lexing.pos_lnum (pos.pos_cnum - pos.pos_bol + 1))

let display_ast lexbuf =
  try
      let ast = Parser.prog Lexer.token lexbuf in
      print_endline (expr_to_string ast)
  with e ->
     print_position lexbuf;
     exit (-1)

let () =
  let file_name = Sys.argv.(1) in
  let in_ch = open_in file_name in
  try
    let lexbuf = Lexing.from_channel in_ch in
    Error.file_name := file_name;
    lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = file_name };
    display_ast lexbuf;
    close_in in_ch
  with e ->
    close_in_noerr in_ch
