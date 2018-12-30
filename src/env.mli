
type enventry = VarEntry of { ty: Types.ty; access: Translate.access }
              | FunEntry of {
                  level: Translate.level; label: Temp.label;
                  formals: Types.ty list; result: Types.ty;  }

val base_tenv: Types.ty Symbol.table
val base_venv: enventry Symbol.table
      
