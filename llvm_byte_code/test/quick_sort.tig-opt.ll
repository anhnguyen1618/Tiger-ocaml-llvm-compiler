; ModuleID = 'llvm_byte_code/test/quick_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [46 x i8] c"test/quick_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::24.36: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::25.47: Array out of bound\00"
@7 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::29.46: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::30.48: Array out of bound\00"
@9 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::34.35: Array out of bound\00"
@10 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::35.35: Array out of bound\00"
@11 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::39.43: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::40.23: Array out of bound\00"
@13 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::41.23: Array out of bound\00"
@14 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::64.41: Array out of bound\00"
@15 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@16 = private unnamed_addr constant [15 x i8] c"==============\00"
@17 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@18 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::78.23: Array out of bound\00"
@19 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::79.23: Array out of bound\00"
@20 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::80.23: Array out of bound\00"
@21 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::81.23: Array out of bound\00"
@22 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::82.23: Array out of bound\00"
@23 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::86.23: Array out of bound\00"
@24 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::87.23: Array out of bound\00"
@25 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::88.23: Array out of bound\00"
@26 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::89.23: Array out of bound\00"
@27 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::90.23: Array out of bound\00"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @print_arr_int_ele(i32) local_unnamed_addr gc "ocaml"

declare i32 @tig_array_length(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_random(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  %1 = call { i32, i32* }* @create_array_test({ i32 }* %frame_pointer)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @15, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i32 0, i32 0))
  call void @quick_sort({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @17, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @18, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %3 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @19, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %4 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %4, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @20, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %5 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %5, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @21, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @22, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @quick_sort({ i32 }* %frame_pointer, { i32, i32* }* %1)
  %7 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %7, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @23, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %8 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @24, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %9 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %9, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @25, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %10 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %10, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @26, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %11 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %11, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @27, i32 0, i32 0))
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i32 0, i32 0))
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

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
  %cond16 = icmp eq i32 %bool_tmp15, 0
  br i1 %cond16, label %end12, label %loop11

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i32 0, i32 0))
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

