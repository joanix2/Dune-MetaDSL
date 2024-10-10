(*

open Ast

let rec eval = function
  | Int n -> n
  | Add (x, y) -> eval x + eval y
  | Mul (x, y) -> eval x * eval y

*)