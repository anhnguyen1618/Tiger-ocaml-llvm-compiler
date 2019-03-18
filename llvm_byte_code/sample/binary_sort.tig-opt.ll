; ModuleID = 'llvm_byte_code/test/binary_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [47 x i8] c"test/binary_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::35.47: Nil pointer exception!\00"
@6 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::35.79: Nil pointer exception!\00"
@7 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::36.49: Nil pointer exception!\00"
@8 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::37.52: Nil pointer exception!\00"
@9 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::37.83: Nil pointer exception!\00"
@10 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::38.49: Nil pointer exception!\00"
@11 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::39.52: Nil pointer exception!\00"
@12 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::40.61: Nil pointer exception!\00"
@13 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::41.61: Nil pointer exception!\00"
@14 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::49.36: Array out of bound\00"
@15 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::57.48: Nil pointer exception!\00"
@16 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::58.23: Array out of bound\00"
@17 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::58.44: Nil pointer exception!\00"
@18 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::60.48: Nil pointer exception!\00"
@19 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::77.41: Array out of bound\00"
@20 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@21 = private unnamed_addr constant [15 x i8] c"==============\00"
@22 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@23 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::90.23: Array out of bound\00"
@24 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::91.23: Array out of bound\00"
@25 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::92.23: Array out of bound\00"
@26 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::93.23: Array out of bound\00"
@27 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::94.23: Array out of bound\00"
@28 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::98.23: Array out of bound\00"
@29 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::99.23: Array out of bound\00"
@30 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::100.23: Array out of bound\00"
@31 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::101.23: Array out of bound\00"
@32 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::102.23: Array out of bound\00"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @print_arr_int_ele(i32) local_unnamed_addr gc "ocaml"

declare i32 @tig_array_length(i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_random(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  %1 = call { i32, i32* }* @create_array_test({ i32 }* %frame_pointer)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @20, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @21, i32 0, i32 0))
  call void @binary_sort({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @22, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @23, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %3 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @24, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %4 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %4, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @25, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %5 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %5, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @26, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @27, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @binary_sort({ i32 }* %frame_pointer, { i32, i32* }* %1)
  %7 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %7, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @28, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %8 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @29, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %9 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %9, i32 2, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @30, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %10 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %10, i32 3, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @31, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %11 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %11, i32 4, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @32, i32 0, i32 0))
  %array_pointer47 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr48 = load i32*, i32** %array_pointer47
  %arr_ele_addr49 = getelementptr i32, i32* %arr_addr48, i32 4
  %arr_ele50 = load i32, i32* %arr_ele_addr49
  call void @assert_equal_int(i32 %arr_ele50, i32 4)
  ret i32 0
}

define void @print_array({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i32 0, i32 0))
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %4 = bitcast { i32, i32* }* %1 to i8*
  %5 = call i32 @tig_array_length(i8* %4)
  %minus_tmp3 = sub i32 %5, 1
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %ge_tmp = icmp sge i32 %minus_tmp3, %i.0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i.0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @print_arr_int_ele(i32 %arr_ele)
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret void
}

define { i32, i32* }* @create_array({ i32 }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %malloccall = tail call i8* @malloc(i32 32)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp slt i32 %i.0, 8
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 1, i32* %Element
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 8, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp19, %loop11 ]
  %ge_tmp = icmp sge i32 7, %i7.0
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @4, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7.0
  %2 = call i32 @tig_random(i32 50)
  store i32 %2, i32* %arr_ele_addr
  %add_tmp19 = add i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  ret { i32, i32* }* %array_wrapper
}