define void @quick_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }*, { i32, i32* }* }
  %arg_address = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %arg_address1 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1
  %arr = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr2 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %minus_tmp = sub i32 %3, 1
  call void @sort({ { i32 }*, { i32, i32* }* }* %frame_pointer, i32 0, i32 %minus_tmp)
  ret void
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define i32 @partition({ { i32 }*, { i32, i32* }* }*, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }*, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, { i32, i32* }* }* %0, { { i32 }*, { i32, i32* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr, i32 0, i32 1
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %3 = bitcast { i32, i32* }* %arr2 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr2, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %2
  %arr_ele = load i32, i32* %arr_ele_addr
  %fp_addr_in_sl4 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr5 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl4
  %arr6 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr5, i32 0, i32 1
  %arr7 = load { i32, i32* }*, { i32, i32* }** %arr6
  %4 = bitcast { i32, i32* }* %arr7 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %minus_tmp17 = sub i32 %2, 1
  br label %test

test:                                             ; preds = %merge, %entry
  %i.0 = phi i32 [ %1, %entry ], [ %add_tmp61, %merge ]
  %wall_index.0 = phi i32 [ %1, %entry ], [ %wall_index.1, %merge ]
  %ge_tmp = icmp sge i32 %minus_tmp17, %i.0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %fp_addr_in_sl20 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr21 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl20
  %arr22 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr21, i32 0, i32 1
  %arr23 = load { i32, i32* }*, { i32, i32* }** %arr22
  %5 = bitcast { i32, i32* }* %arr23 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  %array_pointer25 = getelementptr { i32, i32* }, { i32, i32* }* %arr23, i32 0, i32 1
  %arr_addr26 = load i32*, i32** %array_pointer25
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i32 %i.0
  %arr_ele28 = load i32, i32* %arr_ele_addr27
  %fp_addr_in_sl29 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr30 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl29
  %arr31 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr30, i32 0, i32 1
  %arr32 = load { i32, i32* }*, { i32, i32* }** %arr31
  %6 = bitcast { i32, i32* }* %arr32 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %array_pointer34 = getelementptr { i32, i32* }, { i32, i32* }* %arr32, i32 0, i32 1
  %arr_addr35 = load i32*, i32** %array_pointer34
  %arr_ele_addr36 = getelementptr i32, i32* %arr_addr35, i32 %wall_index.0
  %arr_ele37 = load i32, i32* %arr_ele_addr36
  br label %test38

end:                                              ; preds = %test
  %wall_index.0.lcssa = phi i32 [ %wall_index.0, %test ]
  %fp_addr_in_sl62 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr63 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl62
  %arr64 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr63, i32 0, i32 1
  %arr65 = load { i32, i32* }*, { i32, i32* }** %arr64
  %7 = bitcast { i32, i32* }* %arr65 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %wall_index.0.lcssa, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  %array_pointer67 = getelementptr { i32, i32* }, { i32, i32* }* %arr65, i32 0, i32 1
  %arr_addr68 = load i32*, i32** %array_pointer67
  %arr_ele_addr69 = getelementptr i32, i32* %arr_addr68, i32 %wall_index.0.lcssa
  %arr_ele70 = load i32, i32* %arr_ele_addr69
  %fp_addr_in_sl71 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr72 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl71
  %arr73 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr72, i32 0, i32 1
  %load_left75 = load { i32, i32* }*, { i32, i32* }** %arr73
  %8 = bitcast { i32, i32* }* %load_left75 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %wall_index.0.lcssa, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %array_addr_ptr76 = getelementptr { i32, i32* }, { i32, i32* }* %load_left75, i32 0, i32 1
  %arr_addr77 = load i32*, i32** %array_addr_ptr76
  %arr_ele_addr78 = getelementptr i32, i32* %arr_addr77, i32 %wall_index.0.lcssa
  store i32 %arr_ele, i32* %arr_ele_addr78
  %fp_addr_in_sl80 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr81 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl80
  %arr82 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr81, i32 0, i32 1
  %load_left84 = load { i32, i32* }*, { i32, i32* }** %arr82
  %9 = bitcast { i32, i32* }* %load_left84 to i8*
  call void @tig_check_array_bound(i8* %9, i32 %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  %array_addr_ptr85 = getelementptr { i32, i32* }, { i32, i32* }* %load_left84, i32 0, i32 1
  %arr_addr86 = load i32*, i32** %array_addr_ptr85
  %arr_ele_addr87 = getelementptr i32, i32* %arr_addr86, i32 %2
  store i32 %arr_ele70, i32* %arr_ele_addr87
  ret i32 %wall_index.0.lcssa

test38:                                           ; preds = %loop
  %lt_tmp = icmp slt i32 %arr_ele28, %arr_ele
  %bool_tmp41 = zext i1 %lt_tmp to i32
  %cond42 = icmp eq i32 %bool_tmp41, 0
  br i1 %cond42, label %else, label %then

then:                                             ; preds = %test38
  %fp_addr_in_sl43 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr44 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl43
  %arr45 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr44, i32 0, i32 1
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr45
  %10 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %10, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr47 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr48 = getelementptr i32, i32* %arr_addr47, i32 %wall_index.0
  store i32 %arr_ele28, i32* %arr_ele_addr48
  %fp_addr_in_sl50 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr51 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl50
  %arr52 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr51, i32 0, i32 1
  %load_left54 = load { i32, i32* }*, { i32, i32* }** %arr52
  %11 = bitcast { i32, i32* }* %load_left54 to i8*
  call void @tig_check_array_bound(i8* %11, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  %array_addr_ptr55 = getelementptr { i32, i32* }, { i32, i32* }* %load_left54, i32 0, i32 1
  %arr_addr56 = load i32*, i32** %array_addr_ptr55
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i32 %i.0
  store i32 %arr_ele37, i32* %arr_ele_addr57
  %add_tmp = add i32 %wall_index.0, 1
  br label %merge

else:                                             ; preds = %test38
  br label %merge

merge:                                            ; preds = %else, %then
  %wall_index.1 = phi i32 [ %wall_index.0, %else ], [ %add_tmp, %then ]
  %add_tmp61 = add i32 %i.0, 1
  br label %test
}

define void @sort({ { i32 }*, { i32, i32* }* }*, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }*, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, { i32, i32* }* }* %0, { { i32 }*, { i32, i32* }* }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %lt_tmp = icmp slt i32 %1, %2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %test
  %fp_addr_in_sl = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl
  %3 = call i32 @partition({ { i32 }*, { i32, i32* }* }* %fp_addr, i32 %1, i32 %2)
  %minus_tmp = sub i32 %3, 1
  %fp_addr_in_sl7 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr8 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl7
  call void @sort({ { i32 }*, { i32, i32* }* }* %fp_addr8, i32 %1, i32 %minus_tmp)
  %add_tmp = add i32 %3, 1
  %fp_addr_in_sl11 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl11
  call void @sort({ { i32 }*, { i32, i32* }* }* %fp_addr12, i32 %add_tmp, i32 %2)
  br label %merge

else:                                             ; preds = %test
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

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
  %cond16 = icmp eq i32 %bool_tmp15, 0
  br i1 %cond16, label %end12, label %loop11

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i32 0, i32 0))
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
