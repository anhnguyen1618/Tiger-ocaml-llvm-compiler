module L = Llvm
module T = Types
module A = Absyn
         
type level = TOP
           | NESTED of {uniq: unit ref; parent: level; frame: unit }
                     
type access = L.llvalue

type exp = L.llvalue

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
       
let alloc_local (level: level) (esc: bool) (name: string) (typ: T.ty): access =
  let func_block = L.block_parent (L.insertion_block builder) in
  let builder = L.builder_at context (L.instr_begin ( L.entry_block func_block )) in
  L.build_alloca ( get_llvm_type typ) name builder

let assign_stm (var: L.llvalue) (value: L.llvalue) =
  ignore (L.build_store var value builder)

let simple_var (access: access) (name: string) =
  L.build_load access name builder

let int_exp i = L.const_int int_type i

let nil_exp = int_exp 0

let string_exp s = L.build_global_stringptr s "" builder

let break_exp s = nil_exp

let array_exp (size: exp) (init: exp) (typ: T.ty) =
  let ele_type = get_llvm_type typ in
  let init_array = L.const_array ele_type [||] in
  L.const_struct context [| size; init_array|]

exception Func_not_found of string
let func_call_exp (name: string) (vals: exp list): exp =
  let callee = match L.lookup_function name the_module with
    | Some fn -> fn
    | None -> raise (Func_not_found "not found")
  in
  let params = L.params callee in
  let final_args = Array.of_list vals in
  L.build_call callee final_args "temp" builder
                     
         
let op_exp (left_val: exp) (oper: A.oper) (right_val: exp) =
  let arith f tmp_name = f left_val right_val tmp_name builder in
  let compare f tmp_name =
    let test = L.build_icmp f left_val right_val tmp_name builder in
    L.build_zext test int_type "bool_tmp" builder
  in
  match oper with
  | A.PlusOp -> arith L.build_add "add_tmp"
  | A.MinusOp -> arith L.build_sub "minus_tmp"
  | A.TimesOp -> arith L.build_mul "mul_tmp"
  | A.DivideOp -> arith L.build_sdiv "div_tmp"
  | A.EqOp -> compare L.Icmp.Eq "eq_tmp"
  | A.NeqOp -> compare L.Icmp.Ne "neq_tmp"
  | A.LtOp -> compare L.Icmp.Slt "lt_tmp"
  | A.LeOp -> compare L.Icmp.Sle "le_tmp"
  | A.GtOp -> compare L.Icmp.Sgt "gt_tmp"
  | A.GeOp -> compare L.Icmp.Sge "ge_tmp"
  
                    


    
  


                
                  
