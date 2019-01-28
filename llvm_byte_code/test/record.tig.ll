; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [6 x i8] c"hello\00"
@1 = private unnamed_addr constant [6 x i8] c"world\00"
@2 = private unnamed_addr constant [16 x i8] c"static_func.tig\00"
@3 = private unnamed_addr constant [16 x i8] c"static_func.tig\00"
@4 = private unnamed_addr constant [6 x i8] c"world\00"
@5 = private unnamed_addr constant [6 x i8] c"hello\00"
@6 = private unnamed_addr constant [4 x i8] c"lol\00"
@7 = private unnamed_addr constant [4 x i8] c"lol\00"

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
  %student = alloca { i8*, { i8*, i32 }* }*
  %class = alloca { i8*, i32 }*
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i8*, i32 }* getelementptr ({ i8*, i32 }, { i8*, i32 }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i8*, i32 }*
  %Element = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @0, i32 0, i32 0), i8** %Element
  %Element1 = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 1
  store i32 10, i32* %Element1
  store { i8*, i32 }* %record_init, { i8*, i32 }** %class
  %class2 = load { i8*, i32 }*, { i8*, i32 }** %class
  %malloccall3 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %record_init4 = bitcast i8* %malloccall3 to { i8*, { i8*, i32 }* }*
  %Element5 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0), i8** %Element5
  %Element6 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  store { i8*, i32 }* %class2, { i8*, i32 }** %Element6
  store { i8*, { i8*, i32 }* }* %record_init4, { i8*, { i8*, i32 }* }** %student
  %student7 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student7, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %student8 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element9 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student8, i32 0, i32 0
  %field_var10 = load i8*, i8** %element9
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0))
  %student11 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element12 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student11, i32 0, i32 1
  %field_var13 = load { i8*, i32 }*, { i8*, i32 }** %element12
  %element14 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var13, i32 0, i32 1
  %field_var15 = load i32, i32* %element14
  call void @tig_print_int(i32 %field_var15)
  %student16 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element17 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student16, i32 0, i32 1
  %field_var18 = load { i8*, i32 }*, { i8*, i32 }** %element17
  %element19 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var18, i32 0, i32 1
  %field_var20 = load i32, i32* %element19
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var20, i32 10)
  %load_left = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element_left = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %load_left, i32 0, i32 1
  %load_left21 = load { i8*, i32 }*, { i8*, i32 }** %element_left
  %element_left22 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left21, i32 0, i32 1
  store i32 100, i32* %element_left22
  %class23 = load { i8*, i32 }*, { i8*, i32 }** %class
  %element24 = getelementptr { i8*, i32 }, { i8*, i32 }* %class23, i32 0, i32 1
  %field_var25 = load i32, i32* %element24
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var25, i32 10)
  %student26 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element27 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student26, i32 0, i32 1
  %field_var28 = load { i8*, i32 }*, { i8*, i32 }** %element27
  %element29 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var28, i32 0, i32 0
  %field_var30 = load i8*, i8** %element29
  call void @tig_print(i8* %field_var30)
  %student31 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element32 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student31, i32 0, i32 1
  %field_var33 = load { i8*, i32 }*, { i8*, i32 }** %element32
  %element34 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var33, i32 0, i32 0
  %field_var35 = load i8*, i8** %element34
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @5, i32 0, i32 0))
  %load_left36 = load { i8*, i32 }*, { i8*, i32 }** %class
  %element_left37 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left36, i32 0, i32 0
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @6, i32 0, i32 0), i8** %element_left37
  %student38 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element39 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student38, i32 0, i32 1
  %field_var40 = load { i8*, i32 }*, { i8*, i32 }** %element39
  %element41 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var40, i32 0, i32 0
  %field_var42 = load i8*, i8** %element41
  call void @tig_print(i8* %field_var42)
  %student43 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %element44 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student43, i32 0, i32 1
  %field_var45 = load { i8*, i32 }*, { i8*, i32 }** %element44
  %element46 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var45, i32 0, i32 0
  %field_var47 = load i8*, i8** %element46
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @7, i32 0, i32 0))
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

declare noalias i8* @malloc(i32)

define void @assert_string({ i32 }*, i8*, i8*) {
entry:
  %expected = alloca i8*
  %actual = alloca i8*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i8* %1, i8** %actual
  store i8* %2, i8** %expected
  %actual1 = load i8*, i8** %actual
  %expected2 = load i8*, i8** %expected
  call void @assert_equal_string(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @2, i32 0, i32 0), i8* %actual1, i8* %expected2)
  ret void
}

define void @assert_int({ i32 }*, i32, i32) {
entry:
  %expected = alloca i32
  %actual = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %actual
  store i32 %2, i32* %expected
  %actual1 = load i32, i32* %actual
  %expected2 = load i32, i32* %expected
  call void @assert_equal_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @3, i32 0, i32 0), i32 %actual1, i32 %expected2)
  ret void
}
