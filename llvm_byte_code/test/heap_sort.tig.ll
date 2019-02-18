; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [45 x i8] c"test/heap_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::36.37: Array out of bound\00"
@6 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::37.37: Array out of bound\00"
@7 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::39.23: Array out of bound\00"
@8 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::40.23: Array out of bound\00"
@9 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::45.38: Array out of bound\00"
@10 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::50.47: Array out of bound\00"
@11 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::51.40: Array out of bound\00"
@12 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::53.46: Array out of bound\00"
@13 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::54.40: Array out of bound\00"
@14 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::56.37: Array out of bound\00"
@15 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::80.41: Array out of bound\00"
@16 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@17 = private unnamed_addr constant [15 x i8] c"==============\00"
@18 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@19 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::94.23: Array out of bound\00"
@20 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::95.23: Array out of bound\00"
@21 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::96.23: Array out of bound\00"
@22 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::97.23: Array out of bound\00"
@23 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::98.23: Array out of bound\00"
@24 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::102.23: Array out of bound\00"
@25 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::103.23: Array out of bound\00"
@26 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::104.23: Array out of bound\00"
@27 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::105.23: Array out of bound\00"
@28 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::106.23: Array out of bound\00"

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
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr1)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @17, i32 0, i32 0))
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @heap_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr2)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i32 0, i32 0))
  %arr3 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr3)
  %arr_test4 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %2 = bitcast { i32, i32* }* %arr_test4 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @19, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr_test4, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %arr_test5 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %3 = bitcast { i32, i32* }* %arr_test5 to i8*
  call void @tig_check_array_bound(i8* %3, i32 1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @20, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test5, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %arr_test10 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %4 = bitcast { i32, i32* }* %arr_test10 to i8*
  call void @tig_check_array_bound(i8* %4, i32 2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @21, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test10, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %arr_test15 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %5 = bitcast { i32, i32* }* %arr_test15 to i8*
  call void @tig_check_array_bound(i8* %5, i32 3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @22, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test15, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %arr_test20 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %6 = bitcast { i32, i32* }* %arr_test20 to i8*
  call void @tig_check_array_bound(i8* %6, i32 4, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @23, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test20, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  %arr_test25 = load { i32, i32* }*, { i32, i32* }** %arr_test
  call void @heap_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr_test25)
  %arr_test26 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %7 = bitcast { i32, i32* }* %arr_test26 to i8*
  call void @tig_check_array_bound(i8* %7, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @24, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test26, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %arr_test31 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %8 = bitcast { i32, i32* }* %arr_test31 to i8*
  call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @25, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test31, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %arr_test36 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %9 = bitcast { i32, i32* }* %arr_test36 to i8*
  call void @tig_check_array_bound(i8* %9, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @26, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test36, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %arr_test41 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %10 = bitcast { i32, i32* }* %arr_test41 to i8*
  call void @tig_check_array_bound(i8* %10, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @27, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %arr_test41, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %arr_test46 = load { i32, i32* }*, { i32, i32* }** %arr_test
  %11 = bitcast { i32, i32* }* %arr_test46 to i8*
  call void @tig_check_array_bound(i8* %11, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @28, i32 0, i32 0))
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr
  %i7 = load i32, i32* %i
  %6 = bitcast { i32, i32* }* %arr6 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i7, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @1, i32 0, i32 0))
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

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
  %cond16 = icmp eq i32 %bool_tmp15, 0
  br i1 %cond16, label %end12, label %loop11

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i17, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @4, i32 0, i32 0))
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

define void @heap_sort({ i32 }*, { i32, i32* }*) gc "ocaml" {
entry:
  %size = alloca i32
  %frame_pointer = alloca { { i32 }*, i32, { i32, i32* }* }
  %arg_address = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %arg_address1 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr2 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %var_dec = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  store i32 %3, i32* %var_dec
  %arr_size = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  %arr_size3 = load i32, i32* %arr_size
  store i32 %arr_size3, i32* %size
  call void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer)
  %arr_size4 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  %arr_size5 = load i32, i32* %arr_size4
  %minus_tmp = sub i32 %arr_size5, 1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %minus_tmp)
  %size6 = load i32, i32* %size
  %minus_tmp7 = sub i32 %size6, 1
  store i32 %minus_tmp7, i32* %size
  br label %test

