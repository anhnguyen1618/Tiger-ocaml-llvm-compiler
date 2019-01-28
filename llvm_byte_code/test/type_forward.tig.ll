; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [17 x i8] c"type_forward.tig\00"

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

declare void @assert_equal_string(i8*, i8*, i8*)

define i32 @main() {
entry:
  %node = alloca i32
  %frame_pointer = alloca { i32 }
  store i32 6, i32* %node
  %node1 = load i32, i32* %node
  %add_tmp = add i32 %node1, 5
  call void @tig_print_int(i32 %add_tmp)
  %node2 = load i32, i32* %node
  %add_tmp3 = add i32 %node2, 5
  call void @assert_equal_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i32 %add_tmp3, i32 11)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}
