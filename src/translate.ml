
module L = Llvm
module T = Types
module A = Absyn
module Err = Error.Error

type break_block = Llvm.llbasicblock
         
         
type level = TOP
           | NESTED of {uniq: Temp.temp; parent: level }

let new_level (parent: level) = NESTED { uniq = Temp.newtemp(); parent = parent }

type arg_name_type_map = { name: Symbol.symbol; ty: Types.ty; esc_order: int }
                     
type address = IN_STATIC_LINK of L.llvalue
             | IN_FRAME of L.llvalue

type access = level * address

type exp = L.llvalue

type expty = {exp: exp; ty: T.ty}
         
let outermost = TOP

let not_esc_order = -1

(* LLVM code *)
let context = L.global_context ()
let the_module = L.create_module context "Tiger jit"
let builder = L.builder context

let int_type = L.integer_type context 32 
                  
let string_type = L.pointer_type (L.i8_type context)

let int_pointer = L.pointer_type (L.i32_type context)

let int_exp i = L.const_int int_type i

let dummy_exp = int_exp 0

let dummy_access: access = (outermost, IN_FRAME(dummy_exp))

            
let rec get_llvm_type: T.ty -> L.lltype = function
  | T.INT -> int_type
  | T.STRING -> string_type
  | T.ARRAY(arr_type, unique) ->
     let array_type = arr_type |> get_llvm_type |> L.pointer_type in
     let wrapper_type = L.struct_type context [| int_type; array_type |] in
     wrapper_type |> L.pointer_type

  | T.RECORD(field_types, uniq) ->
     L.pointer_type (get_llvm_type (T.RECORD_ALLOC (field_types, uniq)))
  | T.RECORD_ALLOC (field_types, _) ->
     L.struct_type context ( (List.map (fun (_, ty) -> get_llvm_type ty) field_types) |> Array.of_list)
  | T.INT_POINTER -> int_pointer
  | T.GENERIC_ARRAY -> string_type
  | T.GENERIC_RECORD -> string_type
  | T.NAME (_, real_type) -> begin
      match !real_type with
      | Some(T.RECORD _) -> string_type
      | Some x -> get_llvm_type x
      | None -> string_type
    end
  | _ -> L.void_type context
       
let frame_pointer_stack = Stack.create()

let push_fp_to_stack (typ: T.ty) (addr: L.llvalue) =
  Stack.push (typ, addr) frame_pointer_stack

let pop_fp_from_stack () = Stack.pop frame_pointer_stack

let get_current_fp () = Stack.top frame_pointer_stack

let get_fp_value (): exp =
  let (_, fp_struct_addr) = get_current_fp() in
  let fp_addr = L.build_gep fp_struct_addr [| int_exp(0); int_exp (0) |] "frame_pointer_address" builder in
  L.build_load fp_addr "frame_pointer_val" builder          

(* Frame pointer stack ends here *)
                       

let build_frame_pointer_alloc (esc_vars: T.ty list) =
  let element_types = List.map (fun typ -> (Symbol.symbol(""), typ)) esc_vars in
  let frame_pointer_struct_type = T.RECORD_ALLOC(element_types, Temp.newtemp()) in
  let address = L.build_alloca (get_llvm_type frame_pointer_struct_type) "frame_pointer" builder in
  let frame_pointer_type = T.RECORD(element_types, Temp.newtemp()) in
  push_fp_to_stack frame_pointer_type address

let build_return_main () =
  ignore(pop_fp_from_stack());
  ignore(L.build_ret dummy_exp builder)

let build_main_func (esc_vars: T.ty list): break_block =
  let main_function_dec = L.function_type int_type  [||] in
  let main_function = L.declare_function "main" main_function_dec the_module in
  let main_entry = L.append_block context "entry" main_function in
  
  let exit_loop_block = L.append_block context "break_loop" main_function in
  L.position_at_end exit_loop_block builder;
  ignore(L.build_ret dummy_exp builder);
  
  let stuff_static_link = T.INT in
  L.position_at_end main_entry builder;
  build_frame_pointer_alloc (stuff_static_link::esc_vars);
  exit_loop_block

let build_bitcast_generic typ value =
  L.build_bitcast value (get_llvm_type typ) "" builder

let cast_generic_to_record value typ =
  L.build_bitcast value (get_llvm_type typ) "" builder

let cast_generic_to_record_pointer value typ =
  L.build_bitcast value (get_llvm_type typ |> L.pointer_type) "" builder

let point_to_func_entry_builder (): L.llbuilder =
  let current_block = L.insertion_block builder in
  let func_block = current_block |> L.block_parent in
  let builder = func_block |> L.entry_block |> L.instr_begin |> L.builder_at context in
  builder

