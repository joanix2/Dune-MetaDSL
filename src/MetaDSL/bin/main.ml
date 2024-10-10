open Meta_dsl_lib.Lexer
open Meta_dsl_lib.Parser
open Meta_dsl_lib.Ast
open Printf
open Sedlexing
open Sys
open Array

(* Fonction pour lire le contenu d'un fichier *)
let read_file filename =
  let chan = open_in filename in
  let len = in_channel_length chan in
  let content = really_input_string chan len in
  close_in chan;
  content

(* Fonction pour afficher les tokens un par un *)
let rec print_tokens lexbuf =
  match lexer lexbuf with
  | EOF -> print_endline "End of File"
  | token ->
      printf "Token: %s\n" (
        match token with
        | CONST -> "CONST"
        | ROLES -> "ROLES"
        | MODELS -> "MODELS"
        | INIT -> "INIT"
        | ROLE -> "ROLE"
        | USER -> "USER"
        | PRIMARY -> "PRIMARY"
        | EMAIL -> "EMAIL"
        | UNIQUE -> "UNIQUE"
        | REQUIRED -> "REQUIRED"
        | PASSWORD -> "PASSWORD"
        | VISIBLE -> "VISIBLE"
        | ONE_TO_ONE -> "ONE_TO_ONE"
        | MANY_TO_ONE -> "MANY_TO_ONE"
        | MANY_TO_MANY -> "MANY_TO_MANY"
        | IDENT id -> sprintf "IDENT(%s)" id
        | STRING s -> sprintf "STRING(%s)" s
        | HEX_NUMBER h -> sprintf "HEX_NUMBER(%s)" h
        | NUMBER n -> sprintf "NUMBER(%d)" n
        | LBRACE -> "LBRACE"
        | RBRACE -> "RBRACE"
        | LBRACKET -> "LBRACKET"
        | RBRACKET -> "RBRACKET"
        | LPAREN -> "LPAREN"
        | RPAREN -> "RPAREN"
        | COMMA -> "COMMA"
        | COLON -> "COLON"
        | SEMICOLON -> "SEMICOLON"
        | EQUAL -> "EQUAL"
        | EQEQ -> "EQEQ"
        | _ -> "UNKNOWN"
      );
      print_tokens lexbuf

(* Fonction pour tester le parseur *)
let test_parser lexbuf =
  (* Créer un supplier compatible avec Menhir *)
  let supplier = with_tokenizer token lexbuf in
  try
    (* Appeler le parseur *)
    let ast = program supplier in
    (* Afficher un message de succès *)
    print_endline "Parsing succeeded.";
    (* Optionnellement, afficher l'AST *)
    (* print_endline (Ast.string_of_program ast); *)
  with
  | Error ->
    let (_, curr_pos) = lexing_positions lexbuf in
    printf "Syntax error at line %d, character %d\n"
      curr_pos.pos_lnum (curr_pos.pos_cnum - curr_pos.pos_bol + 1);
    exit 1

(* Fonction principale *)
let () =
  if length argv < 2 then
    printf "Usage: %s <filename>\n" argv.(0)
  else
    let filename = argv.(1) in
    let input = read_file filename in

    (* Créer un lexbuf pour l'analyse lexicale *)
    let lexbuf_tokens = from_string input in
    print_tokens lexbuf_tokens;

    (* Créer un nouveau lexbuf pour l'analyse syntaxique *)
    let lexbuf_parser = from_string input in
    test_parser lexbuf_parser