test:                                             ; preds = %loop, %entry
  %size8 = load i32, i32* %size
  %gt_tmp = icmp sgt i32 %size8, 1
  %bool_tmp = zext i1 %gt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %size9 = load i32, i32* %size
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %size9)
  %size10 = load i32, i32* %size
  %minus_tmp11 = sub i32 %size10, 1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %minus_tmp11)
  %size12 = load i32, i32* %size
  %minus_tmp13 = sub i32 %size12, 1
  store i32 %minus_tmp13, i32* %size
  br label %test

end:                                              ; preds = %test
  ret void
}

declare noalias i8* @malloc(i32)

define void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }*) gc "ocaml" {
entry:
  %index = alloca i32
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr_size = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 1
  %arr_size1 = load i32, i32* %arr_size
  %minus_tmp = sub i32 %arr_size1, 1
  %div_tmp = sdiv i32 %minus_tmp, 2
  store i32 %div_tmp, i32* %index
  br label %test

test:                                             ; preds = %loop, %entry
  %index2 = load i32, i32* %index
  %ge_tmp = icmp sge i32 %index2, 0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %index3 = load i32, i32* %index
  %fp_addr_in_sl4 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr5 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl4
  %arr_size6 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr5, i32 0, i32 1
  %arr_size7 = load i32, i32* %arr_size6
  %fp_addr_in_sl8 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr9 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl8
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %fp_addr9, i32 %index3, i32 %arr_size7)
  %index10 = load i32, i32* %index
  %minus_tmp11 = sub i32 %index10, 1
  store i32 %minus_tmp11, i32* %index
  br label %test

end:                                              ; preds = %test
  ret void
}

define void @swap({ { i32 }*, i32, { i32, i32* }* }*, i32, i32) gc "ocaml" {
entry:
  %temp_b = alloca i32
  %temp_a = alloca i32
  %b = alloca i32
  %a = alloca i32
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  store i32 %1, i32* %a
  store i32 %2, i32* %b
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %a2 = load i32, i32* %a
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %a2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @5, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %a2
  %arr_ele = load i32, i32* %arr_ele_addr
  store i32 %arr_ele, i32* %temp_a
  %fp_addr_in_sl3 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr4 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl3
  %arr5 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr4, i32 0, i32 2
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr5
  %b7 = load i32, i32* %b
  %4 = bitcast { i32, i32* }* %arr6 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %b7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @6, i32 0, i32 0))
  %array_pointer8 = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 1
  %arr_addr9 = load i32*, i32** %array_pointer8
  %arr_ele_addr10 = getelementptr i32, i32* %arr_addr9, i32 %b7
  %arr_ele11 = load i32, i32* %arr_ele_addr10
  store i32 %arr_ele11, i32* %temp_b
  %fp_addr_in_sl12 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr13 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl12
  %arr14 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr13, i32 0, i32 2
  %a15 = load i32, i32* %a
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr14
  %5 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %5, i32 %a15, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @7, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr16 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr17 = getelementptr i32, i32* %arr_addr16, i32 %a15
  %temp_b18 = load i32, i32* %temp_b
  store i32 %temp_b18, i32* %arr_ele_addr17
  %fp_addr_in_sl19 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr20 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl19
  %arr21 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr20, i32 0, i32 2
  %b22 = load i32, i32* %b
  %load_left23 = load { i32, i32* }*, { i32, i32* }** %arr21
  %6 = bitcast { i32, i32* }* %load_left23 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %b22, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @8, i32 0, i32 0))
  %array_addr_ptr24 = getelementptr { i32, i32* }, { i32, i32* }* %load_left23, i32 0, i32 1
  %arr_addr25 = load i32*, i32** %array_addr_ptr24
  %arr_ele_addr26 = getelementptr i32, i32* %arr_addr25, i32 %b22
  %temp_a27 = load i32, i32* %temp_a
  store i32 %temp_a27, i32* %arr_ele_addr26
  ret void
}

