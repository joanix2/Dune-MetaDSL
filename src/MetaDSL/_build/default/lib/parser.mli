
(* The type of tokens. *)

type token = 
  | VISIBLE
  | USER
  | UNIQUE
  | STRING of (string)
  | SEMICOLON
  | RPAREN
  | ROLES
  | ROLE
  | REQUIRED
  | RBRACKET
  | RBRACE
  | PRIMARY
  | PASSWORD
  | ONE_TO_ONE
  | NUMBER of (int)
  | MODELS
  | MANY_TO_ONE
  | MANY_TO_MANY
  | LPAREN
  | LBRACKET
  | LBRACE
  | INIT
  | IDENT of (string)
  | HEX_NUMBER of (string)
  | EQUAL
  | EQEQ
  | EOF
  | EMAIL
  | CONST
  | COMMA
  | COLON

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.program)
