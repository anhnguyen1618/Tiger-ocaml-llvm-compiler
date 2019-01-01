module L = Llvm
module T = Types
module A = Absyn
         
type level = TOP
           | NESTED of {uniq: unit ref; parent: level }

type arg_name_type_map = { name: Symbol.symbol; ty: Types.ty }
                     
type access = L.llvalue

type exp = L.llvalue

type expty = {exp: exp; ty: T.ty}
         
let outermost = TOP

let new_level (parent: level)  =
  NESTED { uniq = ref (); parent = parent }

(* LLVM code *)
let context = L.global_context ()
let the_module = L.create_module context "Tiger jit"
let builder = L.builder context

let int_type = L.integer_type context 32 

let main_function_dec = L.function_type int_type  [||]
let main_function = L.declare_function "main" main_function_dec the_module
let main_entry = L.append_block context "entry" main_function
let _ = L.position_at_end main_entry builder
(*     ignore (Llvm.build_ret (Llvm.const_int t_i32 123456) builder); *)
                  
let string_type = L.pointer_type (L.i8_type context)

let int_pointer = L.pointer_type (L.i32_type context)
            
let rec get_llvm_type: T.ty -> L.lltype = function
  | T.INT -> int_type
  | T.STRING -> string_type
  | T.ARRAY(arr_type, _) -> int_pointer
  | T.RECORD(field_types, uniq) ->
     L.pointer_type (get_llvm_type (T.RECORD_ALLOC (field_types, uniq)))
  | T.RECORD_ALLOC (field_types, _) ->
     (L.struct_type context ( (List.map (fun (_, ty) -> get_llvm_type ty) field_types) |> Array.of_list))
  | T.INT_POINTER -> int_pointer
  | _ -> L.void_type context

(* Keep this shit for static link *)
(*L.pointer_type (
         L.struct_type context
           [|
             int_type;
             L.array_type (get_llvm_type arr_type) 0
           |]
       ) *)
       
let alloc_local (esc: bool) (name: string) (typ: T.ty): access =
  let func_block = L.block_parent (L.insertion_block builder) in
  let builder = L.builder_at context (L.instr_begin ( L.entry_block func_block )) in
  L.build_alloca ( get_llvm_type typ) name builder

let assign_stm (location: L.llvalue) (value: L.llvalue) =
  ignore (L.build_store value location builder)

let simple_var (access: access) (name: string) =
  L.build_load access name builder

let int_exp i = L.const_int int_type i

let nil_exp = int_exp 0

let string_exp s = L.build_global_stringptr s "" builder

let break_exp s = nil_exp

exception Func_not_found of string
let func_call_exp (name: string) (vals: exp list): exp =
  let callee = match L.lookup_function name the_module with
    | Some fn -> fn
    | None -> raise (Func_not_found "not found")
  in
  let final_args = Array.of_list vals in
  L.build_call callee final_args "" builder

let array_exp (size: exp) (init: exp) (typ: T.ty) =
  func_call_exp "tig_init_array" [size; init]

let record_exp (tys: (Symbol.symbol * T.ty) list) (exps: exp list) =
  let record_addr = alloc_local true "record_init" (T.RECORD_ALLOC(tys, ref ())) in
  let size = exps |> List.length |> int_exp in
  (*let record_addr = func_call_exp "tig_init_record" [size] in *)
  let alloc index exp =
    (* pointer to internal struct has to defer by first 0, pointer to external struct does not need *)
    let addr = L.build_gep record_addr [| int_exp(0); int_exp(index) |] "Element" builder in
    ignore(L.build_store exp addr builder) in
  List.iteri alloc exps;
  record_addr

let subscript_exp (arr_addr: exp) (index: exp) =
  (*L.build_load arr_addr "zz" builder  *)
  let addr = L.build_gep arr_addr [| int_exp(0); index |] "element" builder in
  L.build_load addr "lol" builder