define void @max_heapify({ { i32 }*, i32, { i32, i32* }* }*, i32, i32) gc "ocaml" {
entry:
  %if_result_addr102 = alloca i32
  %if_result_addr76 = alloca i32
  %if_result_addr63 = alloca i32
  %if_result_addr36 = alloca i32
  %if_result_addr = alloca i32
  %right_index = alloca i32
  %left_index = alloca i32
  %index_largest = alloca i32
  %largest = alloca i32
  %size = alloca i32
  %index = alloca i32
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  store i32 %1, i32* %index
  store i32 %2, i32* %size
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %index2 = load i32, i32* %index
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %index2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @9, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %index2
  %arr_ele = load i32, i32* %arr_ele_addr
  store i32 %arr_ele, i32* %largest
  %index3 = load i32, i32* %index
  store i32 %index3, i32* %index_largest
  %index4 = load i32, i32* %index
  %mul_tmp = mul i32 %index4, 2
  %add_tmp = add i32 %mul_tmp, 1
  store i32 %add_tmp, i32* %left_index
  %index5 = load i32, i32* %index
  %mul_tmp6 = mul i32 %index5, 2
  %add_tmp7 = add i32 %mul_tmp6, 2
  store i32 %add_tmp7, i32* %right_index
  br label %test

test:                                             ; preds = %entry
  br label %test8

then:                                             ; preds = %merge11
  %fp_addr_in_sl26 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr27 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl26
  %arr28 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr27, i32 0, i32 2
  %arr29 = load { i32, i32* }*, { i32, i32* }** %arr28
  %right_index30 = load i32, i32* %right_index
  %4 = bitcast { i32, i32* }* %arr29 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %right_index30, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @11, i32 0, i32 0))
  %array_pointer31 = getelementptr { i32, i32* }, { i32, i32* }* %arr29, i32 0, i32 1
  %arr_addr32 = load i32*, i32** %array_pointer31
  %arr_ele_addr33 = getelementptr i32, i32* %arr_addr32, i32 %right_index30
  %arr_ele34 = load i32, i32* %arr_ele_addr33
  store i32 %arr_ele34, i32* %largest
  %right_index35 = load i32, i32* %right_index
  store i32 %right_index35, i32* %index_largest
  store i32 0, i32* %if_result_addr36
  br label %merge

else:                                             ; preds = %merge11
  store i32 0, i32* %if_result_addr36
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result37 = load i32, i32* %if_result_addr36
  br label %test38

test8:                                            ; preds = %test
  %right_index12 = load i32, i32* %right_index
  %size13 = load i32, i32* %size
  %lt_tmp = icmp slt i32 %right_index12, %size13
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %else10, label %then9

then9:                                            ; preds = %test8
  %fp_addr_in_sl14 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr15 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl14
  %arr16 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr15, i32 0, i32 2
  %arr17 = load { i32, i32* }*, { i32, i32* }** %arr16
  %right_index18 = load i32, i32* %right_index
  %5 = bitcast { i32, i32* }* %arr17 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %right_index18, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @10, i32 0, i32 0))
  %array_pointer19 = getelementptr { i32, i32* }, { i32, i32* }* %arr17, i32 0, i32 1
  %arr_addr20 = load i32*, i32** %array_pointer19
  %arr_ele_addr21 = getelementptr i32, i32* %arr_addr20, i32 %right_index18
  %arr_ele22 = load i32, i32* %arr_ele_addr21
  %largest23 = load i32, i32* %largest
  %gt_tmp = icmp sgt i32 %arr_ele22, %largest23
  %bool_tmp24 = zext i1 %gt_tmp to i32
  store i32 %bool_tmp24, i32* %if_result_addr
  br label %merge11

else10:                                           ; preds = %test8
  store i32 0, i32* %if_result_addr
  br label %merge11

merge11:                                          ; preds = %else10, %then9
  %if_result = load i32, i32* %if_result_addr
  %cond25 = icmp eq i32 %if_result, 0
  br i1 %cond25, label %else, label %then

test38:                                           ; preds = %merge
  br label %test42

then39:                                           ; preds = %merge45
  %fp_addr_in_sl66 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr67 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl66
  %arr68 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr67, i32 0, i32 2
  %arr69 = load { i32, i32* }*, { i32, i32* }** %arr68
  %left_index70 = load i32, i32* %left_index
  %6 = bitcast { i32, i32* }* %arr69 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %left_index70, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @13, i32 0, i32 0))
  %array_pointer71 = getelementptr { i32, i32* }, { i32, i32* }* %arr69, i32 0, i32 1
  %arr_addr72 = load i32*, i32** %array_pointer71
  %arr_ele_addr73 = getelementptr i32, i32* %arr_addr72, i32 %left_index70
  %arr_ele74 = load i32, i32* %arr_ele_addr73
  store i32 %arr_ele74, i32* %largest
  %left_index75 = load i32, i32* %left_index
  store i32 %left_index75, i32* %index_largest
  store i32 0, i32* %if_result_addr76
  br label %merge41

