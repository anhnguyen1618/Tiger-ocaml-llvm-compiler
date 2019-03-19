type level
type exp
type access
type break_block = Llvm.llbasicblock

type arg_name_type_map = { name: Symbol.symbol; ty: Types.ty; esc_order: int }

val the_module: Llvm.llmodule
            
val outermost: level

val new_level: level -> level

val dummy_exp: exp

val dummy_access: access

val nil_exp: Types.ty -> exp

val alloc_local: level -> int -> string -> Types.ty -> access

val assign_stm: exp -> exp -> unit

val simple_var: access -> string -> level -> exp

val simple_var_left: access -> string -> level -> exp

val int_exp: int -> exp

val string_exp: string -> exp

val break_exp: break_block -> exp

val array_exp: exp -> exp -> Types.ty -> exp

val record_exp: (Symbol.symbol * Types.ty) list -> exp list -> exp

val field_var_exp: exp -> exp -> int -> exp

val field_var_exp_left: exp -> exp -> int -> exp

val subscript_exp: exp -> exp -> int -> exp

val subscript_exp_left: exp -> exp -> int -> exp

val func_call_exp: level -> level -> string -> exp list -> exp
      
val op_exp: exp -> Absyn.oper -> exp -> exp

val while_exp : (unit -> exp) -> (break_block -> unit) -> exp

val if_exp: (unit -> exp) -> (unit -> exp * (unit -> Types.ty * exp)) -> exp

val add_func_header: string -> Types.ty -> Types.ty list -> unit
  
val func_dec: level -> string -> Types.ty -> Types.ty list
              -> arg_name_type_map list -> (access list -> unit -> Types.ty * exp)
              -> unit

val build_main_func: Types.ty list -> break_block

val build_return_main: unit -> unit

val build_external_func: string -> Types.ty list -> Types.ty -> unit

val build_bitcast_generic: Types.ty -> exp -> exp

val cast_generic_to_record: exp -> Types.ty -> exp

val cast_generic_to_record_pointer: exp -> Types.ty -> exp

val build_closure: string -> Types.ty list -> Types.ty -> Llvm.lltype * exp

val closure_call_exp: exp -> (Llvm.lltype option) ref -> exp list -> exp
