; ModuleID = 'llvm_byte_code/test/merge_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [46 x i8] c"test/merge_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::29.35: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::29.45: Array out of bound\00"
@7 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::45.35: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::45.50: Array out of bound\00"
@9 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::47.38: Array out of bound\00"
@10 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::47.66: Array out of bound\00"
@11 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::52.38: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::52.67: Array out of bound\00"
@13 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::58.34: Array out of bound\00"
@14 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::58.62: Array out of bound\00"
@15 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::64.34: Array out of bound\00"
@16 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::64.63: Array out of bound\00"
@17 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::89.41: Array out of bound\00"
@18 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@19 = private unnamed_addr constant [15 x i8] c"==============\00"
@20 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@21 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::103.23: Array out of bound\00"
@22 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::104.23: Array out of bound\00"
@23 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::105.23: Array out of bound\00"
@24 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::106.23: Array out of bound\00"
@25 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::107.23: Array out of bound\00"
@26 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::111.23: Array out of bound\00"
@27 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::112.23: Array out of bound\00"
@28 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::113.23: Array out of bound\00"
@29 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::114.23: Array out of bound\00"
@30 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::115.23: Array out of bound\00"

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
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @18, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @19, i32 0, i32 0))
  %2 = call { i32, i32* }* @merge_sort({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %2)
  %3 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @21, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %4 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %4, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @22, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %5 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %5, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @23, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @24, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %7 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %7, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @25, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  %8 = call { i32, i32* }* @merge_sort({ i32 }* %frame_pointer, { i32, i32* }* %1)
  %9 = bitcast { i32, i32* }* %8 to i8*
  call void @tig_check_array_bound(i8* %9, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @26, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %8, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %10 = bitcast { i32, i32* }* %8 to i8*
  call void @tig_check_array_bound(i8* %10, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @27, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %8, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %11 = bitcast { i32, i32* }* %8 to i8*
  call void @tig_check_array_bound(i8* %11, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @28, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %8, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %12 = bitcast { i32, i32* }* %8 to i8*
  call void @tig_check_array_bound(i8* %12, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @29, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %8, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %13 = bitcast { i32, i32* }* %8 to i8*
  call void @tig_check_array_bound(i8* %13, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @30, i32 0, i32 0))
  %array_pointer47 = getelementptr { i32, i32* }, { i32, i32* }* %8, i32 0, i32 1
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

define { i32, i32* }* @merge_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  br label %test

test:                                             ; preds = %entry
  %lt_tmp = icmp slt i32 %3, 2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  %div_tmp = sdiv i32 %3, 2
  %minus_tmp = sub i32 %div_tmp, 1
  %4 = call { i32, i32* }* @sub_arr({ { i32 }* }* %frame_pointer, { i32, i32* }* %1, i32 0, i32 %minus_tmp)
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %5 = call { i32, i32* }* @merge_sort({ i32 }* %fp_addr, { i32, i32* }* %4)
  %minus_tmp10 = sub i32 %3, 1
  %6 = call { i32, i32* }* @sub_arr({ { i32 }* }* %frame_pointer, { i32, i32* }* %1, i32 %div_tmp, i32 %minus_tmp10)
  %fp_addr_in_sl11 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { i32 }*, { i32 }** %fp_addr_in_sl11
  %7 = call { i32, i32* }* @merge_sort({ i32 }* %fp_addr12, { i32, i32* }* %6)
  %8 = call { i32, i32* }* @merge({ { i32 }* }* %frame_pointer, { i32, i32* }* %5, { i32, i32* }* %7)
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result_addr.0 = phi { i32, i32* }* [ %8, %else ], [ %1, %then ]
  ret { i32, i32* }* %if_result_addr.0
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define { i32, i32* }* @sub_arr({ { i32 }* }*, { i32, i32* }*, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }* }* }
  %arg_address = getelementptr { { { i32 }* }* }, { { { i32 }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }* }* %0, { { i32 }* }** %arg_address
  %minus_tmp = sub i32 %3, %2
  %add_tmp = add i32 %minus_tmp, 1
  %mallocsize = mul i32 %add_tmp, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp5, %loop ]
  %lt_tmp = icmp slt i32 %i.0, %add_tmp
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 0, i32* %Element
  %add_tmp5 = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall6 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %add_tmp, i32* %array_info
  %array_info7 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info7
  %minus_tmp15 = sub i32 %3, %2
  br label %test16

test16:                                           ; preds = %loop17, %end
  %counter.0 = phi i32 [ %2, %end ], [ %add_tmp29, %loop17 ]
  %i12.0 = phi i32 [ 0, %end ], [ %add_tmp31, %loop17 ]
  %ge_tmp = icmp sge i32 %minus_tmp15, %i12.0
  %bool_tmp21 = zext i1 %ge_tmp to i32
  %cond22 = icmp eq i32 %bool_tmp21, 0
  br i1 %cond22, label %end18, label %loop17

loop17:                                           ; preds = %test16
  %4 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %4, i32 %i12.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i12.0
  %5 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr26 = load i32*, i32** %array_pointer
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i32 %counter.0
  %arr_ele = load i32, i32* %arr_ele_addr27
  store i32 %arr_ele, i32* %arr_ele_addr
  %add_tmp29 = add i32 %counter.0, 1
  %add_tmp31 = add i32 %i12.0, 1
  br label %test16

end18:                                            ; preds = %test16
  ret { i32, i32* }* %array_wrapper
}

