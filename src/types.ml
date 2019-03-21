module S = Symbol
type unique = Temp.temp

type ty = 
  RECORD of (Symbol.symbol * ty) list * unique
| NIL
| INT
| STRING
| ARRAY of ty * unique
| ARRAY_POINTER of ty * unique
| NAME of Symbol.symbol * ty option ref
| INT_POINTER
| RECORD_ALLOC of (Symbol.symbol * ty) list * unique
| STRING_POINTER
| GENERIC_ARRAY
| GENERIC_RECORD
| FUNC_CLOSURE of ty list * ty
  
type comp = 
  LT
| GT
| EQ
| INCOMP (* incomparable *)

let rec leq = function
  | (NIL, RECORD(_)) -> true
  | (RECORD(_), NIL) -> true 
  | (INT, INT) -> true
  | (STRING, STRING) -> true
  | (RECORD(_, unique1), RECORD(_, unique2)) -> (unique1 = unique2)
  | (ARRAY(_, unique1), ARRAY(_, unique2)) -> (unique1 = unique2)
  | (NIL, NIL) -> true
  | (NAME(sym1, _), NAME(sym2, _)) -> S.name(sym1) = S.name(sym2)
  | (NAME(_, real_type), t2) ->
     (match !real_type with
     | Some t1 -> leq(t1, t2) && leq(t2, t1)
     | None -> false)
  | (t2, NAME(_, real_type)) ->
     (match !real_type with
     | Some t1 -> leq(t1, t2) && leq(t2, t1)
     | None -> false)
  | (GENERIC_RECORD, RECORD _) -> true
  | (RECORD _, GENERIC_RECORD) -> true                       
  | (GENERIC_ARRAY, ARRAY _) -> true
  | (ARRAY _, GENERIC_ARRAY) -> true
  | (FUNC_CLOSURE(first_args, first_ret), FUNC_CLOSURE(second_args, second_ret)) ->
     List.length(first_args) = List.length(second_args)
     && List.fold_left2
          (fun acc first sec -> acc && leq(first, sec) && leq(sec, first) )
          true
          (first_ret::first_args)
          (second_ret::second_args)
  | (_, _) -> false
                      
let comp (t1, t2) = 
  if leq(t1, t2) && leq(t2, t1)
  then EQ
  else if leq(t1, t2)
  then LT
  else if leq(t2, t1)
  then GT
  else
    INCOMP

let eq (t1, t2) = 
  comp(t1, t2) = EQ

let rec printTy = function
  | RECORD(_, _) -> print_string "type is record\n"
  | NIL -> print_string "type is nil\n"
  | INT -> print_string "type is int\n"
  | STRING -> print_string "type is string\n"
  | (ARRAY(arrTy, _)) -> print_string "array: ";
                               printTy(arrTy)
  | NAME(sym, _) -> print_string ("name type is " ^ Symbol.name sym ^ "\n")
  | _ -> ()

let rec name = function
  | RECORD(_, _) -> "record"
  | NIL -> "nil"
  | INT -> "int"
  | STRING -> "string"
  | ARRAY(arrTy, _) -> "array: " ^ name(arrTy)
  | NAME(sym, _) -> Symbol.name sym
  | _ -> ""
    
