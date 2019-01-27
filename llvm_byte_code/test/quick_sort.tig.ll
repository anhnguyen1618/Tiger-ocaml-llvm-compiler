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

test:                                             ; preds = %continue, %entry
  %_limit4 = load i32, i32* %_limit
  %i5 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit4, %i5
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr
  %i7 = load i32, i32* %i
  %array_size_ptr = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 0
  %arr_size = load i32, i32* %array_size_ptr
  %cond8 = icmp sge i32 %i7, %arr_size
  br i1 %cond8, label %error, label %continue

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret void

error:                                            ; preds = %loop
  call void @tig_print(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue

continue:                                         ; preds = %error, %loop
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @print_arr_int_ele(i32 %arr_ele)
  %i9 = load i32, i32* %i
  %add_tmp = add i32 %i9, 1
  store i32 %add_tmp, i32* %i
  br label %test
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

test10:                                           ; preds = %continue, %end
  %_limit13 = load i32, i32* %_limit
  %i14 = load i32, i32* %i7
  %ge_tmp = icmp sge i32 %_limit13, %i14
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %i17 = load i32, i32* %i7
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %array_size_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 0
  %arr_size = load i32, i32* %array_size_ptr
  %cond18 = icmp sge i32 %i17, %arr_size
  br i1 %cond18, label %error, label %continue

end12:                                            ; preds = %test10
  %arr21 = load { i32, i32* }*, { i32, i32* }** %arr
  ret { i32, i32* }* %arr21

error:                                            ; preds = %loop11
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue

continue:                                         ; preds = %error, %loop11
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i17
  %1 = call i32 @tig_random(i32 50)
  store i32 %1, i32* %arr_ele_addr
  %i19 = load i32, i32* %i7
  %add_tmp20 = add i32 %i19, 1
  store i32 %add_tmp20, i32* %i7
  br label %test10
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
  %array_size_ptr = getelementptr { i32, i32* }, { i32, i32* }* %arr2, i32 0, i32 0
  %arr_size = load i32, i32* %array_size_ptr
  %cond = icmp sge i32 %last3, %arr_size
  br i1 %cond, label %error, label %continue

error:                                            ; preds = %entry
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue

continue:                                         ; preds = %error, %entry
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
  %array_size_ptr9 = getelementptr { i32, i32* }, { i32, i32* }* %arr7, i32 0, i32 0
  %arr_size10 = load i32, i32* %array_size_ptr9
  %cond13 = icmp sge i32 %wall_index8, %arr_size10
  br i1 %cond13, label %error11, label %continue12

error11:                                          ; preds = %continue
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue12

continue12:                                       ; preds = %error11, %continue
  %array_pointer14 = getelementptr { i32, i32* }, { i32, i32* }* %arr7, i32 0, i32 1
  %arr_addr15 = load i32*, i32** %array_pointer14
  %arr_ele_addr16 = getelementptr i32, i32* %arr_addr15, i32 %wall_index8
  %arr_ele17 = load i32, i32* %arr_ele_addr16
  store i32 %arr_ele17, i32* %final_wall_value
  %first18 = load i32, i32* %first
  %last19 = load i32, i32* %last
  %minus_tmp = sub i32 %last19, 1
  %first20 = load i32, i32* %first
  store i32 %first20, i32* %i
  %last21 = load i32, i32* %last
  %minus_tmp22 = sub i32 %last21, 1
  store i32 %minus_tmp22, i32* %_limit
  br label %test

test:                                             ; preds = %merge, %continue12
  %_limit23 = load i32, i32* %_limit
  %i24 = load i32, i32* %i
  %ge_tmp = icmp sge i32 %_limit23, %i24
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond25 = icmp eq i32 %bool_tmp, 1
  br i1 %cond25, label %loop, label %end

loop:                                             ; preds = %test
  %fp_addr_in_sl26 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr27 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl26
  %arr28 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr27, i32 0, i32 1
  %arr29 = load { i32, i32* }*, { i32, i32* }** %arr28
  %i30 = load i32, i32* %i
  %array_size_ptr31 = getelementptr { i32, i32* }, { i32, i32* }* %arr29, i32 0, i32 0
  %arr_size32 = load i32, i32* %array_size_ptr31
  %cond35 = icmp sge i32 %i30, %arr_size32
  br i1 %cond35, label %error33, label %continue34

end:                                              ; preds = %test
  %fp_addr_in_sl88 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr89 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl88
  %arr90 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr89, i32 0, i32 1
  %arr91 = load { i32, i32* }*, { i32, i32* }** %arr90
  %wall_index92 = load i32, i32* %wall_index
  %array_size_ptr93 = getelementptr { i32, i32* }, { i32, i32* }* %arr91, i32 0, i32 0
  %arr_size94 = load i32, i32* %array_size_ptr93
  %cond97 = icmp sge i32 %wall_index92, %arr_size94
  br i1 %cond97, label %error95, label %continue96

error33:                                          ; preds = %loop
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue34

continue34:                                       ; preds = %error33, %loop
  %array_pointer36 = getelementptr { i32, i32* }, { i32, i32* }* %arr29, i32 0, i32 1
  %arr_addr37 = load i32*, i32** %array_pointer36
  %arr_ele_addr38 = getelementptr i32, i32* %arr_addr37, i32 %i30
  %arr_ele39 = load i32, i32* %arr_ele_addr38
  store i32 %arr_ele39, i32* %current
  %fp_addr_in_sl40 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr41 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl40
  %arr42 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr41, i32 0, i32 1
  %arr43 = load { i32, i32* }*, { i32, i32* }** %arr42
  %wall_index44 = load i32, i32* %wall_index
  %array_size_ptr45 = getelementptr { i32, i32* }, { i32, i32* }* %arr43, i32 0, i32 0
  %arr_size46 = load i32, i32* %array_size_ptr45
  %cond49 = icmp sge i32 %wall_index44, %arr_size46
  br i1 %cond49, label %error47, label %continue48

error47:                                          ; preds = %continue34
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue48

continue48:                                       ; preds = %error47, %continue34
  %array_pointer50 = getelementptr { i32, i32* }, { i32, i32* }* %arr43, i32 0, i32 1
  %arr_addr51 = load i32*, i32** %array_pointer50
  %arr_ele_addr52 = getelementptr i32, i32* %arr_addr51, i32 %wall_index44
  %arr_ele53 = load i32, i32* %arr_ele_addr52
  store i32 %arr_ele53, i32* %wall_item
  br label %test54

test54:                                           ; preds = %continue48
  %current55 = load i32, i32* %current
  %pivot56 = load i32, i32* %pivot
  %lt_tmp = icmp slt i32 %current55, %pivot56
  %bool_tmp57 = zext i1 %lt_tmp to i32
  %cond58 = icmp eq i32 %bool_tmp57, 1
  br i1 %cond58, label %then, label %else

then:                                             ; preds = %test54
  %fp_addr_in_sl59 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr60 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl59
  %arr61 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr60, i32 0, i32 1
  %wall_index62 = load i32, i32* %wall_index
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr61
  %array_size_ptr63 = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 0
  %arr_size64 = load i32, i32* %array_size_ptr63
  %cond67 = icmp sge i32 %wall_index62, %arr_size64
  br i1 %cond67, label %error65, label %continue66

else:                                             ; preds = %test54
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %continue79
  %if_result = load i32, i32* %if_result_addr
  %i86 = load i32, i32* %i
  %add_tmp87 = add i32 %i86, 1
  store i32 %add_tmp87, i32* %i
  br label %test

error65:                                          ; preds = %then
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue66

continue66:                                       ; preds = %error65, %then
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr68 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr69 = getelementptr i32, i32* %arr_addr68, i32 %wall_index62
  %current70 = load i32, i32* %current
  store i32 %current70, i32* %arr_ele_addr69
  %fp_addr_in_sl71 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr72 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl71
  %arr73 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr72, i32 0, i32 1
  %i74 = load i32, i32* %i
  %load_left75 = load { i32, i32* }*, { i32, i32* }** %arr73
  %array_size_ptr76 = getelementptr { i32, i32* }, { i32, i32* }* %load_left75, i32 0, i32 0
  %arr_size77 = load i32, i32* %array_size_ptr76
  %cond80 = icmp sge i32 %i74, %arr_size77
  br i1 %cond80, label %error78, label %continue79

error78:                                          ; preds = %continue66
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue79

continue79:                                       ; preds = %error78, %continue66
  %array_addr_ptr81 = getelementptr { i32, i32* }, { i32, i32* }* %load_left75, i32 0, i32 1
  %arr_addr82 = load i32*, i32** %array_addr_ptr81
  %arr_ele_addr83 = getelementptr i32, i32* %arr_addr82, i32 %i74
  %wall_item84 = load i32, i32* %wall_item
  store i32 %wall_item84, i32* %arr_ele_addr83
  %wall_index85 = load i32, i32* %wall_index
  %add_tmp = add i32 %wall_index85, 1
  store i32 %add_tmp, i32* %wall_index
  store i32 0, i32* %if_result_addr
  br label %merge

error95:                                          ; preds = %end
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue96

continue96:                                       ; preds = %error95, %end
  %array_pointer98 = getelementptr { i32, i32* }, { i32, i32* }* %arr91, i32 0, i32 1
  %arr_addr99 = load i32*, i32** %array_pointer98
  %arr_ele_addr100 = getelementptr i32, i32* %arr_addr99, i32 %wall_index92
  %arr_ele101 = load i32, i32* %arr_ele_addr100
  store i32 %arr_ele101, i32* %final_wall_value
  %fp_addr_in_sl102 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr103 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl102
  %arr104 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr103, i32 0, i32 1
  %wall_index105 = load i32, i32* %wall_index
  %load_left106 = load { i32, i32* }*, { i32, i32* }** %arr104
  %array_size_ptr107 = getelementptr { i32, i32* }, { i32, i32* }* %load_left106, i32 0, i32 0
  %arr_size108 = load i32, i32* %array_size_ptr107
  %cond111 = icmp sge i32 %wall_index105, %arr_size108
  br i1 %cond111, label %error109, label %continue110

error109:                                         ; preds = %continue96
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue110

continue110:                                      ; preds = %error109, %continue96
  %array_addr_ptr112 = getelementptr { i32, i32* }, { i32, i32* }* %load_left106, i32 0, i32 1
  %arr_addr113 = load i32*, i32** %array_addr_ptr112
  %arr_ele_addr114 = getelementptr i32, i32* %arr_addr113, i32 %wall_index105
  %pivot115 = load i32, i32* %pivot
  store i32 %pivot115, i32* %arr_ele_addr114
  %fp_addr_in_sl116 = getelementptr { { { i32 }*, { i32, i32* }* }* }, { { { i32 }*, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr117 = load { { i32 }*, { i32, i32* }* }*, { { i32 }*, { i32, i32* }* }** %fp_addr_in_sl116
  %arr118 = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %fp_addr117, i32 0, i32 1
  %last119 = load i32, i32* %last
  %load_left120 = load { i32, i32* }*, { i32, i32* }** %arr118
  %array_size_ptr121 = getelementptr { i32, i32* }, { i32, i32* }* %load_left120, i32 0, i32 0
  %arr_size122 = load i32, i32* %array_size_ptr121
  %cond125 = icmp sge i32 %last119, %arr_size122
  br i1 %cond125, label %error123, label %continue124

error123:                                         ; preds = %continue110
  call void @tig_print(i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  call void @tig_exit(i32 1)
  br label %continue124

continue124:                                      ; preds = %error123, %continue110
  %array_addr_ptr126 = getelementptr { i32, i32* }, { i32, i32* }* %load_left120, i32 0, i32 1
  %arr_addr127 = load i32*, i32** %array_addr_ptr126
  %arr_ele_addr128 = getelementptr i32, i32* %arr_addr127, i32 %last119
  %final_wall_value129 = load i32, i32* %final_wall_value
  store i32 %final_wall_value129, i32* %arr_ele_addr128
  %wall_index130 = load i32, i32* %wall_index
  ret i32 %wall_index130
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