else40:                                           ; preds = %merge45
  store i32 0, i32* %if_result_addr76
  br label %merge41

merge41:                                          ; preds = %else40, %then39
  %if_result77 = load i32, i32* %if_result_addr76
  br label %test78

test42:                                           ; preds = %test38
  %left_index46 = load i32, i32* %left_index
  %size47 = load i32, i32* %size
  %lt_tmp48 = icmp slt i32 %left_index46, %size47
  %bool_tmp49 = zext i1 %lt_tmp48 to i32
  %cond50 = icmp eq i32 %bool_tmp49, 0
  br i1 %cond50, label %else44, label %then43

then43:                                           ; preds = %test42
  %fp_addr_in_sl51 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr52 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl51
  %arr53 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr52, i32 0, i32 2
  %arr54 = load { i32, i32* }*, { i32, i32* }** %arr53
  %left_index55 = load i32, i32* %left_index
  %7 = bitcast { i32, i32* }* %arr54 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %left_index55, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @12, i32 0, i32 0))
  %array_pointer56 = getelementptr { i32, i32* }, { i32, i32* }* %arr54, i32 0, i32 1
  %arr_addr57 = load i32*, i32** %array_pointer56
  %arr_ele_addr58 = getelementptr i32, i32* %arr_addr57, i32 %left_index55
  %arr_ele59 = load i32, i32* %arr_ele_addr58
  %largest60 = load i32, i32* %largest
  %gt_tmp61 = icmp sgt i32 %arr_ele59, %largest60
  %bool_tmp62 = zext i1 %gt_tmp61 to i32
  store i32 %bool_tmp62, i32* %if_result_addr63
  br label %merge45

else44:                                           ; preds = %test42
  store i32 0, i32* %if_result_addr63
  br label %merge45

merge45:                                          ; preds = %else44, %then43
  %if_result64 = load i32, i32* %if_result_addr63
  %cond65 = icmp eq i32 %if_result64, 0
  br i1 %cond65, label %else40, label %then39

test78:                                           ; preds = %merge41
  %largest82 = load i32, i32* %largest
  %fp_addr_in_sl83 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr84 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl83
  %arr85 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr84, i32 0, i32 2
  %arr86 = load { i32, i32* }*, { i32, i32* }** %arr85
  %index87 = load i32, i32* %index
  %8 = bitcast { i32, i32* }* %arr86 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %index87, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @14, i32 0, i32 0))
  %array_pointer88 = getelementptr { i32, i32* }, { i32, i32* }* %arr86, i32 0, i32 1
  %arr_addr89 = load i32*, i32** %array_pointer88
  %arr_ele_addr90 = getelementptr i32, i32* %arr_addr89, i32 %index87
  %arr_ele91 = load i32, i32* %arr_ele_addr90
  %neq_tmp = icmp ne i32 %largest82, %arr_ele91
  %bool_tmp92 = zext i1 %neq_tmp to i32
  %cond93 = icmp eq i32 %bool_tmp92, 0
  br i1 %cond93, label %else80, label %then79

then79:                                           ; preds = %test78
  %index94 = load i32, i32* %index
  %index_largest95 = load i32, i32* %index_largest
  %fp_addr_in_sl96 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr97 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl96
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %fp_addr97, i32 %index94, i32 %index_largest95)
  %index_largest98 = load i32, i32* %index_largest
  %size99 = load i32, i32* %size
  %fp_addr_in_sl100 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr101 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl100
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %fp_addr101, i32 %index_largest98, i32 %size99)
  store i32 0, i32* %if_result_addr102
  br label %merge81

else80:                                           ; preds = %test78
  store i32 0, i32* %if_result_addr102
  br label %merge81

merge81:                                          ; preds = %else80, %then79
  %if_result103 = load i32, i32* %if_result_addr102
  ret void
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
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

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
  %cond16 = icmp eq i32 %bool_tmp15, 0
  br i1 %cond16, label %end12, label %loop11

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i17, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @15, i32 0, i32 0))
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
