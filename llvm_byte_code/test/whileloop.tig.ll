; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

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
  %if_result_addr = alloca i32
  %b = alloca i32
  %a = alloca i32
  %frame_pointer = alloca { i32 }
  store i32 0, i32* %a
  store i32 2, i32* %b
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %merge, %entry
  %a1 = load i32, i32* %a
  %lt_tmp = icmp slt i32 %a1, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %a2 = load i32, i32* %a
  call void @tig_print_int(i32 %a2)
  br label %test3

end:                                              ; preds = %then, %test
  %a10 = load i32, i32* %a
  call void @assert_equal_int(i32 %a10, i32 3)
  %b11 = load i32, i32* %b
  call void @assert_equal_int(i32 %b11, i32 5)
  ret i32 0

test3:                                            ; preds = %loop
  %a4 = load i32, i32* %a
  %eq_tmp = icmp eq i32 %a4, 3
  %bool_tmp5 = zext i1 %eq_tmp to i32
  %cond6 = icmp eq i32 %bool_tmp5, 1
  br i1 %cond6, label %then, label %else

then:                                             ; preds = %test3
  br label %end
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test3
  store i32 0, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  %b7 = load i32, i32* %b
  %add_tmp = add i32 %b7, 1
  store i32 %add_tmp, i32* %b
  %a8 = load i32, i32* %a
  %add_tmp9 = add i32 %a8, 1
  store i32 %add_tmp9, i32* %a
  br label %test
}
