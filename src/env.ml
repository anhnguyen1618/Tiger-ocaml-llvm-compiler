
module T = Types
module S = Symbol

type enventry = VarEntry of {ty: T.ty; access: Translate.access}
              | FunEntry of {
		  level: Translate.level;
		  label: Temp.label;
		  formals: T.ty list;
		  result : T.ty}

let external_functions = [
      ("printInt", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_print_int"; formals=[T.INT]; result=T.NIL}));
      ("print", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_print"; formals=[T.STRING]; result=T.NIL}));
      ("init_array", FunEntry ({
                           level=Translate.outermost;
                           label=Temp.namedlabel "tig_init_array";
                           formals=[T.INT; T.INT];
                           result= T.INT_POINTER}));
      ("init_record", FunEntry ({
                           level=Translate.outermost;
                           label=Temp.namedlabel "tig_init_record";
                           formals=[T.INT];
                           result= T.INT_POINTER}));
      ("array_length", FunEntry ({
                           level=Translate.outermost;
                           label=Temp.namedlabel "tig_array_length";
                           formals=[T.GENERIC_ARRAY];
                           result= T.INT}));
      ("is_nil", FunEntry ({
                             level=Translate.outermost;
                             label=Temp.namedlabel "tig_nillable";
                             formals=[T.GENERIC_RECORD];
                             result= T.INT}));
      ("exit", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_exit"; formals=[T.INT]; result=T.NIL}));
      ("flush", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_flush"; formals=[]; result=T.NIL}));
      ("getchar", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_getchar"; formals=[]; result=T.STRING}));
      ("ord", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_ord"; formals=[T.STRING]; result=T.INT}));
      ("chr", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_chr"; formals=[T.INT]; result=T.STRING}));
      ("str_cmp", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_string_cmp"; formals=[T.STRING; T.STRING]; result=T.INT}));
      ("size", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_size"; formals=[T.STRING]; result=T.INT}));
      ("substring", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_substring"; formals=[T.STRING; T.INT; T.INT]; result=T.STRING}));
      ("str_concat", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_concat"; formals=[T.STRING; T.STRING]; result=T.STRING}));
      ("not", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_not"; formals=[T.INT]; result=T.INT}));
      ("exit", FunEntry ({level=Translate.outermost; label=Temp.namedlabel "tig_exit"; formals=[T.INT]; result=T.NIL}))
    ] 

let base_tenv =
  let addtotable (s, t) table  = S.enter(table, S.symbol(s), t) in
  let toadd = [("int", T.INT); ("string", T.STRING)] in
  List.fold_right addtotable toadd S.empty

let base_venv = (* predefined functions *)
  let addtotable (s, t) table = S.enter(table, S.symbol(s), t) in
  let toadd = external_functions in
  List.fold_right addtotable toadd S.empty 
