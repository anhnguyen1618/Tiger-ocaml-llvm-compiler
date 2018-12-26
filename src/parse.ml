
open Prabsyn

let display_ast lexbuf =
  let ast = Parser.prog Lexer.token lexbuf in
  print_endline (expr_to_string ast)

let () =
  let in_ch = open_in Sys.argv.(1) in
  print_string "run into here";
  try
    let lexbuf = Lexing.from_channel in_ch in
    lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = Sys.argv.(1) };
    print_string "runhere";
    display_ast lexbuf;
    close_in in_ch
  with e ->
    print_string "runhere";
    close_in_noerr in_ch
