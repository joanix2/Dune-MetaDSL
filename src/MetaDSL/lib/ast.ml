type field_option =
  | Role
  | User
  | Primary
  | Email
  | Unique
  | Required
  | Password
  | Visible
  | OneToOne
  | ManyToOne
  | ManyToMany

type field_decl = FieldDecl of string * string * field_option list

type model_decl = ModelDecl of string * string * field_option list * field_decl list

type program = Program of model_decl list