let subscript_exp_left (arr_addr: exp ) (index: exp) =
  (* we have to load here becase 
     RHS exp: arr := malloc() => arr has int* type and is saved to int**
     ,when calling transVar(simple) => return int* type 
     LHS exp: arr := malloc() => arr has int* type and is saved to int**
     HOWEVER when calling transVar_left(simple) => return int** (address that contain int* type*)
  let addr = L.build_load arr_addr "load_left" builder in
  L.build_gep addr [| int_exp(0);index |] "element_left" builder

         
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

let while_exp (eval_test_exp: unit -> exp) (eval_body_exp: unit -> unit): exp =
  (*let previous_block = L.insertion_block builder in *)
  
  let current_block = L.insertion_block builder in
  let function_block = L.block_parent current_block in
  let test_block = L.append_block context "test" function_block in
  let loop_block = L.append_block context "loop" function_block in
  let end_block = L.append_block context "end" function_block in

  ignore(L.build_br test_block builder);
  L.position_at_end test_block builder;

  let test_val = eval_test_exp () in
  let cond_val = L.build_icmp L.Icmp.Eq test_val (int_exp 1) "cond" builder in
  ignore(L.build_cond_br cond_val loop_block end_block builder);

  L.position_at_end loop_block builder;
  eval_body_exp();
  ignore(L.build_br test_block builder);
  L.position_at_end end_block builder;

  (*L.position_at_end previous_block builder;*)
  nil_exp

let if_exp
      (gen_test_val: unit -> exp)
      (gen_then_else: unit -> exp * (unit -> exp)): exp =

  (*let previous_block = L.insertion_block builder in *)
  
  let current_block = L.insertion_block builder in
  let function_block = L.block_parent current_block in
  let then_block = L.append_block context "then" function_block in
  let else_block = L.append_block context "else" function_block in
  let merge_block = L.append_block context "merge" function_block in

  let test_val = gen_test_val () in
  let cond_val = L.build_icmp L.Icmp.Eq test_val (int_exp 1) "cond" builder in
  ignore(L.build_cond_br cond_val then_block else_block builder);

  L.position_at_end then_block builder;
  let (then_val, gen_else_val) = gen_then_else() in
  let new_then_block = L.insertion_block builder in
  ignore(L.build_br merge_block builder);
  
  L.position_at_end else_block builder;
  let else_val = gen_else_val() in
  let new_else_block = L.insertion_block builder in
  ignore(L.build_br merge_block builder);

  L.position_at_end merge_block builder;
  let in_comming =  [(then_val, new_then_block); (else_val, new_else_block)] in
  let phi = L.build_phi in_comming "if_tmp" builder in

  (*L.position_at_end previous_block builder; *)
  phi

let func_dec
      (name: string)
      (typ: T.ty)
      (args: arg_name_type_map list)
      (add_arg_bindings: access list -> unit -> exp) =
  let arr_types = (List.map (fun (e: arg_name_type_map) -> get_llvm_type e.ty) args) |> Array.of_list in
  let func_type = L.function_type (get_llvm_type typ) arr_types in
  let func_block =
    match L.lookup_function name the_module with
    | None -> L.declare_function name func_type the_module
    | Some x -> raise (Func_not_found "Function already exist") (*This will not happen*)
  in
  
  let previous_block = L.insertion_block builder in
  
  let entry_block = L.append_block context "entry" func_block in
  L.position_at_end entry_block builder;
  let alloc_arg {name; ty}: exp = alloc_local true (*Change escape later*) (Symbol.name name) ty in
  let assign_val arg_to_alloc arg_val =
    let address = alloc_arg arg_to_alloc in
    assign_stm address arg_val;
    address
  in
  let addresses = List.map2 assign_val args (L.params func_block |> Array.to_list) in
  let gen_body = add_arg_bindings addresses in
  (* jump back to entry block to eval body *)
  L.position_at_end entry_block builder;
  ignore(L.build_ret (gen_body()) builder);
  
  L.position_at_end previous_block builder;
  
  L.print_module "Tiger jit" the_module
  (* Validate the generated code, checking for consistency. *)
                 (*Llvm_analysis.assert_valid_function func_block;*)

let build_return_main () =
  ignore(L.build_ret nil_exp builder)

let build_external_func
      (name: string)
      (args: T.ty list)
      (result:T.ty)  =
  let arg_types = (List.map get_llvm_type args) |> Array.of_list in
  let func_type = L.function_type (get_llvm_type result) arg_types in
  ignore(L.declare_function name func_type the_module)
  
  
                    
    
                      
  
                  
                 

  

  
                    


    
  


                
                  