define void @binary_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }*, i32, { i32, i32* }* }
  %arg_address = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %arg_address1 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1
  %var_dec = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  store i32 0, i32* %var_dec
  %2 = call { i32, i8*, i8* }* @build_binary_tree({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer)
  call void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, { i32, i8*, i8* }* %2)
  ret void
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define { i32, i8*, i8* }* @build_binary_tree({ { i32 }*, i32, { i32, i32* }* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  %root_node = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i8*, i8* }* null, { i32, i8*, i8* }** %root_node
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %arr1 to i8*
  %2 = call i32 @tig_array_length(i8* %1)
  %fp_addr_in_sl2 = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr3 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl2
  %arr4 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr3, i32 0, i32 2
  %arr5 = load { i32, i32* }*, { i32, i32* }** %arr4
  %3 = bitcast { i32, i32* }* %arr5 to i8*
  %4 = call i32 @tig_array_length(i8* %3)
  %minus_tmp6 = sub i32 %4, 1
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %ge_tmp = icmp sge i32 %minus_tmp6, %i.0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %fp_addr_in_sl9 = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr10 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl9
  %arr11 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr10, i32 0, i32 2
  %arr12 = load { i32, i32* }*, { i32, i32* }** %arr11
  %5 = bitcast { i32, i32* }* %arr12 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %i.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @14, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr12, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i.0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @add_node({ { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 %arr_ele)
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %root_node15 = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i32 0, i32 1
  %root_node16 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root_node15
  ret { i32, i8*, i8* }* %root_node16
}

define void @add_node({ { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }
  %arg_address = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 0
  store { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %0, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }** %arg_address
  %arg_address1 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 2
  store i32 %1, i32* %arg_address1
  %value = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 2
  %value2 = load i32, i32* %value
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8*, i8* }*
  %Element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 0
  store i32 %value2, i32* %Element
  %Element3 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element3
  %Element4 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 2
  store i8* null, i8** %Element4
  %var_dec = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 1
  store { i32, i8*, i8* }* %record_init, { i32, i8*, i8* }** %var_dec
  br label %test

test:                                             ; preds = %entry
  %fp_addr_in_sl = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }** %fp_addr_in_sl
  %root_node = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %fp_addr, i32 0, i32 1
  %root_node5 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root_node
  %2 = bitcast { i32, i8*, i8* }* %root_node5 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  %fp_addr_in_sl6 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 0
  %fp_addr7 = load { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }** %fp_addr_in_sl6
  %root_node8 = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %fp_addr7, i32 0, i32 1
  %new_node = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 1
  %new_node9 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %new_node
  store { i32, i8*, i8* }* %new_node9, { i32, i8*, i8* }** %root_node8
  br label %merge

else:                                             ; preds = %test
  %fp_addr_in_sl10 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i32 0, i32 0
  %fp_addr11 = load { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }** %fp_addr_in_sl10
  %root_node12 = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %fp_addr11, i32 0, i32 1
  %root_node13 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root_node12
  call void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, { i32, i8*, i8* }* %root_node13)
  br label %merge

merge:                                            ; preds = %else, %then
  ret void
}

define void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { i32, i8*, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }
  %arg_address = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  store { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %0, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  br label %test1

then:                                             ; preds = %merge4
  %2 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i32 0, i32 0))
  %element_left = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 2
  %3 = bitcast i8** %element_left to { i32, i8*, i8* }**
  %fp_addr_in_sl11 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl11
  %new_node = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr12, i32 0, i32 1
  %new_node13 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %new_node
  store { i32, i8*, i8* }* %new_node13, { i32, i8*, i8* }** %3
  br label %merge

else:                                             ; preds = %merge4
  br label %test14

merge:                                            ; preds = %merge17, %then
  ret void

test1:                                            ; preds = %test
  %4 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @5, i32 0, i32 0))
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 0
  %field_var = load i32, i32* %element
  %fp_addr_in_sl = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl
  %value = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr, i32 0, i32 2
  %value6 = load i32, i32* %value
  %le_tmp = icmp sle i32 %field_var, %value6
  %bool_tmp = zext i1 %le_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then2, label %else3

then2:                                            ; preds = %test1
  %5 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i32 0, i32 0))
  %element8 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 2
  %field_var9 = load i8*, i8** %element8
  %6 = bitcast i8* %field_var9 to { i32, i8*, i8* }*
  %7 = bitcast { i32, i8*, i8* }* %6 to i8*
  %8 = call i32 @tig_nillable(i8* %7)
  br label %merge4

else3:                                            ; preds = %test1
  br label %merge4

merge4:                                           ; preds = %else3, %then2
  %if_result_addr.0 = phi i32 [ %8, %then2 ], [ 0, %else3 ]
  %cond10 = icmp eq i32 %if_result_addr.0, 1
  br i1 %cond10, label %then, label %else

test14:                                           ; preds = %else
  br label %test18

then15:                                           ; preds = %merge21
  %9 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %9, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @10, i32 0, i32 0))
  %element_left38 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 1
  %10 = bitcast i8** %element_left38 to { i32, i8*, i8* }**
  %fp_addr_in_sl39 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr40 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl39
  %new_node41 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr40, i32 0, i32 1
  %new_node42 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %new_node41
  store { i32, i8*, i8* }* %new_node42, { i32, i8*, i8* }** %10
  br label %merge17

else16:                                           ; preds = %merge21
  br label %test43

merge17:                                          ; preds = %merge46, %then15
  br label %merge

test18:                                           ; preds = %test14
  %11 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %11, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @8, i32 0, i32 0))
  %element23 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 0
  %field_var24 = load i32, i32* %element23
  %fp_addr_in_sl25 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr26 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl25
  %value27 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr26, i32 0, i32 2
  %value28 = load i32, i32* %value27
  %gt_tmp = icmp sgt i32 %field_var24, %value28
  %bool_tmp29 = zext i1 %gt_tmp to i32
  %cond30 = icmp eq i32 %bool_tmp29, 1
  br i1 %cond30, label %then19, label %else20