let alloc_unesc_temp (name: string) (typ: T.ty): exp =
  let builder = point_to_func_entry_builder() in
  let addr = L.build_alloca (get_llvm_type typ) name builder in
  addr

       
let alloc_local
      (dec_level: level)
      (esc_order: int)
      (name: string)
      (typ: T.ty): access =
  let builder = point_to_func_entry_builder() in
  match esc_order with
  | -1 ->
     let address = L.build_alloca (get_llvm_type typ) name builder in
     (dec_level, IN_FRAME(address))
  | _ -> (*print_string ("offset " ^ (string_of_int esc_order)); exit 1;*) (dec_level, IN_STATIC_LINK(int_exp esc_order))

let malloc (name: string) (typ: T.ty): exp =
  L.build_malloc (typ |> get_llvm_type) name builder 

let rec gen_static_link = function
  | (NESTED(dec_level), NESTED(use_level), current_fp) ->
     if Temp.eq(dec_level.uniq, use_level.uniq)
     then current_fp
     else
       begin
         let static_link_offset = int_exp (0) in
         let next_fp_addr_in_static_link = L.build_gep
                                 current_fp
                                 [| int_exp(0); static_link_offset |]
                                 "fp_addr_in_sl" builder in
         let next_fp_addr = L.build_load next_fp_addr_in_static_link "fp_addr" builder in
         gen_static_link (NESTED(dec_level), use_level.parent, next_fp_addr)
       end
  | (_, _, current_fp) -> Err.error 0 "Impossible"; current_fp


(* assume that other part pass calculated location already *)
let assign_stm (location: exp) (value: L.llvalue) =
  ignore (L.build_store value location builder)
  
let nil_exp (typ: T.ty) = typ |> get_llvm_type |> L.const_null 
       
let simple_var_left
      ((dec_level, address): access)
      (name: string)
      (use_level: level) =
  match address with
  | IN_FRAME addr -> addr (* var in-frame never esc -> no need for static link *)
  | IN_STATIC_LINK offset ->
     let (_, fp_addr) = get_current_fp() in
     let fp_dec_level_addr = gen_static_link (dec_level, use_level, fp_addr) in
     
     L.build_gep fp_dec_level_addr
       [| int_exp(0); offset |]
       name
       builder

let simple_var
      (access: access)
      (name: string)
      (use_level: level) =
  let absolute_addr = simple_var_left access name use_level in
  L.build_load absolute_addr name builder  

     
let string_exp s = L.build_global_stringptr s "" builder

let break_exp (terminate_block: break_block) =
  let result = L.build_br terminate_block builder in
  (*L.position_at_end terminate_block builder;*)
  result

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


let while_exp (eval_test_exp: unit -> exp) (eval_body_exp: break_block -> unit): exp =
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
  eval_body_exp(end_block);
  ignore(L.build_br test_block builder);
  L.position_at_end end_block builder;
  dummy_exp



exception Func_not_found of string
let lookup_function_block name =
  match L.lookup_function name the_module with
  | None -> raise (Func_not_found ("Function not found: "^name))
  | Some x -> x
            
let func_call_exp
      (dec_level: level)
      (call_level: level)
      (name: string)
      (vals: exp list): exp =
  let callee = lookup_function_block name in
  match dec_level with
  | TOP -> L.build_call callee (Array.of_list vals) "" builder
  | _ ->
     let (_, current_fp) = get_current_fp() in
     let dec_fp_addr = gen_static_link (dec_level, call_level, current_fp) in
     let final_args = (dec_fp_addr :: vals) |> Array.of_list in
     L.build_call callee final_args "" builder

let array_exp
      (size: exp)
      (init: exp)
      (typ: T.ty) =
  let array_ele_type = get_llvm_type typ in
  let array_addr = L.build_array_malloc array_ele_type size "array_init" builder in
  (* This code is to alloc counter -> add init value for array *)
  let counter_addr = alloc_unesc_temp "i" T.INT in
  assign_stm counter_addr (int_exp 0);

  let load_counter (): L.llvalue =
    L.build_load counter_addr "i" builder in
                                 
  let conditition (): exp =
    let value = load_counter() in
    op_exp value A.LtOp size
  in
  
  let body (break: break_block): unit =
    let value = load_counter() in
    let addr = L.build_gep array_addr [| value |] "Element" builder in
    ignore(L.build_store init addr builder);
    assign_stm counter_addr (op_exp value A.PlusOp (int_exp 1))
  in
  
  ignore(while_exp conditition body);

  let array_wrapper_type = L.struct_type context [| int_type; L.pointer_type(array_ele_type) |] in
  (*loop size; *)
  let wrapper_addr = L.build_malloc array_wrapper_type "array_wrapper" builder in
  let save_to_array_wrapper index value =
    let addr = L.build_gep wrapper_addr [| int_exp(0); int_exp(index) |] "array_info" builder in
    ignore(L.build_store value addr builder)
  in
  save_to_array_wrapper 0 size;  
  save_to_array_wrapper 1 array_addr;
  wrapper_addr


