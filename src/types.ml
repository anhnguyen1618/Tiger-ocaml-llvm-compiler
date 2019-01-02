module S = Symbol
type unique = Temp.temp

type ty = 
  RECORD of (Symbol.symbol * ty) list * unique
| NIL
| INT
| STRING
| ARRAY of int * ty
| NAME of Symbol.symbol * ty option ref
| UNIT
| INT_POINTER
| RECORD_ALLOC of (Symbol.symbol * ty) list * unique
| ARRAY_ALLOC of int * ty
| STRING_POINTER

  
type comp = 
  LT
| GT
| EQ
| INCOMP (* incomparable *)

let rec leq = function
  | (_, UNIT) -> true
  | (NIL, RECORD(_)) -> true
  | (RECORD(_), NIL) -> true 
  | (INT, INT) -> true
  | (STRING, STRING) -> true
  | (RECORD(_, unique1), RECORD(_, unique2)) -> (unique1 = unique2)
  | (ARRAY(left_size, left_ty), ARRAY(right_size, right_ty)) -> left_size = right_size && eq(left_ty, right_ty)
  | (NIL, NIL) -> true
  | (NAME(sym1, _), NAME(sym2, _)) -> S.name(sym1) = S.name(sym2)
  | (_, _) -> false

and comp (t1, t2) = 
  if leq(t1, t2) && leq(t2, t1)
  then EQ
  else if leq(t1, t2)
  then LT
  else if leq(t2, t1)
  then GT
  else
    INCOMP

and eq (t1, t2) = 
  comp(t1, t2) = EQ

let rec printTy = function
  | RECORD(_, _) -> print_string "type is record\n"
  | NIL -> print_string "type is nil\n"
  | INT -> print_string "type is int\n"
  | STRING -> print_string "type is string\n"
  | (ARRAY(arrTy, _) as ty) -> print_string "array: ";
                               printTy(ty)
  | NAME(sym, _) -> print_string ("name type is " ^ Symbol.name sym ^ "\n")
  | UNIT -> print_string "type is unit\n"
  | _ -> ()

let rec name = function
  | RECORD(_, _) -> "record"
  | NIL -> "nil"
  | INT -> "int"
  | STRING -> "string"
  | ARRAY(size, arrTy) -> "array: " ^ "[ " ^ string_of_int(size) ^ " ]" ^ name(arrTy)
  | NAME(sym, _) -> Symbol.name sym
  | UNIT -> "unit"
  | _ -> ""
    
