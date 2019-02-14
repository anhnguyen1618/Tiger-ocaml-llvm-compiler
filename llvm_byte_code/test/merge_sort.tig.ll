; ModuleID = 'Tiger jit'
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
  %arr_test = alloca { i32, i32* }*
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  store { i32, i32* }* %0, { i32, i32* }** %arr
  %1 = call { i32, i32* }* @create_array_test({ i32 }* %frame_pointer)
  store { i32, i32* }* %1, { i32, i32* }** %arr_test
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @18, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr1)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @19, i32 0, i32 0))
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = call { i32, i32* }* @merge_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr2)
  store { i32, i32* }* %2, { i32, i32* }** %arr
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i32 0, i32 0))
  %arr3 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr3)
  %arr_test4 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %3 = bitcast { i32, i32* }* %arr_test4 to i8*
  call void @tig_check_array_bound(i8* %3, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @21, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr_test4, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %arr_test5 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %4 = bitcast { i32, i32* }* %arr_test5 to i8*
  call void @tig_check_array_bound(i8* %4, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @22, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test5, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %arr_test10 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %5 = bitcast { i32, i32* }* %arr_test10 to i8*
  call void @tig_check_array_bound(i8* %5, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @23, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test10, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %arr_test15 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %6 = bitcast { i32, i32* }* %arr_test15 to i8*
  call void @tig_check_array_bound(i8* %6, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @24, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test15, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %arr_test20 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %7 = bitcast { i32, i32* }* %arr_test20 to i8*
  call void @tig_check_array_bound(i8* %7, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @25, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test20, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  %arr_test25 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %8 = call { i32, i32* }* @merge_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr_test25)
  store { i32, i32* }* %8, { i32, i32* }** %arr_test
  %arr_test26 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %9 = bitcast { i32, i32* }* %arr_test26 to i8*
  call void @tig_check_array_bound(i8* %9, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @26, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test26, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %arr_test31 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %10 = bitcast { i32, i32* }* %arr_test31 to i8*
  call void @tig_check_array_bound(i8* %10, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @27, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test31, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %arr_test36 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %11 = bitcast { i32, i32* }* %arr_test36 to i8*
  call void @tig_check_array_bound(i8* %11, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @28, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test36, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %arr_test41 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %12 = bitcast { i32, i32* }* %arr_test41 to i8*
  call void @tig_check_array_bound(i8* %12, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @29, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test41, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %arr_test46 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %13 = bitcast { i32, i32* }* %arr_test46 to i8*
  call void @tig_check_array_bound(i8* %13, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @30, i32 0, i32 0))
  %array_pointer47 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test46, i32 0, i32 1
  %arr_addr48 = load i32*, i32** %array_pointer47
  %arr_ele_addr49 = getelementptr i32, i32* %arr_addr48, i32 4
  %arr_ele50 = load i32, i32* %arr_ele_addr49
  call void @assert_equal_int(i32 %arr_ele50, i32 4)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define void @print_array({ i32 }*, { i32, i32* }*) gc "ocaml" {
entry:
  %_limit = alloca i32
  %i = alloca i32
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %arr
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %minus_tmp = sub i32 %3, 1
  store i32 0, i32* %i
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %4 = bitcast { i32, i32* }* %arr2 to i8*
  %5 = call i32 @tig_array_length(i8* %4)
  %minus_tmp3 = sub i32 %5, 1
  store i32 %minus_tmp3, i32* %_limit
  br label %test

test:                                             ; preds = %loop, %entry
  %_limit4 = load i32, i32* %_limit
  %i5 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit4, %i5
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr
  %i7 = load i32, i32* %i
  %6 = bitcast { i32, i32* }* %arr6 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @print_arr_int_ele(i32 %arr_ele)
  %i8 = load i32, i32* %i
  %add_tmp = add i32 %i8, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret void
}

define { i32, i32* }* @create_array({ i32 }*) gc "ocaml" {
entry:
  %_limit = alloca i32
  %i7 = alloca i32
  %arr = alloca { i32, i32* }*
  %i = alloca i32
  %size = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 8, i32* %size
  %size1 = load i32, i32* %size
  %mallocsize = mul i32 %size1, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

test:                                             ; preds = %loop, %entry
  %i2 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i2, %size1
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i3 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i3
  store i32 1, i32* %Element
  %add_tmp = add i32 %i3, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %size1, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %arr
  %size6 = load i32, i32* %size
  %minus_tmp = sub i32 %size6, 1
  store i32 0, i32* %i7
  %size8 = load i32, i32* %size
  %minus_tmp9 = sub i32 %size8, 1
  store i32 %minus_tmp9, i32* %_limit
  br label %test10

test10:                                           ; preds = %loop11, %end
  %_limit13 = load i32, i32* %_limit
  %i14 = load i32, i32* %i7
  %ge_tmp = icmp sge i32 %_limit13, %i14
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i17, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i17
  %2 = call i32 @tig_random(i32 50)
  store i32 %2, i32* %arr_ele_addr
  %i18 = load i32, i32* %i7
  %add_tmp19 = add i32 %i18, 1
  store i32 %add_tmp19, i32* %i7
  br label %test10

end12:                                            ; preds = %test10
  %arr20 = load { i32, i32* }*, { i32, i32* }** %arr
  ret { i32, i32* }* %arr20
}

define { i32, i32* }* @merge_sort({ i32 }*, { i32, i32* }*) gc "ocaml" {
entry:
  %if_result_addr = alloca { i32, i32* }*
  %right_arr = alloca { i32, i32* }*
  %left_arr = alloca { i32, i32* }*
  %middle_index = alloca i32
  %length = alloca i32
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %arr
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  store i32 %3, i32* %length
  br label %test

test:                                             ; preds = %entry
  %length2 = load i32, i32* %length
  %lt_tmp = icmp slt i32 %length2, 2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  %arr3 = load { i32, i32* }*, { i32, i32* }** %arr
  store { i32, i32* }* %arr3, { i32, i32* }** %if_result_addr
  br label %merge

else:                                             ; preds = %test
  %length4 = load i32, i32* %length
  %div_tmp = sdiv i32 %length4, 2
  store i32 %div_tmp, i32* %middle_index
  %arr5 = load { i32, i32* }*, { i32, i32* }** %arr
  %middle_index6 = load i32, i32* %middle_index
  %minus_tmp = sub i32 %middle_index6, 1
  %4 = call { i32, i32* }* @sub_arr({ { i32 }* }* %frame_pointer, { i32, i32* }* %arr5, i32 0, i32 %minus_tmp)
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %5 = call { i32, i32* }* @merge_sort({ i32 }* %fp_addr, { i32, i32* }* %4)
  store { i32, i32* }* %5, { i32, i32* }** %left_arr
  %arr7 = load { i32, i32* }*, { i32, i32* }** %arr
  %middle_index8 = load i32, i32* %middle_index
  %length9 = load i32, i32* %length
  %minus_tmp10 = sub i32 %length9, 1
  %6 = call { i32, i32* }* @sub_arr({ { i32 }* }* %frame_pointer, { i32, i32* }* %arr7, i32 %middle_index8, i32 %minus_tmp10)
  %fp_addr_in_sl11 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { i32 }*, { i32 }** %fp_addr_in_sl11
  %7 = call { i32, i32* }* @merge_sort({ i32 }* %fp_addr12, { i32, i32* }* %6)
  store { i32, i32* }* %7, { i32, i32* }** %right_arr
  %left_arr13 = load { i32, i32* }*, { i32, i32* }** %left_arr
  %right_arr14 = load { i32, i32* }*, { i32, i32* }** %right_arr
  %8 = call { i32, i32* }* @merge({ { i32 }* }* %frame_pointer, { i32, i32* }* %left_arr13, { i32, i32* }* %right_arr14)
  store { i32, i32* }* %8, { i32, i32* }** %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load { i32, i32* }*, { i32, i32* }** %if_result_addr
  ret { i32, i32* }* %if_result
}

declare noalias i8* @malloc(i32)

define { i32, i32* }* @sub_arr({ { i32 }* }*, { i32, i32* }*, i32, i32) gc "ocaml" {
entry:
  %_limit = alloca i32
  %i12 = alloca i32
  %counter = alloca i32
  %new_arr = alloca { i32, i32* }*
  %i = alloca i32
  %hi = alloca i32
  %lo = alloca i32
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { { i32 }* }* }
  %arg_address = getelementptr { { { i32 }* }* }, { { { i32 }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }* }* %0, { { i32 }* }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %arr
  store i32 %2, i32* %lo
  store i32 %3, i32* %hi
  %hi1 = load i32, i32* %hi
  %lo2 = load i32, i32* %lo
  %minus_tmp = sub i32 %hi1, %lo2
  %add_tmp = add i32 %minus_tmp, 1
  %mallocsize = mul i32 %add_tmp, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

test:                                             ; preds = %loop, %entry
  %i3 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i3, %add_tmp
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i4 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i4
  store i32 0, i32* %Element
  %add_tmp5 = add i32 %i4, 1
  store i32 %add_tmp5, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall6 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %add_tmp, i32* %array_info
  %array_info7 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info7
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %new_arr
  %lo8 = load i32, i32* %lo
  store i32 %lo8, i32* %counter
  %hi9 = load i32, i32* %hi
  %lo10 = load i32, i32* %lo
  %minus_tmp11 = sub i32 %hi9, %lo10
  store i32 0, i32* %i12
  %hi13 = load i32, i32* %hi
  %lo14 = load i32, i32* %lo
  %minus_tmp15 = sub i32 %hi13, %lo14
  store i32 %minus_tmp15, i32* %_limit
  br label %test16

test16:                                           ; preds = %loop17, %end
  %_limit19 = load i32, i32* %_limit
  %i20 = load i32, i32* %i12
  %ge_tmp = icmp sge i32 %_limit19, %i20
  %bool_tmp21 = zext i1 %ge_tmp to i32
  %cond22 = icmp eq i32 %bool_tmp21, 1
  br i1 %cond22, label %loop17, label %end18

loop17:                                           ; preds = %test16
  %i23 = load i32, i32* %i12
  %load_left = load { i32, i32* }*, { i32, i32* }** %new_arr
  %4 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %4, i32 %i23, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i23
  %arr24 = load { i32, i32* }*, { i32, i32* }** %arr
  %counter25 = load i32, i32* %counter
  %5 = bitcast { i32, i32* }* %arr24 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %counter25, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr24, i32 0, i32 1
  %arr_addr26 = load i32*, i32** %array_pointer
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i32 %counter25
  %arr_ele = load i32, i32* %arr_ele_addr27
  store i32 %arr_ele, i32* %arr_ele_addr
  %counter28 = load i32, i32* %counter
  %add_tmp29 = add i32 %counter28, 1
  store i32 %add_tmp29, i32* %counter
  %i30 = load i32, i32* %i12
  %add_tmp31 = add i32 %i30, 1
  store i32 %add_tmp31, i32* %i12
  br label %test16

end18:                                            ; preds = %test16
  %new_arr32 = load { i32, i32* }*, { i32, i32* }** %new_arr
  ret { i32, i32* }* %new_arr32
}

define { i32, i32* }* @merge({ { i32 }* }*, { i32, i32* }*, { i32, i32* }*) gc "ocaml" {
entry:
  %if_result_addr = alloca i32
  %result_counter = alloca i32
  %j = alloca i32
  %i10 = alloca i32
  %result_arr = alloca { i32, i32* }*
  %i = alloca i32
  %right_length = alloca i32
  %left_length = alloca i32
  %right_arr = alloca { i32, i32* }*
  %left_arr = alloca { i32, i32* }*
  %frame_pointer = alloca { { { i32 }* }* }
  %arg_address = getelementptr { { { i32 }* }* }, { { { i32 }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }* }* %0, { { i32 }* }** %arg_address
  store { i32, i32* }* %1, { i32, i32* }** %left_arr
  store { i32, i32* }* %2, { i32, i32* }** %right_arr
  %left_arr1 = load { i32, i32* }*, { i32, i32* }** %left_arr
  %3 = bitcast { i32, i32* }* %left_arr1 to i8*
  %4 = call i32 @tig_array_length(i8* %3)
  store i32 %4, i32* %left_length
  %right_arr2 = load { i32, i32* }*, { i32, i32* }** %right_arr
  %5 = bitcast { i32, i32* }* %right_arr2 to i8*
  %6 = call i32 @tig_array_length(i8* %5)
  store i32 %6, i32* %right_length
  %left_length3 = load i32, i32* %left_length
  %right_length4 = load i32, i32* %right_length
  %add_tmp = add i32 %left_length3, %right_length4
  %mallocsize = mul i32 %add_tmp, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

test:                                             ; preds = %loop, %entry
  %i5 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i5, %add_tmp
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i6 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i6
  store i32 0, i32* %Element
  %add_tmp7 = add i32 %i6, 1
  store i32 %add_tmp7, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall8 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %add_tmp, i32* %array_info
  %array_info9 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info9
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %result_arr
  store i32 0, i32* %i10
  store i32 0, i32* %j
  store i32 0, i32* %result_counter
  br label %test11

test11:                                           ; preds = %merge28, %end
  br label %test14

loop12:                                           ; preds = %merge
  br label %test25

end13:                                            ; preds = %merge
  br label %test68

test14:                                           ; preds = %test11
  %i15 = load i32, i32* %i10
  %left_length16 = load i32, i32* %left_length
  %lt_tmp17 = icmp slt i32 %i15, %left_length16
  %bool_tmp18 = zext i1 %lt_tmp17 to i32
  %cond19 = icmp eq i32 %bool_tmp18, 1
  br i1 %cond19, label %then, label %else

then:                                             ; preds = %test14
  %j20 = load i32, i32* %j
  %right_length21 = load i32, i32* %right_length
  %lt_tmp22 = icmp slt i32 %j20, %right_length21
  %bool_tmp23 = zext i1 %lt_tmp22 to i32
  store i32 %bool_tmp23, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test14
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  %cond24 = icmp eq i32 %if_result, 1
  br i1 %cond24, label %loop12, label %end13

test25:                                           ; preds = %loop12
  %left_arr29 = load { i32, i32* }*, { i32, i32* }** %left_arr
  %i30 = load i32, i32* %i10
  %7 = bitcast { i32, i32* }* %left_arr29 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %i30, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %left_arr29, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i30
  %arr_ele = load i32, i32* %arr_ele_addr
  %right_arr31 = load { i32, i32* }*, { i32, i32* }** %right_arr
  %j32 = load i32, i32* %j
  %8 = bitcast { i32, i32* }* %right_arr31 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %j32, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %array_pointer33 = getelementptr { i32, i32* }, { i32, i32* }* %right_arr31, i32 0, i32 1
  %arr_addr34 = load i32*, i32** %array_pointer33
  %arr_ele_addr35 = getelementptr i32, i32* %arr_addr34, i32 %j32
  %arr_ele36 = load i32, i32* %arr_ele_addr35
  %lt_tmp37 = icmp slt i32 %arr_ele, %arr_ele36
  %bool_tmp38 = zext i1 %lt_tmp37 to i32
  %cond39 = icmp eq i32 %bool_tmp38, 1
  br i1 %cond39, label %then26, label %else27

then26:                                           ; preds = %test25
  %result_counter40 = load i32, i32* %result_counter
  %load_left = load { i32, i32* }*, { i32, i32* }** %result_arr
  %9 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %9, i32 %result_counter40, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr41 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr42 = getelementptr i32, i32* %arr_addr41, i32 %result_counter40
  %left_arr43 = load { i32, i32* }*, { i32, i32* }** %left_arr
  %i44 = load i32, i32* %i10
  %10 = bitcast { i32, i32* }* %left_arr43 to i8*
  call void @tig_check_array_bound(i8* %10, i32 %i44, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  %array_pointer45 = getelementptr { i32, i32* }, { i32, i32* }* %left_arr43, i32 0, i32 1
  %arr_addr46 = load i32*, i32** %array_pointer45
  %arr_ele_addr47 = getelementptr i32, i32* %arr_addr46, i32 %i44
  %arr_ele48 = load i32, i32* %arr_ele_addr47
  store i32 %arr_ele48, i32* %arr_ele_addr42
  %i49 = load i32, i32* %i10
  %add_tmp50 = add i32 %i49, 1
  store i32 %add_tmp50, i32* %i10
  %result_counter51 = load i32, i32* %result_counter
  %add_tmp52 = add i32 %result_counter51, 1
  store i32 %add_tmp52, i32* %result_counter
  br label %merge28

else27:                                           ; preds = %test25
  %result_counter53 = load i32, i32* %result_counter
  %load_left54 = load { i32, i32* }*, { i32, i32* }** %result_arr
  %11 = bitcast { i32, i32* }* %load_left54 to i8*
  call void @tig_check_array_bound(i8* %11, i32 %result_counter53, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  %array_addr_ptr55 = getelementptr { i32, i32* }, { i32, i32* }* %load_left54, i32 0, i32 1
  %arr_addr56 = load i32*, i32** %array_addr_ptr55
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i32 %result_counter53
  %right_arr58 = load { i32, i32* }*, { i32, i32* }** %right_arr
  %j59 = load i32, i32* %j
  %12 = bitcast { i32, i32* }* %right_arr58 to i8*
  call void @tig_check_array_bound(i8* %12, i32 %j59, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %array_pointer60 = getelementptr { i32, i32* }, { i32, i32* }* %right_arr58, i32 0, i32 1
  %arr_addr61 = load i32*, i32** %array_pointer60
  %arr_ele_addr62 = getelementptr i32, i32* %arr_addr61, i32 %j59
  %arr_ele63 = load i32, i32* %arr_ele_addr62
  store i32 %arr_ele63, i32* %arr_ele_addr57
  %j64 = load i32, i32* %j
  %add_tmp65 = add i32 %j64, 1
  store i32 %add_tmp65, i32* %j
  %result_counter66 = load i32, i32* %result_counter
  %add_tmp67 = add i32 %result_counter66, 1
  store i32 %add_tmp67, i32* %result_counter
  br label %merge28

merge28:                                          ; preds = %else27, %then26
  br label %test11

test68:                                           ; preds = %loop69, %end13
  %i71 = load i32, i32* %i10
  %left_length72 = load i32, i32* %left_length
  %lt_tmp73 = icmp slt i32 %i71, %left_length72
  %bool_tmp74 = zext i1 %lt_tmp73 to i32
  %cond75 = icmp eq i32 %bool_tmp74, 1
  br i1 %cond75, label %loop69, label %end70

loop69:                                           ; preds = %test68
  %result_counter76 = load i32, i32* %result_counter
  %load_left77 = load { i32, i32* }*, { i32, i32* }** %result_arr
  %13 = bitcast { i32, i32* }* %load_left77 to i8*
  call void @tig_check_array_bound(i8* %13, i32 %result_counter76, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  %array_addr_ptr78 = getelementptr { i32, i32* }, { i32, i32* }* %load_left77, i32 0, i32 1
  %arr_addr79 = load i32*, i32** %array_addr_ptr78
  %arr_ele_addr80 = getelementptr i32, i32* %arr_addr79, i32 %result_counter76
  %left_arr81 = load { i32, i32* }*, { i32, i32* }** %left_arr
  %i82 = load i32, i32* %i10
  %14 = bitcast { i32, i32* }* %left_arr81 to i8*
  call void @tig_check_array_bound(i8* %14, i32 %i82, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i32 0, i32 0))
  %array_pointer83 = getelementptr { i32, i32* }, { i32, i32* }* %left_arr81, i32 0, i32 1
  %arr_addr84 = load i32*, i32** %array_pointer83
  %arr_ele_addr85 = getelementptr i32, i32* %arr_addr84, i32 %i82
  %arr_ele86 = load i32, i32* %arr_ele_addr85
  store i32 %arr_ele86, i32* %arr_ele_addr80
  %i87 = load i32, i32* %i10
  %add_tmp88 = add i32 %i87, 1
  store i32 %add_tmp88, i32* %i10
  %result_counter89 = load i32, i32* %result_counter
  %add_tmp90 = add i32 %result_counter89, 1
  store i32 %add_tmp90, i32* %result_counter
  br label %test68

end70:                                            ; preds = %test68
  br label %test91

test91:                                           ; preds = %loop92, %end70
  %j94 = load i32, i32* %j
  %right_length95 = load i32, i32* %right_length
  %lt_tmp96 = icmp slt i32 %j94, %right_length95
  %bool_tmp97 = zext i1 %lt_tmp96 to i32
  %cond98 = icmp eq i32 %bool_tmp97, 1
  br i1 %cond98, label %loop92, label %end93

loop92:                                           ; preds = %test91
  %result_counter99 = load i32, i32* %result_counter
  %load_left100 = load { i32, i32* }*, { i32, i32* }** %result_arr
  %15 = bitcast { i32, i32* }* %load_left100 to i8*
  call void @tig_check_array_bound(i8* %15, i32 %result_counter99, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @15, i32 0, i32 0))
  %array_addr_ptr101 = getelementptr { i32, i32* }, { i32, i32* }* %load_left100, i32 0, i32 1
  %arr_addr102 = load i32*, i32** %array_addr_ptr101
  %arr_ele_addr103 = getelementptr i32, i32* %arr_addr102, i32 %result_counter99
  %right_arr104 = load { i32, i32* }*, { i32, i32* }** %right_arr
  %j105 = load i32, i32* %j
  %16 = bitcast { i32, i32* }* %right_arr104 to i8*
  call void @tig_check_array_bound(i8* %16, i32 %j105, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @16, i32 0, i32 0))
  %array_pointer106 = getelementptr { i32, i32* }, { i32, i32* }* %right_arr104, i32 0, i32 1
  %arr_addr107 = load i32*, i32** %array_pointer106
  %arr_ele_addr108 = getelementptr i32, i32* %arr_addr107, i32 %j105
  %arr_ele109 = load i32, i32* %arr_ele_addr108
  store i32 %arr_ele109, i32* %arr_ele_addr103
  %j110 = load i32, i32* %j
  %add_tmp111 = add i32 %j110, 1
  store i32 %add_tmp111, i32* %j
  %result_counter112 = load i32, i32* %result_counter
  %add_tmp113 = add i32 %result_counter112, 1
  store i32 %add_tmp113, i32* %result_counter
  br label %test91

end93:                                            ; preds = %test91
  %result_arr114 = load { i32, i32* }*, { i32, i32* }** %result_arr
  ret { i32, i32* }* %result_arr114
}

define { i32, i32* }* @create_array_test({ i32 }*) gc "ocaml" {
entry:
  %_limit = alloca i32
  %i7 = alloca i32
  %arr = alloca { i32, i32* }*
  %i = alloca i32
  %size = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 5, i32* %size
  %size1 = load i32, i32* %size
  %mallocsize = mul i32 %size1, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

test:                                             ; preds = %loop, %entry
  %i2 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i2, %size1
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i3 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i3
  store i32 1, i32* %Element
  %add_tmp = add i32 %i3, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %size1, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %arr
  %size6 = load i32, i32* %size
  %minus_tmp = sub i32 %size6, 1
  store i32 0, i32* %i7
  %size8 = load i32, i32* %size
  %minus_tmp9 = sub i32 %size8, 1
  store i32 %minus_tmp9, i32* %_limit
  br label %test10

test10:                                           ; preds = %loop11, %end
  %_limit13 = load i32, i32* %_limit
  %i14 = load i32, i32* %i7
  %ge_tmp = icmp sge i32 %_limit13, %i14
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i17, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @17, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i17
  %size18 = load i32, i32* %size
  %i19 = load i32, i32* %i7
  %minus_tmp20 = sub i32 %size18, %i19
  %minus_tmp21 = sub i32 %minus_tmp20, 1
  store i32 %minus_tmp21, i32* %arr_ele_addr
  %i22 = load i32, i32* %i7
  %add_tmp23 = add i32 %i22, 1
  store i32 %add_tmp23, i32* %i7
  br label %test10

end12:                                            ; preds = %test10
  %arr24 = load { i32, i32* }*, { i32, i32* }** %arr
  ret { i32, i32* }* %arr24
}
