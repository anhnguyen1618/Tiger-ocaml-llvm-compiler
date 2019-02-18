; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [42 x i8] c"test/malloc.tig::11.6: Array out of bound\00"
@1 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::17.14: Array out of bound\00"
@2 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::17.17: Nil pointer exception!\00"
@3 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::18.15: Array out of bound\00"
@4 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::18.18: Nil pointer exception!\00"
@5 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::20.12: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::20.15: Nil pointer exception!\00"
@7 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::21.13: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::21.16: Nil pointer exception!\00"
@9 = private unnamed_addr constant [42 x i8] c"test/malloc.tig::23.4: Array out of bound\00"
@10 = private unnamed_addr constant [46 x i8] c"test/malloc.tig::23.7: Nil pointer exception!\00"
@11 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::24.13: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::24.16: Nil pointer exception!\00"

declare void @tig_print_int(i32) gc "ocaml"

declare void @tig_print(i8*) gc "ocaml"

declare void @print_arr_int_ele(i32) gc "ocaml"

declare i32* @tig_init_array(i32, i32) gc "ocaml"

declare i32* @tig_init_record(i32) gc "ocaml"

declare i32 @tig_array_length(i8*) gc "ocaml"

declare i32 @tig_nillable(i8*) gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) gc "ocaml"

declare i32 @tig_random(i32) gc "ocaml"

declare void @tig_exit(i32) gc "ocaml"

declare void @tig_flush() gc "ocaml"

declare i8* @tig_getchar() gc "ocaml"

declare i32 @tig_ord(i8*) gc "ocaml"

declare i8* @tig_chr(i32) gc "ocaml"

declare i32 @tig_string_cmp(i8*, i8*) gc "ocaml"

declare i32 @tig_size(i8*) gc "ocaml"

declare i8* @tig_substring(i8*, i32, i32) gc "ocaml"

declare i8* @tig_concat(i8*, i8*) gc "ocaml"

declare i32 @tig_not(i32) gc "ocaml"

declare void @assert_equal_int(i32, i32) gc "ocaml"

declare void @assert_equal_string(i8*, i8*) gc "ocaml"