let record_exp (tys: (Symbol.symbol * T.ty) list) (exps: exp list) =
  (*let record_addr = alloc_unesc_temp "record_init" (T.RECORD_ALLOC(tys, Temp.newtemp())) in*)
  let record_addr = malloc "record_init" (T.RECORD_ALLOC(tys, Temp.newtemp())) in
  let size = exps |> List.length |> int_exp in

  (*let record_addr = func_call_exp "tig_init_record" [size] in *)
  let alloc index exp =
    (* pointer to internal struct has to defer by first 0, pointer to external struct does not need *)
    let addr = L.build_gep record_addr [| int_exp(0); int_exp(index) |] "Element" builder in
    ignore(L.build_store exp addr builder) in
  let casted_exps = List.map2 (fun (_, ty) exp -> match ty with
                                           | T.NAME _ -> build_bitcast_generic ty exp
                                           | _ -> exp
                  ) tys exps in
  List.iteri alloc casted_exps;
  record_addr

let field_var_exp (arr_addr: exp) (index: exp) =
  (*L.build_load arr_addr "zz" builder  *)
  let addr = L.build_gep arr_addr [| int_exp(0); index |] "element" builder in
  L.build_load addr "field_var" builder

let field_var_exp_left (arr_addr: exp ) (index: exp) =
  (* we have to load here becase 
     RHS exp: arr := malloc() => arr has int* type and is saved to int**
     ,when calling transVar(simple) => return int* type 
     LHS exp: arr := malloc() => arr has int* type and is saved to int**
     HOWEVER when calling transVar_left(simple) => return int** (address that contain int* type*)
  let addr = L.build_load arr_addr "load_left" builder in
  L.build_gep addr [| int_exp(0);index |] "element_left" builder

let check_bound_array (arr_wrapper_addr: exp) (index_exp: exp) (pos: int)=
  let error_msg = Err.gen_err_message pos "Array out of bound" in
  let casted_array = build_bitcast_generic T.STRING arr_wrapper_addr in
  ignore(func_call_exp TOP TOP "tig_check_array_bound" [casted_array; index_exp; string_exp(error_msg)])

let subscript_exp (arr_wrapper_addr: exp) (index: exp) (pos: int) =
  check_bound_array arr_wrapper_addr index pos;
  (* address of array is in the second position in struct*)
  let struct_arr_index = int_exp(1) in
  (*L.build_load arr_addr "zz" builder  *)
  let array_addr_ptr = L.build_gep arr_wrapper_addr
                         [| int_exp(0); struct_arr_index |] "array_pointer" builder in
  (* have to load when getting data from struct *)
  let array_addr = L.build_load array_addr_ptr "arr_addr" builder in
  
  let ele_addr = L.build_gep array_addr [| index |] "arr_ele_addr" builder in
  
  L.build_load ele_addr "arr_ele" builder

let subscript_exp_left (arr_wrapper_addr_ptr: exp ) (index: exp) (pos: int)=
  (* we have to load here becase 
     RHS exp: arr := malloc() => arr has int* type and is saved to int**
     ,when calling transVar(simple) => return int* type 
     LHS exp: arr := malloc() => arr has int* type and is saved to int**
     HOWEVER when calling transVar_left(simple) => return int** (address that contain int* type) *)
  let arr_wrapper_addr = L.build_load arr_wrapper_addr_ptr "load_left" builder in
  check_bound_array arr_wrapper_addr index pos;
  let struct_arr_index = int_exp(1) in
  let array_addr_ptr = L.build_gep arr_wrapper_addr
                         [| int_exp(0); struct_arr_index |] "array_addr_ptr" builder in
  (* have to load when getting data from struct *)
  let array_addr = L.build_load array_addr_ptr "arr_addr" builder in
  
  L.build_gep array_addr [| index |] "arr_ele_addr" builder


let if_exp
      (gen_test_val: unit -> exp)
      (gen_then_else: unit -> exp * (unit -> T.ty * exp)): exp =

  (*let previous_block = L.insertion_block builder in *)
  
  let current_block = L.insertion_block builder in
  let function_block = L.block_parent current_block in
  let test_block = L.append_block context "test" function_block in
  let then_block = L.append_block context "then" function_block in
  let else_block = L.append_block context "else" function_block in
  let merge_block = L.append_block context "merge" function_block in

  ignore(L.build_br test_block builder);
  L.position_at_end test_block builder;
  let test_val = gen_test_val () in
  let cond_val = L.build_icmp L.Icmp.Eq test_val (int_exp 1) "cond" builder in
  ignore(L.build_cond_br cond_val then_block else_block builder);

  L.position_at_end then_block builder;
  let (then_val, gen_else_val) = gen_then_else() in
  let new_then_block = L.insertion_block builder in

  
  L.position_at_end else_block builder;
  let (if_else_type, else_val) = gen_else_val() in
  let new_else_block = L.insertion_block builder in

  let final_result = match if_else_type with
    | T.NIL ->
       L.position_at_end new_then_block builder;
       ignore(L.build_br merge_block builder);
       L.position_at_end new_else_block builder;
       ignore(L.build_br merge_block builder);
       L.position_at_end merge_block builder;
       dummy_exp

    | _ -> 
       let addr = alloc_unesc_temp "if_result_addr" if_else_type in
       L.position_at_end new_then_block builder;
       assign_stm addr then_val;
       ignore(L.build_br merge_block builder);

       L.position_at_end new_else_block builder;
       assign_stm addr else_val;
       ignore(L.build_br merge_block builder);

       L.position_at_end merge_block builder;
       L.build_load addr "if_result" builder
  in
  final_result

let add_func_header
      (name: string)
      (typ: T.ty)
      (arg_types: T.ty list) =
  let (parent_fp_type, _) = get_current_fp() in
  let arg_types =
    get_llvm_type(parent_fp_type)
    :: (List.map get_llvm_type arg_types)
    |> Array.of_list
  in
  let func_type = L.function_type (get_llvm_type typ) arg_types in
  ignore(
      match L.lookup_function name the_module with
      | None -> L.declare_function name func_type the_module
      | Some x -> x)

let func_dec
      (func_level: level)
      (name: string)
      (typ: T.ty)
      (esc_vars: T.ty list)
      (args: arg_name_type_map list)
      (add_arg_bindings: access list -> unit -> T.ty * exp) =
  let (parent_fp_type, _) = get_current_fp() in

  let create_fp_type () =
    let add_esc_arg arg acc = if arg.esc_order <> -1 then (arg.ty :: acc) else acc in
    let esc_arg_types = List.fold_right add_esc_arg args [] in
    parent_fp_type::(esc_vars @ esc_arg_types)
  in

  let fp_type = create_fp_type() in

  let previous_block = L.insertion_block builder in
  let func_block = lookup_function_block name in

  let create_entry_block_and_build_fp () =
    let entry_block = L.append_block context "entry" func_block in
    L.position_at_end entry_block builder;
    build_frame_pointer_alloc fp_type;
    entry_block
  in

  let entry_block = create_entry_block_and_build_fp() in

  let alloc_function_args () = 
    let (_, fp_addr) = get_current_fp() in
    
    let alloc_arg {name; ty; esc_order}: access = alloc_local func_level esc_order (Symbol.name name) ty in
    let assign_val arg_to_alloc arg_val: access =
      let (level, address) = alloc_arg arg_to_alloc in
      let final_addr = match address with
        | IN_STATIC_LINK offset -> L.build_gep fp_addr
                                     [| int_exp(0); offset |]
                                     "arg_address" builder
        | IN_FRAME addr -> addr
      in
      (* in the same level, no need to build static link *)
      assign_stm final_addr arg_val;
      (level, address)
    in
    let arg_mappings = {name = Symbol.symbol "static_link";
                        ty= parent_fp_type; esc_order = 0 } :: args in
    let addresses = List.map2 assign_val arg_mappings (L.params func_block |> Array.to_list) in
    addresses
  in

  let addresses = alloc_function_args() in
  
  let gen_body = add_arg_bindings addresses in
  (* jump back to entry block to eval body *)
  L.position_at_end entry_block builder;

  let (body_type, body_exp) = gen_body() in
  ignore(match (typ, body_type) with
         | (T.NIL, _) -> L.build_ret_void builder
         | (_, T.NIL) -> L.build_ret (nil_exp typ)  builder
         | _ -> L.build_ret body_exp builder);


  ignore(pop_fp_from_stack());
  L.position_at_end previous_block builder

let build_external_func
      (name: string)
      (args: T.ty list)
      (result:T.ty)  =
  let arg_types = (List.map get_llvm_type args) |> Array.of_list in
  let func_type = L.function_type (get_llvm_type result) arg_types in
  ignore(L.declare_function name func_type the_module)




  
  
                    
    
                      
  
                  
                 

  

  
                    


    
  


                
                  
