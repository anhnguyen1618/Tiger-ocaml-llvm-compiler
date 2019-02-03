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

declare void @tig_check_null_pointer(i8*, i8*)

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
  %if_result_addr = alloca i32
  %a3 = alloca i32
  %b = alloca i32
  %a = alloca i32
  %frame_pointer = alloca { i32 }
  store i32 5, i32* %a
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %entry
  %a1 = load i32, i32* %a
  %eq_tmp = icmp eq i32 %a1, 6
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  store i32 6, i32* %b
  %b2 = load i32, i32* %b
  store i32 %b2, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  store i32 7, i32* %a3
  store i32 -8, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  store i32 %if_result, i32* %a
  %a4 = load i32, i32* %a
  call void @tig_print_int(i32 %a4)
  %a5 = load i32, i32* %a
  call void @assert_equal_int(i32 %a5, i32 -8)
  ret i32 0
}