then19:                                           ; preds = %test18
  %12 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %12, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @9, i32 0, i32 0))
  %element32 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 1
  %field_var33 = load i8*, i8** %element32
  %13 = bitcast i8* %field_var33 to { i32, i8*, i8* }*
  %14 = bitcast { i32, i8*, i8* }* %13 to i8*
  %15 = call i32 @tig_nillable(i8* %14)
  br label %merge21

else20:                                           ; preds = %test18
  br label %merge21

merge21:                                          ; preds = %else20, %then19
  %if_result_addr34.0 = phi i32 [ %15, %then19 ], [ 0, %else20 ]
  %cond36 = icmp eq i32 %if_result_addr34.0, 1
  br i1 %cond36, label %then15, label %else16

test43:                                           ; preds = %else16
  %16 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %16, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @11, i32 0, i32 0))
  %element48 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 0
  %field_var49 = load i32, i32* %element48
  %fp_addr_in_sl50 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr51 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl50
  %value52 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr51, i32 0, i32 2
  %value53 = load i32, i32* %value52
  %le_tmp54 = icmp sle i32 %field_var49, %value53
  %bool_tmp55 = zext i1 %le_tmp54 to i32
  %cond56 = icmp eq i32 %bool_tmp55, 1
  br i1 %cond56, label %then44, label %else45

then44:                                           ; preds = %test43
  %17 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %17, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @12, i32 0, i32 0))
  %element58 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 2
  %field_var59 = load i8*, i8** %element58
  %18 = bitcast i8* %field_var59 to { i32, i8*, i8* }*
  %fp_addr_in_sl60 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr61 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl60
  call void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr61, { i32, i8*, i8* }* %18)
  br label %merge46

else45:                                           ; preds = %test43
  %19 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %19, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @13, i32 0, i32 0))
  %element63 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 1
  %field_var64 = load i8*, i8** %element63
  %20 = bitcast i8* %field_var64 to { i32, i8*, i8* }*
  %fp_addr_in_sl65 = getelementptr { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }, { { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr66 = load { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }*, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }** %fp_addr_in_sl65
  call void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %fp_addr66, { i32, i8*, i8* }* %20)
  br label %merge46

merge46:                                          ; preds = %else45, %then44
  br label %merge17
}

define void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %2 = bitcast { i32, i8*, i8* }* %1 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  %4 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @15, i32 0, i32 0))
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 1
  %field_var = load i8*, i8** %element
  %5 = bitcast i8* %field_var to { i32, i8*, i8* }*
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  call void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }* %fp_addr, { i32, i8*, i8* }* %5)
  %fp_addr_in_sl3 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr4 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl3
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr4, i32 0, i32 2
  %fp_addr_in_sl5 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr6 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl5
  %counter = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr6, i32 0, i32 1
  %counter7 = load i32, i32* %counter
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %6 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %6, i32 %counter7, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @16, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %counter7
  %7 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @17, i32 0, i32 0))
  %element9 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 0
  %field_var10 = load i32, i32* %element9
  store i32 %field_var10, i32* %arr_ele_addr
  %fp_addr_in_sl11 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl11
  %counter13 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr12, i32 0, i32 1
  %fp_addr_in_sl14 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr15 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl14
  %counter16 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr15, i32 0, i32 1
  %counter17 = load i32, i32* %counter16
  %add_tmp = add i32 %counter17, 1
  store i32 %add_tmp, i32* %counter13
  %8 = bitcast { i32, i8*, i8* }* %1 to i8*
  call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @18, i32 0, i32 0))
  %element19 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 2
  %field_var20 = load i8*, i8** %element19
  %9 = bitcast i8* %field_var20 to { i32, i8*, i8* }*
  %fp_addr_in_sl21 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr22 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl21
  call void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }* %fp_addr22, { i32, i8*, i8* }* %9)
  br label %merge

merge:                                            ; preds = %else, %then
  ret void
}

define { i32, i32* }* @create_array_test({ i32 }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %malloccall = tail call i8* @malloc(i32 20)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp slt i32 %i.0, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 1, i32* %Element
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 5, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp23, %loop11 ]
  %ge_tmp = icmp sge i32 4, %i7.0
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @19, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7.0
  %minus_tmp20 = sub i32 5, %i7.0
  %minus_tmp21 = sub i32 %minus_tmp20, 1
  store i32 %minus_tmp21, i32* %arr_ele_addr
  %add_tmp23 = add i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  ret { i32, i32* }* %array_wrapper
}
