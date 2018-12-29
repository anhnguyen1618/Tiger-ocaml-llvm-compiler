type level
type access
type exp
   
val outermost: level

val nil_exp: exp

val alloc_local: level -> bool -> string -> Types.ty -> access

val assign_stm: (*access*) exp -> exp -> unit

val simple_var: access -> string -> exp

val int_exp: int -> exp

val string_exp: string -> exp

val break_exp: 'a -> exp

val array_exp: exp -> exp -> exp

val func_call_exp: string -> exp list -> exp
      
val op_exp: exp -> Absyn.oper -> exp -> exp

val while_exp : (unit -> exp) -> (unit -> unit) -> exp

