module L = Llvm
module T = Types
type level = TOP
           | NESTED of {uniq: unit ref; parent: level; frame: unit }
                     
type access = unit

type exp = unit

let outermost = TOP

(* LLVM code *)
let context = L.global_context ()
let the_module = L.create_module context "Tiger jit"
let builder = L.builder context

let int_type = L.i64_type context
let string_type = L.pointer_type (L.i64_type context)
            
let rec get_llvm_type: T.ty -> L.lltype = function
  | T.RECORD(_, _) -> L.i64_type context
  | T.INT -> int_type
  | T.STRING -> string_type
  | T.ARRAY(arr_type, _) ->
     L.pointer_type (
         L.struct_type context
           [|
             int_type;
             L.array_type (get_llvm_type arr_type) 0
           |]
       )
  | _ -> L.void_type context

let alloc_local (level: level) (func) (esc: bool) (name: string) (typ: T.ty): L.llvalue =
  let builder = L.builder_at context (L.instr_begin ( L.entry_block func )) in
  L.build_alloca ( get_llvm_type typ) name builder

                
                  