define i32 @main() gc "ocaml" {
entry:
  %b = alloca { i32, { i32 }** }*
  %i = alloca i32
  %a = alloca { i32 }*
  %frame_pointer = alloca { i32, { i32, { i32 }** }* }
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32 }*
  %Element = getelementptr { i32 }, { i32 }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  store { i32 }* %record_init, { i32 }** %a
  %a1 = load { i32 }*, { i32 }** %a
  %malloccall2 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 2))
  %array_init = bitcast i8* %malloccall2 to { i32 }**
  store i32 0, i32* %i
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %i3 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i3, 2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %i4 = load i32, i32* %i
  %Element5 = getelementptr { i32 }*, { i32 }** %array_init, i32 %i4
  store { i32 }* %a1, { i32 }** %Element5
  %add_tmp = add i32 %i4, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32 }** }* getelementptr ({ i32, { i32 }** }, { i32, { i32 }** }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall6 to { i32, { i32 }** }*
  %array_info = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %array_wrapper, i32 0, i32 0
  store i32 2, i32* %array_info
  %array_info7 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %array_wrapper, i32 0, i32 1
  store { i32 }** %array_init, { i32 }*** %array_info7
  %var_dec = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %frame_pointer, i32 0, i32 1
  store { i32, { i32 }** }* %array_wrapper, { i32, { i32 }** }** %var_dec
  %0 = call { i32, { i32 }** }* @create_rec({ i32, { i32, { i32 }** }* }* %frame_pointer)
  store { i32, { i32 }** }* %0, { i32, { i32 }** }** %b
  %arr = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %frame_pointer, i32 0, i32 1
  %arr8 = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr
  %1 = bitcast { i32, { i32 }** }* %arr8 to i8*
  call void @tig_check_array_bound(i8* %1, i32 0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %arr8, i32 0, i32 1
  %arr_addr = load { i32 }**, { i32 }*** %array_pointer
  %arr_ele_addr = getelementptr { i32 }*, { i32 }** %arr_addr, i32 0
  %arr_ele = load { i32 }*, { i32 }** %arr_ele_addr
  %2 = bitcast { i32 }* %arr_ele to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @2, i32 0, i32 0))
  %element = getelementptr { i32 }, { i32 }* %arr_ele, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  %arr9 = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %frame_pointer, i32 0, i32 1
  %arr10 = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr9
  %3 = bitcast { i32, { i32 }** }* %arr10 to i8*
  call void @tig_check_array_bound(i8* %3, i32 0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @3, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %arr10, i32 0, i32 1
  %arr_addr12 = load { i32 }**, { i32 }*** %array_pointer11
  %arr_ele_addr13 = getelementptr { i32 }*, { i32 }** %arr_addr12, i32 0
  %arr_ele14 = load { i32 }*, { i32 }** %arr_ele_addr13
  %4 = bitcast { i32 }* %arr_ele14 to i8*
  call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i32 0, i32 0))
  %element15 = getelementptr { i32 }, { i32 }* %arr_ele14, i32 0, i32 0
  %field_var16 = load i32, i32* %element15
  call void @assert_equal_int(i32 %field_var16, i32 5)
  %b17 = load { i32, { i32 }** }*, { i32, { i32 }** }** %b
  %5 = bitcast { i32, { i32 }** }* %b17 to i8*
  call void @tig_check_array_bound(i8* %5, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @5, i32 0, i32 0))
  %array_pointer18 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %b17, i32 0, i32 1
  %arr_addr19 = load { i32 }**, { i32 }*** %array_pointer18
  %arr_ele_addr20 = getelementptr { i32 }*, { i32 }** %arr_addr19, i32 1
  %arr_ele21 = load { i32 }*, { i32 }** %arr_ele_addr20
  %6 = bitcast { i32 }* %arr_ele21 to i8*
  call void @tig_check_null_pointer(i8* %6, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %element22 = getelementptr { i32 }, { i32 }* %arr_ele21, i32 0, i32 0
  %field_var23 = load i32, i32* %element22
  call void @tig_print_int(i32 %field_var23)
  %b24 = load { i32, { i32 }** }*, { i32, { i32 }** }** %b
  %7 = bitcast { i32, { i32 }** }* %b24 to i8*
  call void @tig_check_array_bound(i8* %7, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @7, i32 0, i32 0))
  %array_pointer25 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %b24, i32 0, i32 1
  %arr_addr26 = load { i32 }**, { i32 }*** %array_pointer25
  %arr_ele_addr27 = getelementptr { i32 }*, { i32 }** %arr_addr26, i32 1
  %arr_ele28 = load { i32 }*, { i32 }** %arr_ele_addr27
  %8 = bitcast { i32 }* %arr_ele28 to i8*
  call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %element29 = getelementptr { i32 }, { i32 }* %arr_ele28, i32 0, i32 0
  %field_var30 = load i32, i32* %element29
  call void @assert_equal_int(i32 %field_var30, i32 6)
  %arr31 = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %frame_pointer, i32 0, i32 1
  %load_left = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr31
  %9 = bitcast { i32, { i32 }** }* %load_left to i8*
  call void @tig_check_array_bound(i8* %9, i32 1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @9, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %load_left, i32 0, i32 1
  %arr_addr32 = load { i32 }**, { i32 }*** %array_addr_ptr
  %arr_ele_addr33 = getelementptr { i32 }*, { i32 }** %arr_addr32, i32 1
  %load_left34 = load { i32 }*, { i32 }** %arr_ele_addr33
  %10 = bitcast { i32 }* %load_left34 to i8*
  call void @tig_check_null_pointer(i8* %10, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @10, i32 0, i32 0))
  %element_left = getelementptr { i32 }, { i32 }* %load_left34, i32 0, i32 0
  store i32 5, i32* %element_left
  %b35 = load { i32, { i32 }** }*, { i32, { i32 }** }** %b
  %11 = bitcast { i32, { i32 }** }* %b35 to i8*
  call void @tig_check_array_bound(i8* %11, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @11, i32 0, i32 0))
  %array_pointer36 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %b35, i32 0, i32 1
  %arr_addr37 = load { i32 }**, { i32 }*** %array_pointer36
  %arr_ele_addr38 = getelementptr { i32 }*, { i32 }** %arr_addr37, i32 1
  %arr_ele39 = load { i32 }*, { i32 }** %arr_ele_addr38
  %12 = bitcast { i32 }* %arr_ele39 to i8*
  call void @tig_check_null_pointer(i8* %12, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %element40 = getelementptr { i32 }, { i32 }* %arr_ele39, i32 0, i32 0
  %field_var41 = load i32, i32* %element40
  call void @assert_equal_int(i32 %field_var41, i32 5)
  ret i32 0
}

declare noalias i8* @malloc(i32)

define { i32, { i32 }** }* @create_rec({ i32, { i32, { i32 }** }* }*) gc "ocaml" {
entry:
  %another_rec = alloca { i32 }*
  %frame_pointer = alloca { { i32, { i32, { i32 }** }* }* }
  %arg_address = getelementptr { { i32, { i32, { i32 }** }* }* }, { { i32, { i32, { i32 }** }* }* }* %frame_pointer, i32 0, i32 0
  store { i32, { i32, { i32 }** }* }* %0, { i32, { i32, { i32 }** }* }** %arg_address
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32 }*
  %Element = getelementptr { i32 }, { i32 }* %record_init, i32 0, i32 0
  store i32 6, i32* %Element
  store { i32 }* %record_init, { i32 }** %another_rec
  %fp_addr_in_sl = getelementptr { { i32, { i32, { i32 }** }* }* }, { { i32, { i32, { i32 }** }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32, { i32, { i32 }** }* }*, { i32, { i32, { i32 }** }* }** %fp_addr_in_sl
  %arr = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %fp_addr, i32 0, i32 1
  %load_left = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr
  %1 = bitcast { i32, { i32 }** }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @0, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %load_left, i32 0, i32 1
  %arr_addr = load { i32 }**, { i32 }*** %array_addr_ptr
  %arr_ele_addr = getelementptr { i32 }*, { i32 }** %arr_addr, i32 1
  %another_rec1 = load { i32 }*, { i32 }** %another_rec
  store { i32 }* %another_rec1, { i32 }** %arr_ele_addr
  %fp_addr_in_sl2 = getelementptr { { i32, { i32, { i32 }** }* }* }, { { i32, { i32, { i32 }** }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr3 = load { i32, { i32, { i32 }** }* }*, { i32, { i32, { i32 }** }* }** %fp_addr_in_sl2
  %arr4 = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %fp_addr3, i32 0, i32 1
  %arr5 = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr4
  ret { i32, { i32 }** }* %arr5
}
