%{
  open Ast
%}

%token CONST ROLES MODELS INIT
%token ROLE USER PRIMARY EMAIL UNIQUE REQUIRED PASSWORD VISIBLE
%token ONE_TO_ONE MANY_TO_ONE MANY_TO_MANY
%token LBRACE RBRACE LBRACKET RBRACKET LPAREN RPAREN
%token COMMA COLON SEMICOLON EQUAL EQEQ
%token <string> IDENT STRING HEX_NUMBER
%token <int> NUMBER
%token EOF

%start program
%type <Ast.program> program
%type <Ast.model_decl list> model_decls
%type <Ast.model_decl> model_decl
%type <Ast.field_decl list> field_decls
%type <Ast.field_decl> field_decl
%type <Ast.field_option list> field_options
%type <Ast.field_option> field_option

%%

program:
  | MODELS LBRACE model_decls RBRACE { Program($3) }

model_decls:
  | model_decl { [$1] }
  | model_decls model_decl { $2 :: $1 }

model_decl:
  | HEX_NUMBER IDENT LBRACE field_decls RBRACE { ModelDecl($1, $2, [], $4) }
  | HEX_NUMBER IDENT LBRACKET field_options RBRACKET LBRACE field_decls RBRACE { ModelDecl($1, $2, $4, $7) }

field_decls:
  | field_decl { [$1] }
  | field_decls field_decl { $2 :: $1 }

field_decl:
  | IDENT COLON IDENT SEMICOLON { FieldDecl($1, $3, []) }
  | IDENT COLON IDENT LBRACKET field_options RBRACKET SEMICOLON { FieldDecl($1, $3, $5) }

field_options:
  | field_option { [$1] }
  | field_options COMMA field_option { $3 :: $1 }

field_option:
  | ROLE { Ast.Role }
  | USER { Ast.User }
  | PRIMARY { Ast.Primary }
  | EMAIL { Ast.Email }
  | UNIQUE { Ast.Unique }
  | REQUIRED { Ast.Required }
  | PASSWORD { Ast.Password }
  | VISIBLE { Ast.Visible }
  | ONE_TO_ONE { Ast.OneToOne }
  | MANY_TO_ONE { Ast.ManyToOne }
  | MANY_TO_MANY { Ast.ManyToMany }
