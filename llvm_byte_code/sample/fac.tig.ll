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
  %frame_pointer = alloca { i32 }
  %0 = call i32 @factorial({ i32 }* %frame_pointer, i32 4)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @factorial({ i32 }*, i32) gc "ocaml" {
entry:
  %if_result_addr = alloca i32
  %n = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %n
  br label %test

test:                                             ; preds = %entry
  %n1 = load i32, i32* %n
  %eq_tmp = icmp eq i32 %n1, 1
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  store i32 1, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  %n2 = load i32, i32* %n
  %n3 = load i32, i32* %n
  %minus_tmp = sub i32 %n3, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @factorial({ i32 }* %fp_addr, i32 %minus_tmp)
  %mul_tmp = mul i32 %n2, %2
  store i32 %mul_tmp, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  ret i32 %if_result
}
