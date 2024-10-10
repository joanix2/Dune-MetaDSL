open Ast

(* Fonction auxiliaire pour convertir les types *)
let convert_type_to_csharp = function
  | "string" -> "string"
  | "uuid" -> "Guid"
  | "int" -> "int"
  | other -> other  (* Pour les types personnalisés *)

let convert_type_to_typescript = function
  | "string" -> "string"
  | "uuid" -> "string"
  | "int" -> "number"
  | other -> other  (* Pour les types personnalisés *)

(* Génération du code C# *)
let generate_csharp models =
  let buffer = Buffer.create 1024 in
  let indent = ref 0 in

  let ind () = String.make (!indent * 4) ' ' in

  let rec generate_field field =
    let field_type = convert_type_to_csharp field.field_type in
    let field_name = field.field_name in
    let options = field.options in
    let attrs = ref [] in

    List.iter (function
      | Primary -> attrs := "[Key]" :: !attrs
      | Required -> attrs := "[Required]" :: !attrs
      | Email -> attrs := "[EmailAddress]" :: !attrs
      | Unique -> attrs := "[Index(IsUnique = true)]" :: !attrs
      | Password -> attrs := "[DataType(DataType.Password)]" :: !attrs
      | Visible -> ()  (* Gestion personnalisée *)
      | Auto -> ()     (* À gérer selon le contexte *)
      | _ -> ()
    ) options;

    let attr_str = String.concat "\n" (List.rev_map (fun attr -> ind () ^ attr) !attrs) in
    let prop_str = ind () ^ sprintf "public %s %s { get; set; }" field_type field_name in
    Buffer.add_string buffer (attr_str ^ "\n" ^ prop_str ^ "\n\n")
  in

  let generate_model model =
    Buffer.add_string buffer (sprintf "public class %s\n{\n" model.model_name);
    indent := !indent + 1;
    List.iter generate_field model.fields;
    indent := !indent - 1;
    Buffer.add_string buffer "}\n\n"
  in

  List.iter generate_model models;
  Buffer.contents buffer

(* Génération du code TypeScript *)
let generate_typescript models =
  let buffer = Buffer.create 1024 in
  let indent = ref 0 in

  let ind () = String.make (!indent * 2) ' ' in

  let rec generate_field field =
    let field_type = convert_type_to_typescript field.field_type in
    let field_name = field.field_name in
    let readonly = if List.exists (function Primary | Auto -> true | _ -> false) field.options then "readonly " else "" in
    let prop_str = ind () ^ sprintf "public %s%s: %s;" readonly field_name field_type in
    Buffer.add_string buffer (prop_str ^ "\n")
  in

  let generate_model model =
    Buffer.add_string buffer (sprintf "export class %s {\n" model.model_name);
    indent := !indent + 1;
    List.iter generate_field model.fields;
    indent := !indent - 1;
    Buffer.add_string buffer "}\n\n"
  in

  List.iter generate_model models;
  Buffer.contents buffer

