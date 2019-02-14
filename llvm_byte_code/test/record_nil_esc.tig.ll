; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [54 x i8] c"test/record_nil_esc.tig::8.19: Nil pointer exception!\00"

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
  %frame_pointer = alloca { i32, { i32, i8* }* }
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i8* }* null, { i32, i8* }** %root
  %root1 = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  %root2 = load { i32, i8* }*, { i32, i8* }** %root1
  %0 = bitcast { i32, i8* }* %root2 to i8*
  %1 = call i32 @tig_nillable(i8* %0)
  call void @assert_equal_int(i32 %1, i32 1)
  call void @f({ i32, { i32, i8* }* }* %frame_pointer)
  %root3 = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  %root4 = load { i32, i8* }*, { i32, i8* }** %root3
  %2 = bitcast { i32, i8* }* %root4 to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @0, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %root4, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @assert_equal_int(i32 %field_var, i32 5)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define void @f({ i32, { i32, i8* }* }*) gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32, { i32, i8* }* }* }
  %arg_address = getelementptr { { i32, { i32, i8* }* }* }, { { i32, { i32, i8* }* }* }* %frame_pointer, i32 0, i32 0
  store { i32, { i32, i8* }* }* %0, { i32, { i32, i8* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { i32, { i32, i8* }* }* }, { { i32, { i32, i8* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32, { i32, i8* }* }*, { i32, { i32, i8* }* }** %fp_addr_in_sl
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %fp_addr, i32 0, i32 1
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  store { i32, i8* }* %record_init, { i32, i8* }** %root
  ret void
}

declare noalias i8* @malloc(i32)