define { i32, i32* }* @merge({ { i32 }* }*, { i32, i32* }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }* }* }
  %arg_address = getelementptr { { { i32 }* }* }, { { { i32 }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }* }* %0, { { i32 }* }** %arg_address
  %3 = bitcast { i32, i32* }* %1 to i8*
  %4 = call i32 @tig_array_length(i8* %3)
  %5 = bitcast { i32, i32* }* %2 to i8*
  %6 = call i32 @tig_array_length(i8* %5)
  %add_tmp = add i32 %4, %6
  %mallocsize = mul i32 %add_tmp, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp7, %loop ]
  %lt_tmp = icmp slt i32 %i.0, %add_tmp
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 0, i32* %Element
  %add_tmp7 = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall8 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %add_tmp, i32* %array_info
  %array_info9 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info9
  br label %test11

test11:                                           ; preds = %merge28, %end
  %i10.0 = phi i32 [ 0, %end ], [ %i10.1, %merge28 ]
  %j.0 = phi i32 [ 0, %end ], [ %j.1, %merge28 ]
  %result_counter.0 = phi i32 [ 0, %end ], [ %result_counter.1, %merge28 ]
  br label %test14

loop12:                                           ; preds = %merge
  br label %test25

end13:                                            ; preds = %merge
  %i10.0.lcssa = phi i32 [ %i10.0, %merge ]
  %j.0.lcssa = phi i32 [ %j.0, %merge ]
  %result_counter.0.lcssa = phi i32 [ %result_counter.0, %merge ]
  br label %test68

test14:                                           ; preds = %test11
  %lt_tmp17 = icmp slt i32 %i10.0, %4
  %bool_tmp18 = zext i1 %lt_tmp17 to i32
  %cond19 = icmp eq i32 %bool_tmp18, 0
  br i1 %cond19, label %else, label %then

then:                                             ; preds = %test14
  %lt_tmp22 = icmp slt i32 %j.0, %6
  %bool_tmp23 = zext i1 %lt_tmp22 to i32
  br label %merge

else:                                             ; preds = %test14
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result_addr.0 = phi i32 [ 0, %else ], [ %bool_tmp23, %then ]
  %cond24 = icmp eq i32 %if_result_addr.0, 0
  br i1 %cond24, label %end13, label %loop12

test25:                                           ; preds = %loop12
  %7 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %i10.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i10.0
  %arr_ele = load i32, i32* %arr_ele_addr
  %8 = bitcast { i32, i32* }* %2 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %j.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %array_pointer33 = getelementptr { i32, i32* }, { i32, i32* }* %2, i32 0, i32 1
  %arr_addr34 = load i32*, i32** %array_pointer33
  %arr_ele_addr35 = getelementptr i32, i32* %arr_addr34, i32 %j.0
  %arr_ele36 = load i32, i32* %arr_ele_addr35
  %lt_tmp37 = icmp slt i32 %arr_ele, %arr_ele36
  %bool_tmp38 = zext i1 %lt_tmp37 to i32
  %cond39 = icmp eq i32 %bool_tmp38, 0
  br i1 %cond39, label %else27, label %then26

then26:                                           ; preds = %test25
  %9 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %9, i32 %result_counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr41 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr42 = getelementptr i32, i32* %arr_addr41, i32 %result_counter.0
  %10 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %10, i32 %i10.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  %array_pointer45 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr46 = load i32*, i32** %array_pointer45
  %arr_ele_addr47 = getelementptr i32, i32* %arr_addr46, i32 %i10.0
  %arr_ele48 = load i32, i32* %arr_ele_addr47
  store i32 %arr_ele48, i32* %arr_ele_addr42
  %add_tmp50 = add i32 %i10.0, 1
  %add_tmp52 = add i32 %result_counter.0, 1
  br label %merge28

