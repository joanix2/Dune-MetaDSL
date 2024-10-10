(*

let test_parser () =
  let lexbuf = Sedlexing.Utf8.from_string "2 + 3 * 4" in
  let ast = Parser.main Lexer.token lexbuf in
  match ast with
  | Ast.Add (Ast.Int 2, Ast.Mul (Ast.Int 3, Ast.Int 4)) -> ()
  | _ -> assert false

let () = test_parser ()

*)