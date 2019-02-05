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
  %frame_pointer = alloca { i32, { i32, i8* }* }
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i8* }* null, { i32, i8* }** %root
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define void @f({ i32, { i32, i8* }* }*) {
entry:
  %frame_pointer = alloca { { i32, { i32, i8* }* }* }
  %arg_address = getelementptr { { i32, { i32, i8* }* }* }, { { i32, { i32, i8* }* }* }* %frame_pointer, i32 0, i32 0
  store { i32, { i32, i8* }* }* %0, { i32, { i32, i8* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { i32, { i32, i8* }* }* }, { { i32, { i32, i8* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32, { i32, i8* }* }*, { i32, { i32, i8* }* }** %fp_addr_in_sl
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %fp_addr, i32 0, i32 1
  %root1 = load { i32, i8* }*, { i32, i8* }** %root
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element2 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element2
  ret void
}

declare noalias i8* @malloc(i32)
