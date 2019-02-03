; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [6 x i8] c"hello\00"
@1 = private unnamed_addr constant [6 x i8] c"world\00"
@2 = private unnamed_addr constant [47 x i8] c"test/record.tig::18.14: Nil pointer exception!\00"
@3 = private unnamed_addr constant [47 x i8] c"test/record.tig::19.22: Nil pointer exception!\00"
@4 = private unnamed_addr constant [6 x i8] c"world\00"
@5 = private unnamed_addr constant [47 x i8] c"test/record.tig::21.17: Nil pointer exception!\00"
@6 = private unnamed_addr constant [47 x i8] c"test/record.tig::21.23: Nil pointer exception!\00"
@7 = private unnamed_addr constant [47 x i8] c"test/record.tig::22.19: Nil pointer exception!\00"
@8 = private unnamed_addr constant [47 x i8] c"test/record.tig::22.25: Nil pointer exception!\00"
@9 = private unnamed_addr constant [46 x i8] c"test/record.tig::24.8: Nil pointer exception!\00"
@10 = private unnamed_addr constant [47 x i8] c"test/record.tig::24.14: Nil pointer exception!\00"
@11 = private unnamed_addr constant [47 x i8] c"test/record.tig::25.17: Nil pointer exception!\00"
@12 = private unnamed_addr constant [47 x i8] c"test/record.tig::27.14: Nil pointer exception!\00"
@13 = private unnamed_addr constant [47 x i8] c"test/record.tig::27.20: Nil pointer exception!\00"
@14 = private unnamed_addr constant [47 x i8] c"test/record.tig::28.22: Nil pointer exception!\00"
@15 = private unnamed_addr constant [47 x i8] c"test/record.tig::28.28: Nil pointer exception!\00"
@16 = private unnamed_addr constant [6 x i8] c"hello\00"
@17 = private unnamed_addr constant [46 x i8] c"test/record.tig::30.6: Nil pointer exception!\00"
@18 = private unnamed_addr constant [4 x i8] c"lol\00"
@19 = private unnamed_addr constant [47 x i8] c"test/record.tig::31.14: Nil pointer exception!\00"
@20 = private unnamed_addr constant [47 x i8] c"test/record.tig::31.20: Nil pointer exception!\00"
@21 = private unnamed_addr constant [47 x i8] c"test/record.tig::32.22: Nil pointer exception!\00"
@22 = private unnamed_addr constant [47 x i8] c"test/record.tig::32.28: Nil pointer exception!\00"
@23 = private unnamed_addr constant [4 x i8] c"lol\00"

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
  %0 = bitcast { i8*, { i8*, i32 }* }* %student7 to i8*
  call void @tig_check_null_pointer(i8* %0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @2, i32 0, i32 0))
  %element = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student7, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %student8 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %1 = bitcast { i8*, { i8*, i32 }* }* %student8 to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @3, i32 0, i32 0))
  %element9 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student8, i32 0, i32 0
  %field_var10 = load i8*, i8** %element9
  call void @assert_equal_string(i8* %field_var10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @4, i32 0, i32 0))
  %student11 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %2 = bitcast { i8*, { i8*, i32 }* }* %student11 to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i32 0, i32 0))
  %element12 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student11, i32 0, i32 1
  %field_var13 = load { i8*, i32 }*, { i8*, i32 }** %element12
  %3 = bitcast { i8*, i32 }* %field_var13 to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i32 0, i32 0))
  %element14 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var13, i32 0, i32 1
  %field_var15 = load i32, i32* %element14
  call void @tig_print_int(i32 %field_var15)
  %student16 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %4 = bitcast { i8*, { i8*, i32 }* }* %student16 to i8*
  call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i32 0, i32 0))
  %element17 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student16, i32 0, i32 1
  %field_var18 = load { i8*, i32 }*, { i8*, i32 }** %element17
  %5 = bitcast { i8*, i32 }* %field_var18 to i8*
  call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i32 0, i32 0))
  %element19 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var18, i32 0, i32 1
  %field_var20 = load i32, i32* %element19
  call void @assert_equal_int(i32 %field_var20, i32 10)
  %load_left = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %6 = bitcast { i8*, { i8*, i32 }* }* %load_left to i8*
  call void @tig_check_null_pointer(i8* %6, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @9, i32 0, i32 0))
  %element_left = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %load_left, i32 0, i32 1
  %load_left21 = load { i8*, i32 }*, { i8*, i32 }** %element_left
  %7 = bitcast { i8*, i32 }* %load_left21 to i8*
  call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i32 0, i32 0))
  %element_left22 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left21, i32 0, i32 1
  store i32 100, i32* %element_left22
  %class23 = load { i8*, i32 }*, { i8*, i32 }** %class
  %8 = bitcast { i8*, i32 }* %class23 to i8*
  call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i32 0, i32 0))
  %element24 = getelementptr { i8*, i32 }, { i8*, i32 }* %class23, i32 0, i32 1
  %field_var25 = load i32, i32* %element24
  call void @assert_equal_int(i32 %field_var25, i32 100)
  %student26 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %9 = bitcast { i8*, { i8*, i32 }* }* %student26 to i8*
  call void @tig_check_null_pointer(i8* %9, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i32 0, i32 0))
  %element27 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student26, i32 0, i32 1
  %field_var28 = load { i8*, i32 }*, { i8*, i32 }** %element27
  %10 = bitcast { i8*, i32 }* %field_var28 to i8*
  call void @tig_check_null_pointer(i8* %10, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i32 0, i32 0))
  %element29 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var28, i32 0, i32 0
  %field_var30 = load i8*, i8** %element29
  call void @tig_print(i8* %field_var30)
  %student31 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %11 = bitcast { i8*, { i8*, i32 }* }* %student31 to i8*
  call void @tig_check_null_pointer(i8* %11, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i32 0, i32 0))
  %element32 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student31, i32 0, i32 1
  %field_var33 = load { i8*, i32 }*, { i8*, i32 }** %element32
  %12 = bitcast { i8*, i32 }* %field_var33 to i8*
  call void @tig_check_null_pointer(i8* %12, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @15, i32 0, i32 0))
  %element34 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var33, i32 0, i32 0
  %field_var35 = load i8*, i8** %element34
  call void @assert_equal_string(i8* %field_var35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @16, i32 0, i32 0))
  %load_left36 = load { i8*, i32 }*, { i8*, i32 }** %class
  %13 = bitcast { i8*, i32 }* %load_left36 to i8*
  call void @tig_check_null_pointer(i8* %13, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @17, i32 0, i32 0))
  %element_left37 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left36, i32 0, i32 0
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @18, i32 0, i32 0), i8** %element_left37
  %student38 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %14 = bitcast { i8*, { i8*, i32 }* }* %student38 to i8*
  call void @tig_check_null_pointer(i8* %14, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @19, i32 0, i32 0))
  %element39 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student38, i32 0, i32 1
  %field_var40 = load { i8*, i32 }*, { i8*, i32 }** %element39
  %15 = bitcast { i8*, i32 }* %field_var40 to i8*
  call void @tig_check_null_pointer(i8* %15, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @20, i32 0, i32 0))
  %element41 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var40, i32 0, i32 0
  %field_var42 = load i8*, i8** %element41
  call void @tig_print(i8* %field_var42)
  %student43 = load { i8*, { i8*, i32 }* }*, { i8*, { i8*, i32 }* }** %student
  %16 = bitcast { i8*, { i8*, i32 }* }* %student43 to i8*
  call void @tig_check_null_pointer(i8* %16, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @21, i32 0, i32 0))
  %element44 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %student43, i32 0, i32 1
  %field_var45 = load { i8*, i32 }*, { i8*, i32 }** %element44
  %17 = bitcast { i8*, i32 }* %field_var45 to i8*
  call void @tig_check_null_pointer(i8* %17, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @22, i32 0, i32 0))
  %element46 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var45, i32 0, i32 0
  %field_var47 = load i8*, i8** %element46
  call void @assert_equal_string(i8* %field_var47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @23, i32 0, i32 0))
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

declare noalias i8* @malloc(i32)
