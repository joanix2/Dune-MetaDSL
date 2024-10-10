open Sedlexing
open Parser

(* Exception pour signaler une erreur de lexing avec un message détaillé *)
exception Error of string

(* Fonction pour obtenir la position actuelle du lexer (ligne et colonne) *)
let print_position lexbuf =
  let (_, curr_pos) = Sedlexing.lexing_positions lexbuf in
  Printf.sprintf "line %d, character %d"
    curr_pos.pos_lnum (curr_pos.pos_cnum - curr_pos.pos_bol + 1)

(* Définition des classes de caractères pour faciliter la capture des tokens *)
let digit = [%sedlex.regexp? '0'..'9']
let hex_digit = [%sedlex.regexp? '0'..'9' | 'A'..'F' | 'a'..'f']
let letter = [%sedlex.regexp? 'A'..'Z' | 'a'..'z' | '_']
let ident_char = [%sedlex.regexp? letter | '0'..'9' | '\'' | '_']

(* Fonction principale pour capturer les tokens dans le fichier source *)
let rec token lexbuf =
  match%sedlex lexbuf with
  | Plus (' ' | '\t' | '\n') -> token lexbuf  (* Ignorer les espaces et les sauts de ligne *)
  | "//", Star (Compl ('\n')), Opt '\n' -> token lexbuf  (* Commentaires sur une ligne *)
  
  (* Mots-clés réservés *)
  | "const" -> CONST
  | "roles" -> ROLES
  | "models" -> MODELS
  | "init" -> INIT

  (* Options spécifiques à ton DSL *)
  | "role"        -> ROLE
  | "user"        -> USER
  | "primary"     -> PRIMARY
  | "email"       -> EMAIL
  | "unique"      -> UNIQUE
  | "required"    -> REQUIRED
  | "password"    -> PASSWORD
  | "visible"     -> VISIBLE
  | "one_to_one"  -> ONE_TO_ONE
  | "many_to_one" -> MANY_TO_ONE
  | "many_to_many" -> MANY_TO_MANY

  (* Symboles et opérateurs *)
  | "==" -> EQEQ
  | "=" -> EQUAL
  | ":" -> COLON
  | ";" -> SEMICOLON
  | "," -> COMMA
  | "{" -> LBRACE
  | "}" -> RBRACE
  | "[" -> LBRACKET
  | "]" -> RBRACKET
  | "(" -> LPAREN
  | ")" -> RPAREN
  
  (* Identifiants et nombres *)
  | "0x", Plus hex_digit -> HEX_NUMBER (Utf8.lexeme lexbuf)
  | Plus digit -> NUMBER (int_of_string (Utf8.lexeme lexbuf))
  | '"', Star (Compl '"'), '"' ->
      let str = Utf8.lexeme lexbuf in
      STRING (String.sub str 1 (String.length str - 2))
  | letter, Star ident_char -> IDENT (Utf8.lexeme lexbuf)
  
  (* Fin de fichier *)
  | eof -> EOF
  
  (* Erreurs de lexing *)
  | _ ->
      let char = Utf8.lexeme lexbuf in
      let pos = print_position lexbuf in
      raise (Error (Printf.sprintf "Unknown character '%s' at %s" char pos))

(* Fonction principale du lexer utilisée par le parseur *)
let lexer lexbuf = token lexbuf
