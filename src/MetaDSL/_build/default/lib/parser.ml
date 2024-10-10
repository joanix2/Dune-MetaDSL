
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VISIBLE
    | USER
    | UNIQUE
    | STRING of (
# 10 "lib/parser.mly"
       (string)
# 18 "lib/parser.ml"
  )
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
    | NUMBER of (
# 11 "lib/parser.mly"
       (int)
# 33 "lib/parser.ml"
  )
    | MODELS
    | MANY_TO_ONE
    | MANY_TO_MANY
    | LPAREN
    | LBRACKET
    | LBRACE
    | INIT
    | IDENT of (
# 10 "lib/parser.mly"
       (string)
# 45 "lib/parser.ml"
  )
    | HEX_NUMBER of (
# 10 "lib/parser.mly"
       (string)
# 50 "lib/parser.ml"
  )
    | EQUAL
    | EQEQ
    | EOF
    | EMAIL
    | CONST
    | COMMA
    | COLON
  
end

include MenhirBasics

# 1 "lib/parser.mly"
  
  open Ast

# 68 "lib/parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState02 : ('s, _menhir_box_program) _menhir_state
    (** State 02.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState05 : (('s, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 05.
        Stack shape : HEX_NUMBER IDENT.
        Start symbol: program. *)

  | MenhirState19 : ((('s, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options, _menhir_box_program) _menhir_state
    (** State 19.
        Stack shape : HEX_NUMBER IDENT field_options.
        Start symbol: program. *)

  | MenhirState24 : (('s, _menhir_box_program) _menhir_cell1_IDENT _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 24.
        Stack shape : IDENT IDENT.
        Start symbol: program. *)

  | MenhirState28 : (('s _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options, _menhir_box_program) _menhir_state
    (** State 28.
        Stack shape : IDENT field_options.
        Start symbol: program. *)

  | MenhirState31 : (((('s, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options, _menhir_box_program) _menhir_cell1_field_decls, _menhir_box_program) _menhir_state
    (** State 31.
        Stack shape : HEX_NUMBER IDENT field_options field_decls.
        Start symbol: program. *)

  | MenhirState35 : (('s, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_state
    (** State 35.
        Stack shape : HEX_NUMBER IDENT.
        Start symbol: program. *)

  | MenhirState36 : ((('s, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_decls, _menhir_box_program) _menhir_state
    (** State 36.
        Stack shape : HEX_NUMBER IDENT field_decls.
        Start symbol: program. *)

  | MenhirState38 : (('s, _menhir_box_program) _menhir_cell1_model_decls, _menhir_box_program) _menhir_state
    (** State 38.
        Stack shape : model_decls.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_field_decls = 
  | MenhirCell1_field_decls of 's * ('s, 'r) _menhir_state * (Ast.field_decl list)

and ('s, 'r) _menhir_cell1_field_options = 
  | MenhirCell1_field_options of 's * ('s, 'r) _menhir_state * (Ast.field_option list)

and ('s, 'r) _menhir_cell1_model_decls = 
  | MenhirCell1_model_decls of 's * ('s, 'r) _menhir_state * (Ast.model_decl list)

and ('s, 'r) _menhir_cell1_HEX_NUMBER = 
  | MenhirCell1_HEX_NUMBER of 's * ('s, 'r) _menhir_state * (
# 10 "lib/parser.mly"
       (string)
# 130 "lib/parser.ml"
)

and ('s, 'r) _menhir_cell1_IDENT = 
  | MenhirCell1_IDENT of 's * ('s, 'r) _menhir_state * (
# 10 "lib/parser.mly"
       (string)
# 137 "lib/parser.ml"
)

and 's _menhir_cell0_IDENT = 
  | MenhirCell0_IDENT of 's * (
# 10 "lib/parser.mly"
       (string)
# 144 "lib/parser.ml"
)

and _menhir_box_program = 
  | MenhirBox_program of (Ast.program) [@@unboxed]

let _menhir_action_01 =
  fun _1 _3 ->
    (
# 41 "lib/parser.mly"
                                ( FieldDecl(_1, _3, []) )
# 155 "lib/parser.ml"
     : (Ast.field_decl))

let _menhir_action_02 =
  fun _1 _3 _5 ->
    (
# 42 "lib/parser.mly"
                                                                ( FieldDecl(_1, _3, _5) )
# 163 "lib/parser.ml"
     : (Ast.field_decl))

let _menhir_action_03 =
  fun _1 ->
    (
# 37 "lib/parser.mly"
               ( [_1] )
# 171 "lib/parser.ml"
     : (Ast.field_decl list))

let _menhir_action_04 =
  fun _1 _2 ->
    (
# 38 "lib/parser.mly"
                           ( _2 :: _1 )
# 179 "lib/parser.ml"
     : (Ast.field_decl list))

let _menhir_action_05 =
  fun () ->
    (
# 49 "lib/parser.mly"
         ( Ast.Role )
# 187 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_06 =
  fun () ->
    (
# 50 "lib/parser.mly"
         ( Ast.User )
# 195 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_07 =
  fun () ->
    (
# 51 "lib/parser.mly"
            ( Ast.Primary )
# 203 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_08 =
  fun () ->
    (
# 52 "lib/parser.mly"
          ( Ast.Email )
# 211 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_09 =
  fun () ->
    (
# 53 "lib/parser.mly"
           ( Ast.Unique )
# 219 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_10 =
  fun () ->
    (
# 54 "lib/parser.mly"
             ( Ast.Required )
# 227 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_11 =
  fun () ->
    (
# 55 "lib/parser.mly"
             ( Ast.Password )
# 235 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_12 =
  fun () ->
    (
# 56 "lib/parser.mly"
            ( Ast.Visible )
# 243 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_13 =
  fun () ->
    (
# 57 "lib/parser.mly"
               ( Ast.OneToOne )
# 251 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_14 =
  fun () ->
    (
# 58 "lib/parser.mly"
                ( Ast.ManyToOne )
# 259 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_15 =
  fun () ->
    (
# 59 "lib/parser.mly"
                 ( Ast.ManyToMany )
# 267 "lib/parser.ml"
     : (Ast.field_option))

let _menhir_action_16 =
  fun _1 ->
    (
# 45 "lib/parser.mly"
                 ( [_1] )
# 275 "lib/parser.ml"
     : (Ast.field_option list))

let _menhir_action_17 =
  fun _1 _3 ->
    (
# 46 "lib/parser.mly"
                                     ( _3 :: _1 )
# 283 "lib/parser.ml"
     : (Ast.field_option list))

let _menhir_action_18 =
  fun _1 _2 _4 ->
    (
# 33 "lib/parser.mly"
                                               ( ModelDecl(_1, _2, [], _4) )
# 291 "lib/parser.ml"
     : (Ast.model_decl))

let _menhir_action_19 =
  fun _1 _2 _4 _7 ->
    (
# 34 "lib/parser.mly"
                                                                               ( ModelDecl(_1, _2, _4, _7) )
# 299 "lib/parser.ml"
     : (Ast.model_decl))

let _menhir_action_20 =
  fun _1 ->
    (
# 29 "lib/parser.mly"
               ( [_1] )
# 307 "lib/parser.ml"
     : (Ast.model_decl list))

let _menhir_action_21 =
  fun _1 _2 ->
    (
# 30 "lib/parser.mly"
                           ( _2 :: _1 )
# 315 "lib/parser.ml"
     : (Ast.model_decl list))

let _menhir_action_22 =
  fun _3 ->
    (
# 26 "lib/parser.mly"
                                     ( Program(_3) )
# 323 "lib/parser.ml"
     : (Ast.program))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CONST ->
        "CONST"
    | EMAIL ->
        "EMAIL"
    | EOF ->
        "EOF"
    | EQEQ ->
        "EQEQ"
    | EQUAL ->
        "EQUAL"
    | HEX_NUMBER _ ->
        "HEX_NUMBER"
    | IDENT _ ->
        "IDENT"
    | INIT ->
        "INIT"
    | LBRACE ->
        "LBRACE"
    | LBRACKET ->
        "LBRACKET"
    | LPAREN ->
        "LPAREN"
    | MANY_TO_MANY ->
        "MANY_TO_MANY"
    | MANY_TO_ONE ->
        "MANY_TO_ONE"
    | MODELS ->
        "MODELS"
    | NUMBER _ ->
        "NUMBER"
    | ONE_TO_ONE ->
        "ONE_TO_ONE"
    | PASSWORD ->
        "PASSWORD"
    | PRIMARY ->
        "PRIMARY"
    | RBRACE ->
        "RBRACE"
    | RBRACKET ->
        "RBRACKET"
    | REQUIRED ->
        "REQUIRED"
    | ROLE ->
        "ROLE"
    | ROLES ->
        "ROLES"
    | RPAREN ->
        "RPAREN"
    | SEMICOLON ->
        "SEMICOLON"
    | STRING _ ->
        "STRING"
    | UNIQUE ->
        "UNIQUE"
    | USER ->
        "USER"
    | VISIBLE ->
        "VISIBLE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let rec _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_HEX_NUMBER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENT _v ->
          let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACKET ->
              let _menhir_s = MenhirState05 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VISIBLE ->
                  _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | USER ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | UNIQUE ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ROLE ->
                  _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | REQUIRED ->
                  _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PRIMARY ->
                  _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | PASSWORD ->
                  _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ONE_TO_ONE ->
                  _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MANY_TO_ONE ->
                  _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MANY_TO_MANY ->
                  _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EMAIL ->
                  _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | LBRACE ->
              let _menhir_s = MenhirState35 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_06 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_12 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_field_option : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState05 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState24 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState28 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_30 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_16 _1 in
      _menhir_goto_field_options _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_field_options : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState24 ->
          _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState05 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_25 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_IDENT _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMICOLON ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell0_IDENT (_menhir_stack, _3) = _menhir_stack in
              let MenhirCell1_IDENT (_menhir_stack, _menhir_s, _1) = _menhir_stack in
              let _5 = _v in
              let _v = _menhir_action_02 _1 _3 _5 in
              _menhir_goto_field_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | COMMA ->
          let _menhir_stack = MenhirCell1_field_options (_menhir_stack, _menhir_s, _v) in
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_goto_field_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState35 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState36 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState31 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_03 _1 in
      _menhir_goto_field_decls _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_field_decls : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState35 ->
          _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState19 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_36 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_HEX_NUMBER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_18 _1 _2 _4 in
          _menhir_goto_model_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_field_decls (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState36
      | _ ->
          _eRR ()
  
  and _menhir_goto_model_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState02 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState38 ->
          _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_41 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_20 _1 in
      _menhir_goto_model_decls _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_model_decls : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _3 = _v in
          let _v = _menhir_action_22 _3 in
          MenhirBox_program _v
      | HEX_NUMBER _v_0 ->
          let _menhir_stack = MenhirCell1_model_decls (_menhir_stack, _menhir_s, _v) in
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState38
      | _ ->
          _eRR ()
  
  and _menhir_run_40 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_model_decls -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_model_decls (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_21 _1 _2 in
      _menhir_goto_model_decls _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_20 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENT _v_0 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMICOLON ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_1, _3) = (_v, _v_0) in
                  let _v = _menhir_action_01 _1 _3 in
                  _menhir_goto_field_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | LBRACKET ->
                  let _menhir_stack = MenhirCell1_IDENT (_menhir_stack, _menhir_s, _v) in
                  let _menhir_stack = MenhirCell0_IDENT (_menhir_stack, _v_0) in
                  let _menhir_s = MenhirState24 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | VISIBLE ->
                      _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | USER ->
                      _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | UNIQUE ->
                      _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ROLE ->
                      _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | REQUIRED ->
                      _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | PRIMARY ->
                      _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | PASSWORD ->
                      _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | ONE_TO_ONE ->
                      _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | MANY_TO_ONE ->
                      _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | MANY_TO_MANY ->
                      _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | EMAIL ->
                      _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_06 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_09 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_09 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_05 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_10 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_07 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_12 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_11 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_13 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_14 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_14 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_15 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_15 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _v = _menhir_action_08 () in
      _menhir_goto_field_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_31 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RBRACE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_field_options (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_IDENT (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_HEX_NUMBER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _7 = _v in
          let _v = _menhir_action_19 _1 _2 _4 _7 in
          _menhir_goto_model_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | IDENT _v_0 ->
          let _menhir_stack = MenhirCell1_field_decls (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState31
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_field_decls -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_field_decls (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_04 _1 _2 in
      _menhir_goto_field_decls _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState28 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VISIBLE ->
          _menhir_run_06 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | USER ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | UNIQUE ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ROLE ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REQUIRED ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PRIMARY ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | PASSWORD ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ONE_TO_ONE ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MANY_TO_ONE ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MANY_TO_MANY ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EMAIL ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_HEX_NUMBER _menhir_cell0_IDENT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_field_options (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RBRACKET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              let _menhir_s = MenhirState19 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENT _v ->
                  _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | COMMA ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack _menhir_cell0_IDENT, _menhir_box_program) _menhir_cell1_field_options -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_field_options (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_17 _1 _3 in
      _menhir_goto_field_options _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | MODELS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACE ->
              let _menhir_s = MenhirState02 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | HEX_NUMBER _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
