type access

type enventry = VarEntry of { ty: Types.ty; access: Translate.access }
              | FunEntry of { formals: Types.ty list; result: Types.ty; level: Translate.level; label: Temp.label }

val base_tenv: Types.ty Symbol.table
val base_venv: enventry Symbol.table
      