else27:                                           ; preds = %test25
  %11 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %11, i32 %result_counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  %array_addr_ptr55 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr56 = load i32*, i32** %array_addr_ptr55
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i32 %result_counter.0
  %12 = bitcast { i32, i32* }* %2 to i8*
  call void @tig_check_array_bound(i8* %12, i32 %j.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %array_pointer60 = getelementptr { i32, i32* }, { i32, i32* }* %2, i32 0, i32 1
  %arr_addr61 = load i32*, i32** %array_pointer60
  %arr_ele_addr62 = getelementptr i32, i32* %arr_addr61, i32 %j.0
  %arr_ele63 = load i32, i32* %arr_ele_addr62
  store i32 %arr_ele63, i32* %arr_ele_addr57
  %add_tmp65 = add i32 %j.0, 1
  %add_tmp67 = add i32 %result_counter.0, 1
  br label %merge28

merge28:                                          ; preds = %else27, %then26
  %i10.1 = phi i32 [ %i10.0, %else27 ], [ %add_tmp50, %then26 ]
  %j.1 = phi i32 [ %add_tmp65, %else27 ], [ %j.0, %then26 ]
  %result_counter.1 = phi i32 [ %add_tmp67, %else27 ], [ %add_tmp52, %then26 ]
  br label %test11

test68:                                           ; preds = %loop69, %end13
  %i10.2 = phi i32 [ %i10.0.lcssa, %end13 ], [ %add_tmp88, %loop69 ]
  %result_counter.2 = phi i32 [ %result_counter.0.lcssa, %end13 ], [ %add_tmp90, %loop69 ]
  %lt_tmp73 = icmp slt i32 %i10.2, %4
  %bool_tmp74 = zext i1 %lt_tmp73 to i32
  %cond75 = icmp eq i32 %bool_tmp74, 0
  br i1 %cond75, label %end70, label %loop69

loop69:                                           ; preds = %test68
  %13 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %13, i32 %result_counter.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  %array_addr_ptr78 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr79 = load i32*, i32** %array_addr_ptr78
  %arr_ele_addr80 = getelementptr i32, i32* %arr_addr79, i32 %result_counter.2
  %14 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %14, i32 %i10.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i32 0, i32 0))
  %array_pointer83 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr84 = load i32*, i32** %array_pointer83
  %arr_ele_addr85 = getelementptr i32, i32* %arr_addr84, i32 %i10.2
  %arr_ele86 = load i32, i32* %arr_ele_addr85
  store i32 %arr_ele86, i32* %arr_ele_addr80
  %add_tmp88 = add i32 %i10.2, 1
  %add_tmp90 = add i32 %result_counter.2, 1
  br label %test68

end70:                                            ; preds = %test68
  %result_counter.2.lcssa = phi i32 [ %result_counter.2, %test68 ]
  br label %test91

test91:                                           ; preds = %loop92, %end70
  %j.2 = phi i32 [ %j.0.lcssa, %end70 ], [ %add_tmp111, %loop92 ]
  %result_counter.3 = phi i32 [ %result_counter.2.lcssa, %end70 ], [ %add_tmp113, %loop92 ]
  %lt_tmp96 = icmp slt i32 %j.2, %6
  %bool_tmp97 = zext i1 %lt_tmp96 to i32
  %cond98 = icmp eq i32 %bool_tmp97, 0
  br i1 %cond98, label %end93, label %loop92

loop92:                                           ; preds = %test91
  %15 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %15, i32 %result_counter.3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @15, i32 0, i32 0))
  %array_addr_ptr101 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr102 = load i32*, i32** %array_addr_ptr101
  %arr_ele_addr103 = getelementptr i32, i32* %arr_addr102, i32 %result_counter.3
  %16 = bitcast { i32, i32* }* %2 to i8*
  call void @tig_check_array_bound(i8* %16, i32 %j.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @16, i32 0, i32 0))
  %array_pointer106 = getelementptr { i32, i32* }, { i32, i32* }* %2, i32 0, i32 1
  %arr_addr107 = load i32*, i32** %array_pointer106
  %arr_ele_addr108 = getelementptr i32, i32* %arr_addr107, i32 %j.2
  %arr_ele109 = load i32, i32* %arr_ele_addr108
  store i32 %arr_ele109, i32* %arr_ele_addr103
  %add_tmp111 = add i32 %j.2, 1
  %add_tmp113 = add i32 %result_counter.3, 1
  br label %test91

end93:                                            ; preds = %test91
  ret { i32, i32* }* %array_wrapper
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
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @17, i32 0, i32 0))
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
