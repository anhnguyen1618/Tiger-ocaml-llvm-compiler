; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"hello world\00"
@1 = private unnamed_addr constant [42 x i8] c"test/nil.tig::6.8: Nil pointer exception!\00"
@2 = private unnamed_addr constant [43 x i8] c"test/nil.tig::7.16: Nil pointer exception!\00"
@3 = private unnamed_addr constant [12 x i8] c"hello world\00"

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
  %b = alloca { i8* }*
  %a = alloca { i8* }*
  %frame_pointer = alloca { i32 }
  store { i8* }* null, { i8* }** %a
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i8* }*
  %Element = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i8** %Element
  store { i8* }* %record_init, { i8* }** %b
  %b1 = load { i8* }*, { i8* }** %b
  %0 = bitcast { i8* }* %b1 to i8*
  call void @tig_check_null_pointer(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i32 0, i32 0))
  %element = getelementptr { i8* }, { i8* }* %b1, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %b2 = load { i8* }*, { i8* }** %b
  %1 = bitcast { i8* }* %b2 to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @2, i32 0, i32 0))
  %element3 = getelementptr { i8* }, { i8* }* %b2, i32 0, i32 0
  %field_var4 = load i8*, i8** %element3
  call void @assert_equal_string(i8* %field_var4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @3, i32 0, i32 0))
  %b5 = load { i8* }*, { i8* }** %b
  %2 = bitcast { i8* }* %b5 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @tig_print_int(i32 %3)
  %b6 = load { i8* }*, { i8* }** %b
  %4 = bitcast { i8* }* %b6 to i8*
  %5 = call i32 @tig_nillable(i8* %4)
  call void @assert_equal_int(i32 %5, i32 0)
  store { i8* }* null, { i8* }** %b
  %b7 = load { i8* }*, { i8* }** %b
  %6 = bitcast { i8* }* %b7 to i8*
  %7 = call i32 @tig_nillable(i8* %6)
  call void @tig_print_int(i32 %7)
  %b8 = load { i8* }*, { i8* }** %b
  %8 = bitcast { i8* }* %b8 to i8*
  %9 = call i32 @tig_nillable(i8* %8)
  call void @assert_equal_int(i32 %9, i32 1)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

declare noalias i8* @malloc(i32)
