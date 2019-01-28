; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [47 x i8] c"test/staticlink.tig::10.35: Array out of bound\00"
@1 = private unnamed_addr constant [46 x i8] c"test/staticlink.tig::12.6: Array out of bound\00"
@2 = private unnamed_addr constant [15 x i8] c"staticlink.tig\00"
@3 = private unnamed_addr constant [24 x i8] c"staticlink.tig: Passed!\00"

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

declare void @assert_equal_int(i8*, i32, i32)

define i32 @main() {
entry:
  %i = alloca i32
  %x = alloca i32
  %frame_pointer = alloca { i32, i32, { i32, i32* }* }
  %var_dec = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  store i32 5, i32* %var_dec
  store i32 7, i32* %x
  %x1 = load i32, i32* %x
  %mallocsize = mul i32 %x1, ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32)
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  store i32 0, i32* %i
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %i2 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i2, %x1
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %i3 = load i32, i32* %i
  %Element = getelementptr i32, i32* %array_init, i32 %i3
  store i32 4, i32* %Element
  %add_tmp = add i32 %i3, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 %x1, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  %var_dec6 = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %var_dec6
  %0 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 0)
  call void @assert_int({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 %0, i32 18)
  %1 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 -5)
  call void @assert_int({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 %1, i32 13)
  %2 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 -18)
  call void @assert_int({ i32, i32, { i32, i32* }* }* %frame_pointer, i32 %2, i32 0)
  call void @tig_print(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0))
  ret i32 0
}

declare noalias i8* @malloc(i32)

define i32 @nested_function({ i32, i32, { i32, i32* }* }*, i32) {
entry:
  %frame_pointer = alloca { { i32, i32, { i32, i32* }* }*, i32, i32 }
  %arg_address = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i32 0, i32 0
  store { i32, i32, { i32, i32* }* }* %0, { i32, i32, { i32, i32* }* }** %arg_address
  %arg_address1 = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i32 0, i32 2
  store i32 %1, i32* %arg_address1
  %var_dec = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i32 0, i32 1
  store i32 6, i32* %var_dec
  %fp_addr_in_sl = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32, i32, { i32, i32* }* }*, { i32, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 2
  store i32 7, i32* %arr_ele_addr
  %3 = call i32 @f({ { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer)
  ret i32 %3
}

define void @assert_int({ i32, i32, { i32, i32* }* }*, i32, i32) {
entry:
  %expected = alloca i32
  %actual = alloca i32
  %frame_pointer = alloca { { i32, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { i32, i32, { i32, i32* }* }* }, { { i32, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { i32, i32, { i32, i32* }* }* %0, { i32, i32, { i32, i32* }* }** %arg_address
  store i32 %1, i32* %actual
  store i32 %2, i32* %expected
  %actual1 = load i32, i32* %actual
  %expected2 = load i32, i32* %expected
  call void @assert_equal_int(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @2, i32 0, i32 0), i32 %actual1, i32 %expected2)
  ret void
}

define i32 @f({ { i32, i32, { i32, i32* }* }*, i32, i32 }*) {
entry:
  %frame_pointer = alloca { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }
  %arg_address = getelementptr { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }, { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  store { { i32, i32, { i32, i32* }* }*, i32, i32 }* %0, { { i32, i32, { i32, i32* }* }*, i32, i32 }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }, { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32, i32, { i32, i32* }* }*, i32, i32 }*, { { i32, i32, { i32, i32* }* }*, i32, i32 }** %fp_addr_in_sl
  %fp_addr_in_sl1 = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %fp_addr, i32 0, i32 0
  %fp_addr2 = load { i32, i32, { i32, i32* }* }*, { i32, i32, { i32, i32* }* }** %fp_addr_in_sl1
  %a = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %fp_addr2, i32 0, i32 1
  %a3 = load i32, i32* %a
  %fp_addr_in_sl4 = getelementptr { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }, { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr5 = load { { i32, i32, { i32, i32* }* }*, i32, i32 }*, { { i32, i32, { i32, i32* }* }*, i32, i32 }** %fp_addr_in_sl4
  %b = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %fp_addr5, i32 0, i32 1
  %b6 = load i32, i32* %b
  %add_tmp = add i32 %a3, %b6
  %fp_addr_in_sl7 = getelementptr { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }, { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr8 = load { { i32, i32, { i32, i32* }* }*, i32, i32 }*, { { i32, i32, { i32, i32* }* }*, i32, i32 }** %fp_addr_in_sl7
  %fp_addr_in_sl9 = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %fp_addr8, i32 0, i32 0
  %fp_addr10 = load { i32, i32, { i32, i32* }* }*, { i32, i32, { i32, i32* }* }** %fp_addr_in_sl9
  %arr = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %fp_addr10, i32 0, i32 2
  %arr11 = load { i32, i32* }*, { i32, i32* }** %arr
  %1 = bitcast { i32, i32* }* %arr11 to i8*
  call void @tig_check_array_bound(i8* %1, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @0, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr11, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 2
  %arr_ele = load i32, i32* %arr_ele_addr
  %add_tmp12 = add i32 %add_tmp, %arr_ele
  %fp_addr_in_sl13 = getelementptr { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }, { { { i32, i32, { i32, i32* }* }*, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { { i32, i32, { i32, i32* }* }*, i32, i32 }*, { { i32, i32, { i32, i32* }* }*, i32, i32 }** %fp_addr_in_sl13
  %d = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %fp_addr14, i32 0, i32 2
  %d15 = load i32, i32* %d
  %add_tmp16 = add i32 %add_tmp12, %d15
  ret i32 %add_tmp16
}
