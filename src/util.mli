val assert_type_eq: Types.ty * Types.ty * int * string -> unit

val actual_ty: (Types.ty Symbol.table) -> Types.ty -> Types.ty

val check_circular: (Absyn.typeDec list) -> unit
