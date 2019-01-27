; ModuleID = 'test.tig.ll'
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

define i32 @main() {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @fib({ i32 }* %frame_pointer, i32 30)
  call void @tig_print_int(i32 %0)
  call void @a({ i32 }* %frame_pointer)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @fib({ i32 }*, i32) {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %eq_tmp = icmp eq i32 %1, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  br label %test2

merge:                                            ; preds = %merge5, %then
  %if_result_addr15.0 = phi i32 [ 0, %then ], [ %if_result_addr.0, %merge5 ]
  ret i32 %if_result_addr15.0

test2:                                            ; preds = %else
  %eq_tmp7 = icmp eq i32 %1, 1
  %bool_tmp8 = zext i1 %eq_tmp7 to i32
  %cond9 = icmp eq i32 %bool_tmp8, 1
  br i1 %cond9, label %then3, label %else4

then3:                                            ; preds = %test2
  br label %merge5

else4:                                            ; preds = %test2
  %minus_tmp = sub i32 %1, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @fib({ i32 }* %fp_addr, i32 %minus_tmp)
  %minus_tmp12 = sub i32 %1, 2
  %fp_addr_in_sl13 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { i32 }*, { i32 }** %fp_addr_in_sl13
  %3 = call i32 @fib({ i32 }* %fp_addr14, i32 %minus_tmp12)
  %add_tmp = add i32 %2, %3
  br label %merge5

merge5:                                           ; preds = %else4, %then3
  %if_result_addr.0 = phi i32 [ 1, %then3 ], [ %add_tmp, %else4 ]
  br label %merge
}

define void @a({ i32 }*) {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  ret void
}
