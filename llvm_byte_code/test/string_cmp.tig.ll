; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"test string\00"
@1 = private unnamed_addr constant [12 x i8] c"test string\00"
@2 = private unnamed_addr constant [13 x i8] c"-hello world\00"
@3 = private unnamed_addr constant [24 x i8] c"test string-hello world\00"

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
  %b = alloca i8*
  %a = alloca i8*
  %frame_pointer = alloca { i32 }
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i8** %a
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0), i8** %b
  %a1 = load i8*, i8** %a
  %b2 = load i8*, i8** %b
  call void @assert_equal_string(i8* %a1, i8* %b2)
  %a3 = load i8*, i8** %a
  %0 = call i8* @tig_concat(i8* %a3, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @2, i32 0, i32 0))
  store i8* %0, i8** %a
  %a4 = load i8*, i8** %a
  call void @assert_equal_string(i8* %a4, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @3, i32 0, i32 0))
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}
