; ModuleID = 'Tiger jit'
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
@14 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@15 = private unnamed_addr constant [15 x i8] c"==============\00"
@16 = private unnamed_addr constant [14 x i8] c"After sorting\00"

declare void @tig_print_int(i32)

declare void @tig_print(i8*)

declare void @print_arr_int_ele(i32)

declare i32* @tig_init_array(i32, i32)

declare i32* @tig_init_record(i32)

declare i32 @tig_array_length(i8*)

declare i32 @tig_nillable(i8*)

declare void @tig_check_array_bound(i8*, i32, i8*)

declare i32 @tig_random(i32)

declare void @tig_exit(i32)

declare void @tig_flush()

declare i8* @tig_getchar()

declare i32 @tig_ord(i8*)

declare i8* @tig_chr(i32)

declare i32 @tig_string_cmp(i8*, i8*)

declare i32 @tig_size(i8*)

declare i8* @tig_substring(i8*, i32, i32)

declare i8* @tig_concat(i8*, i8*)

declare i32 @tig_not(i32)

define i32 @main() {
entry:
  %arr = alloca { i32, i32* }*
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  store { i32, i32* }* %0, { i32, i32* }** %arr
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @14, i32 0, i32 0))
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr1)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @15, i32 0, i32 0))
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @quick_sort({ i32 }* %frame_pointer, { i32, i32* }* %arr2)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @16, i32 0, i32 0))
  %arr3 = load { i32, i32* }*, { i32, i32* }** %arr
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %arr3)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define void @print_array({ i32 }*, { i32, i32* }*) {
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

define { i32, i32* }* @create_array({ i32 }*) {
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

define void @quick_sort({ i32 }*, { i32, i32* }*) {
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

declare noalias i8* @malloc(i32)

define i32 @partition({ { i32 }*, { i32, i32* }* }*, i32, i32) {
entry:
  %if_result_addr = alloca i32
  %wall_item = alloca i32
  %current = alloca i32
  %_limit = alloca i32
  %i = alloca i32
  %final_wall_value = alloca i32
  %pivot = alloca i32
  %wall_index = alloca i32
  %last = alloca i32
  %first = alloca i32
  %frame_pointer = alloca { { { i32 }*, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, { i32, i32* }* }* %0, { { i32 }*, { i32, i32* }* }** %arg_address
  store i32 %1, i32* %first
  store i32 %2, i32* %last
  %first1 = load i32, i32* %first
  store i32 %first1, i32* %wall_index
  %fp_addr_in_sl = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr, i32 0, i32 1
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %last3 = load i32, i32* %last
  %3 = bitcast { i32, i32* }* %arr2 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %last3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr2, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %last3
  %arr_ele = load i32, i32* %arr_ele_addr
  store i32 %arr_ele, i32* %pivot
  %fp_addr_in_sl4 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr5 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl4
  %arr6 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr5, i32 0, i32 1
  %arr7 = load { i32, i32* }*, { i32, i32* }** %arr6
  %wall_index8 = load i32, i32* %wall_index
  %4 = bitcast { i32, i32* }* %arr7 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %wall_index8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %array_pointer9 = getelementptr { i32, i32* }, { i32, i32* }* %arr7, i32 0, i32 1
  %arr_addr10 = load i32*, i32** %array_pointer9
  %arr_ele_addr11 = getelementptr i32, i32* %arr_addr10, i32 %wall_index8
  %arr_ele12 = load i32, i32* %arr_ele_addr11
  store i32 %arr_ele12, i32* %final_wall_value
  %first13 = load i32, i32* %first
  %last14 = load i32, i32* %last
  %minus_tmp = sub i32 %last14, 1
  %first15 = load i32, i32* %first
  store i32 %first15, i32* %i
  %last16 = load i32, i32* %last
  %minus_tmp17 = sub i32 %last16, 1
  store i32 %minus_tmp17, i32* %_limit
  br label %test

test:                                             ; preds = %merge, %entry
  %_limit18 = load i32, i32* %_limit
  %i19 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit18, %i19
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %fp_addr_in_sl20 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr21 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl20
  %arr22 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr21, i32 0, i32 1
  %arr23 = load { i32, i32* }*, { i32, i32* }** %arr22
  %i24 = load i32, i32* %i
  %5 = bitcast { i32, i32* }* %arr23 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %i24, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  %array_pointer25 = getelementptr { i32, i32* }, { i32, i32* }* %arr23, i32 0, i32 1
  %arr_addr26 = load i32*, i32** %array_pointer25
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i32 %i24
  %arr_ele28 = load i32, i32* %arr_ele_addr27
  store i32 %arr_ele28, i32* %current
  %fp_addr_in_sl29 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr30 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl29
  %arr31 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr30, i32 0, i32 1
  %arr32 = load { i32, i32* }*, { i32, i32* }** %arr31
  %wall_index33 = load i32, i32* %wall_index
  %6 = bitcast { i32, i32* }* %arr32 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %wall_index33, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %array_pointer34 = getelementptr { i32, i32* }, { i32, i32* }* %arr32, i32 0, i32 1
  %arr_addr35 = load i32*, i32** %array_pointer34
  %arr_ele_addr36 = getelementptr i32, i32* %arr_addr35, i32 %wall_index33
  %arr_ele37 = load i32, i32* %arr_ele_addr36
  store i32 %arr_ele37, i32* %wall_item
  br label %test38

end:                                              ; preds = %test
  %fp_addr_in_sl62 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr63 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl62
  %arr64 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr63, i32 0, i32 1
  %arr65 = load { i32, i32* }*, { i32, i32* }** %arr64
  %wall_index66 = load i32, i32* %wall_index
  %7 = bitcast { i32, i32* }* %arr65 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %wall_index66, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  %array_pointer67 = getelementptr { i32, i32* }, { i32, i32* }* %arr65, i32 0, i32 1
  %arr_addr68 = load i32*, i32** %array_pointer67
  %arr_ele_addr69 = getelementptr i32, i32* %arr_addr68, i32 %wall_index66
  %arr_ele70 = load i32, i32* %arr_ele_addr69
  store i32 %arr_ele70, i32* %final_wall_value
  %fp_addr_in_sl71 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr72 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl71
  %arr73 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr72, i32 0, i32 1
  %wall_index74 = load i32, i32* %wall_index
  %load_left75 = load { i32, i32* }*, { i32, i32* }** %arr73
  %8 = bitcast { i32, i32* }* %load_left75 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %wall_index74, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %array_addr_ptr76 = getelementptr { i32, i32* }, { i32, i32* }* %load_left75, i32 0, i32 1
  %arr_addr77 = load i32*, i32** %array_addr_ptr76
  %arr_ele_addr78 = getelementptr i32, i32* %arr_addr77, i32 %wall_index74
  %pivot79 = load i32, i32* %pivot
  store i32 %pivot79, i32* %arr_ele_addr78
  %fp_addr_in_sl80 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr81 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl80
  %arr82 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr81, i32 0, i32 1
  %last83 = load i32, i32* %last
  %load_left84 = load { i32, i32* }*, { i32, i32* }** %arr82
  %9 = bitcast { i32, i32* }* %load_left84 to i8*
  call void @tig_check_array_bound(i8* %9, i32 %last83, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  %array_addr_ptr85 = getelementptr { i32, i32* }, { i32, i32* }* %load_left84, i32 0, i32 1
  %arr_addr86 = load i32*, i32** %array_addr_ptr85
  %arr_ele_addr87 = getelementptr i32, i32* %arr_addr86, i32 %last83
  %final_wall_value88 = load i32, i32* %final_wall_value
  store i32 %final_wall_value88, i32* %arr_ele_addr87
  %wall_index89 = load i32, i32* %wall_index
  ret i32 %wall_index89

test38:                                           ; preds = %loop
  %current39 = load i32, i32* %current
  %pivot40 = load i32, i32* %pivot
  %lt_tmp = icmp slt i32 %current39, %pivot40
  %bool_tmp41 = zext i1 %lt_tmp to i32
  %cond42 = icmp eq i32 %bool_tmp41, 1
  br i1 %cond42, label %then, label %else

then:                                             ; preds = %test38
  %fp_addr_in_sl43 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr44 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl43
  %arr45 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr44, i32 0, i32 1
  %wall_index46 = load i32, i32* %wall_index
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr45
  %10 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %10, i32 %wall_index46, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr47 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr48 = getelementptr i32, i32* %arr_addr47, i32 %wall_index46
  %current49 = load i32, i32* %current
  store i32 %current49, i32* %arr_ele_addr48
  %fp_addr_in_sl50 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr51 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl50
  %arr52 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr51, i32 0, i32 1
  %i53 = load i32, i32* %i
  %load_left54 = load { i32, i32* }*, { i32, i32* }** %arr52
  %11 = bitcast { i32, i32* }* %load_left54 to i8*
  call void @tig_check_array_bound(i8* %11, i32 %i53, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  %array_addr_ptr55 = getelementptr { i32, i32* }, { i32, i32* }* %load_left54, i32 0, i32 1
  %arr_addr56 = load i32*, i32** %array_addr_ptr55
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i32 %i53
  %wall_item58 = load i32, i32* %wall_item
  store i32 %wall_item58, i32* %arr_ele_addr57
  %wall_index59 = load i32, i32* %wall_index
  %add_tmp = add i32 %wall_index59, 1
  store i32 %add_tmp, i32* %wall_index
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test38
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  %i60 = load i32, i32* %i
  %add_tmp61 = add i32 %i60, 1
  store i32 %add_tmp61, i32* %i
  br label %test
}

define void @sort({ { i32 }*, { i32, i32* }* }*, i32, i32) {
entry:
  %if_result_addr = alloca i32
  %pivot_index = alloca i32
  %last = alloca i32
  %first = alloca i32
  %frame_pointer = alloca { { { i32 }*, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, { i32, i32* }* }* %0, { { i32 }*, { i32, i32* }* }** %arg_address
  store i32 %1, i32* %first
  store i32 %2, i32* %last
  br label %test

test:                                             ; preds = %entry
  %first1 = load i32, i32* %first
  %last2 = load i32, i32* %last
  %lt_tmp = icmp slt i32 %first1, %last2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  %first3 = load i32, i32* %first
  %last4 = load i32, i32* %last
  %fp_addr_in_sl = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl
  %3 = call i32 @partition({ { i32 }*, { i32, i32* }* }* %fp_addr, i32 %first3, i32 %last4)
  store i32 %3, i32* %pivot_index
  %first5 = load i32, i32* %first
  %pivot_index6 = load i32, i32* %pivot_index
  %minus_tmp = sub i32 %pivot_index6, 1
  %fp_addr_in_sl7 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr8 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl7
  call void @sort({ { i32 }*, { i32, i32* }* }* %fp_addr8, i32 %first5, i32 %minus_tmp)
  %pivot_index9 = load i32, i32* %pivot_index
  %add_tmp = add i32 %pivot_index9, 1
  %last10 = load i32, i32* %last
  %fp_addr_in_sl11 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr12 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl11
  call void @sort({ { i32 }*, { i32, i32* }* }* %fp_addr12, i32 %add_tmp, i32 %last10)
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  ret void
}
