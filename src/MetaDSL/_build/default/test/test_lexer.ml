open Meta_dsl_lib.Lexer
open Meta_dsl_lib.Parser
open Printf
open Sedlexing.Utf8

(* Fonction pour lire le contenu d'un fichier *)
let read_file filename =
  let chan = open_in filename in
  let len = in_channel_length chan in
  let content = really_input_string chan len in
  close_in chan;
  content

(* Fonction pour afficher les tokens un par un *)
let rec print_tokens lexbuf =
  match token lexbuf with
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

(* Fonction principale *)
let () =
  let filename = "test/models_test.mdsl" in
  let input = read_file filename in
  let lexbuf = from_string input in
  print_tokens lexbuf
