open Prabsyn
open Lexing
open Lexer
open Error

let get_error_context lexbuf =
  let rec range a b result = if b >= a then range a (b-1) (b::result) else result in
  let indexes = range 0 5 [] in
  let context = List.map (fun i -> i |> Lexing.lexeme_char lexbuf |> Printf.sprintf "%c") indexes |> String.concat "" in
  context
  
let print_position lexbuf =
  let pos = lexbuf.Lexing.lex_curr_p in
  let error_context = get_error_context lexbuf in
  let error_message = Printf.sprintf "Syntax error %C at '%s'\n" (Lexing.lexeme_char lexbuf 5) error_context in
  Error.error pos.pos_cnum error_message

let display_ast lexbuf =
  try
    let ast = Parser.prog Lexer.token lexbuf in
    (*Semant.trans_prog(ast); *)
    (*print_endline (expr_to_string ast);*)
    ast
  with e ->
     print_position lexbuf;
     exit (-1)

let () =
  let file_name = Sys.argv.(1) in
  let in_ch = open_in file_name in
  (*try*)
    let lexbuf = Lexing.from_channel in_ch in
    Error.file_name := file_name;
    lexbuf.Lexing.lex_curr_p <- { lexbuf.Lexing.lex_curr_p with Lexing.pos_fname = file_name };
    let ast = display_ast lexbuf in
    Semant.trans_prog(ast, file_name);
    close_in in_ch
  (*with e ->
    close_in_noerr in_ch*)
