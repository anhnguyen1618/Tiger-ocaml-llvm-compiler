type level
type exp

type access = exp

type arg_name_type_map = { name: Symbol.symbol; ty: Types.ty }

val the_module: Llvm.llmodule
            
val outermost: level

val new_level: level -> level

val nil_exp: exp

val alloc_local: bool -> string -> Types.ty -> access

val assign_stm: (*access*) exp -> exp -> unit

val simple_var: access -> string -> exp

val int_exp: int -> exp

val string_exp: string -> exp

val break_exp: 'a -> exp

val array_exp: exp -> exp -> Types.ty -> exp

val func_call_exp: string -> exp list -> exp
      
val op_exp: exp -> Absyn.oper -> exp -> exp

val while_exp : (unit -> exp) -> (unit -> unit) -> exp

val if_exp: (unit -> exp) -> (unit -> exp * (unit -> exp)) -> exp

val func_dec: string -> Types.ty -> arg_name_type_map list -> (access list -> unit -> exp) -> unit

val build_return_main: unit -> unit

val build_external_func: string -> Types.ty list -> Types.ty -> unit

