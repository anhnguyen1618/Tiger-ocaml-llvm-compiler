; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

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

declare void @assert_equal_int(i32, i32)

declare void @assert_equal_string(i8*, i8*)

define i32 @main() {
entry:
  %fib30 = alloca i32
  %fib14 = alloca i32
  %fib5 = alloca i32
  %fib1 = alloca i32
  %fib0 = alloca i32
  %frame_pointer = alloca { i32 }
  %0 = call i32 @fib({ i32 }* %frame_pointer, i32 0)
  store i32 %0, i32* %fib0
  %1 = call i32 @fib({ i32 }* %frame_pointer, i32 1)
  store i32 %1, i32* %fib1
  %2 = call i32 @fib({ i32 }* %frame_pointer, i32 5)
  store i32 %2, i32* %fib5
  %3 = call i32 @fib({ i32 }* %frame_pointer, i32 14)
  store i32 %3, i32* %fib14
  %4 = call i32 @fib({ i32 }* %frame_pointer, i32 30)
  store i32 %4, i32* %fib30
  %fib01 = load i32, i32* %fib0
  call void @assert_equal_int(i32 %fib01, i32 0)
  %fib12 = load i32, i32* %fib1
  call void @assert_equal_int(i32 %fib12, i32 1)
  %fib53 = load i32, i32* %fib5
  call void @assert_equal_int(i32 %fib53, i32 5)
  %fib144 = load i32, i32* %fib14
  call void @assert_equal_int(i32 %fib144, i32 377)
  %fib305 = load i32, i32* %fib30
  call void @assert_equal_int(i32 %fib305, i32 832040)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @fib({ i32 }*, i32) {
entry:
  %if_result_addr15 = alloca i32
  %if_result_addr = alloca i32
  %n = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %n
  br label %test

test:                                             ; preds = %entry
  %n1 = load i32, i32* %n
  %eq_tmp = icmp eq i32 %n1, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  store i32 0, i32* %if_result_addr15
  br label %merge

else:                                             ; preds = %test
  br label %test2

merge:                                            ; preds = %merge5, %then
  %if_result16 = load i32, i32* %if_result_addr15
  ret i32 %if_result16

test2:                                            ; preds = %else
  %n6 = load i32, i32* %n
  %eq_tmp7 = icmp eq i32 %n6, 1
  %bool_tmp8 = zext i1 %eq_tmp7 to i32
  %cond9 = icmp eq i32 %bool_tmp8, 1
  br i1 %cond9, label %then3, label %else4

then3:                                            ; preds = %test2
  store i32 1, i32* %if_result_addr
  br label %merge5

else4:                                            ; preds = %test2
  %n10 = load i32, i32* %n
  %minus_tmp = sub i32 %n10, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @fib({ i32 }* %fp_addr, i32 %minus_tmp)
  %n11 = load i32, i32* %n
  %minus_tmp12 = sub i32 %n11, 2
  %fp_addr_in_sl13 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { i32 }*, { i32 }** %fp_addr_in_sl13
  %3 = call i32 @fib({ i32 }* %fp_addr14, i32 %minus_tmp12)
  %add_tmp = add i32 %2, %3
  store i32 %add_tmp, i32* %if_result_addr
  br label %merge5

merge5:                                           ; preds = %else4, %then3
  %if_result = load i32, i32* %if_result_addr
  store i32 %if_result, i32* %if_result_addr15
  br label %merge
}
