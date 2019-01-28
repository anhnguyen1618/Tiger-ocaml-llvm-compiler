; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

%a = type { i32 }
%fp = type { i32 }

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
  %a = alloca %a*
  %frame_pointer = alloca %fp
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to %a*
  %Element = getelementptr %a, %a* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  store %a* %record_init, %a** %a
  %a1 = load %a*, %a** %a
  %element = getelementptr %a, %a* %a1, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

declare noalias i8* @malloc(i32)
