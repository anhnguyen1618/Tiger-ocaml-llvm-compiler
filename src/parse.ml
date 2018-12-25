
open Absyn

let display_ast lexbuf =
  let ast = Parser.program Lexer.lex_tiger lexbuf in
  Weeder.assert_break ast;
  print_endline (expr_to_string ast)

let () =
  let num_args = Array.length Sys.argv in
  if num_args = 1 then
    let lexbuf = Lexing.from_channel stdin in
    display_ast lexbuf
  else
    for i = 1 to num_args - 1 do
      let in_ch = open_in Sys.argv.(i) in
      try
        let lexbuf = Lexing.from_channel in_ch in
        lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = Sys.argv.(i) };
        display_ast lexbuf;
        close_in in_ch
      with e ->
        close_in_noerr in_ch
    done