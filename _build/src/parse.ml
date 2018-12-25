
open Prabsyn

let display_ast lexbuf =
  let ast = Parser.program Lexer.token lexbuf in
  print_endline (expr_to_string ast)

let () =
  let num_args = Array.length Sys.argv in
  let in_ch = open_in Sys.argv.(0) in
  try
    let lexbuf = Lexing.from_channel in_ch in
    lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = Sys.argv.(i) };
    display_ast lexbuf;
    close_in in_ch
  with e ->
    close_in_noerr in_ch