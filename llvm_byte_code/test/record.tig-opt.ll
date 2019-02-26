; ModuleID = 'llvm_byte_code/test/record.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [47 x i8] c"test/record.tig::18.14: Nil pointer exception!\00"
@1 = private unnamed_addr constant [47 x i8] c"test/record.tig::19.22: Nil pointer exception!\00"
@2 = private unnamed_addr constant [6 x i8] c"world\00"
@3 = private unnamed_addr constant [47 x i8] c"test/record.tig::21.17: Nil pointer exception!\00"
@4 = private unnamed_addr constant [47 x i8] c"test/record.tig::21.23: Nil pointer exception!\00"
@5 = private unnamed_addr constant [47 x i8] c"test/record.tig::22.19: Nil pointer exception!\00"
@6 = private unnamed_addr constant [47 x i8] c"test/record.tig::22.25: Nil pointer exception!\00"
@7 = private unnamed_addr constant [46 x i8] c"test/record.tig::24.8: Nil pointer exception!\00"
@8 = private unnamed_addr constant [47 x i8] c"test/record.tig::24.14: Nil pointer exception!\00"
@9 = private unnamed_addr constant [47 x i8] c"test/record.tig::25.17: Nil pointer exception!\00"
@10 = private unnamed_addr constant [47 x i8] c"test/record.tig::27.14: Nil pointer exception!\00"
@11 = private unnamed_addr constant [47 x i8] c"test/record.tig::27.20: Nil pointer exception!\00"
@12 = private unnamed_addr constant [47 x i8] c"test/record.tig::28.22: Nil pointer exception!\00"
@13 = private unnamed_addr constant [47 x i8] c"test/record.tig::28.28: Nil pointer exception!\00"
@14 = private unnamed_addr constant [6 x i8] c"hello\00"
@15 = private unnamed_addr constant [46 x i8] c"test/record.tig::30.6: Nil pointer exception!\00"
@16 = private unnamed_addr constant [47 x i8] c"test/record.tig::31.14: Nil pointer exception!\00"
@17 = private unnamed_addr constant [47 x i8] c"test/record.tig::31.20: Nil pointer exception!\00"
@18 = private unnamed_addr constant [47 x i8] c"test/record.tig::32.22: Nil pointer exception!\00"
@19 = private unnamed_addr constant [47 x i8] c"test/record.tig::32.28: Nil pointer exception!\00"
@20 = private unnamed_addr constant [4 x i8] c"lol\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 16)
  %Element = bitcast i8* %malloccall to i8**
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @14, i64 0, i64 0), i8** %Element, align 8
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %0 = bitcast i8* %Element1 to i32*
  store i32 10, i32* %0, align 4
  %malloccall3 = tail call i8* @malloc(i32 16)
  %Element5 = bitcast i8* %malloccall3 to i8**
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i64 0, i64 0), i8** %Element5, align 8
  %Element6 = getelementptr i8, i8* %malloccall3, i64 8
  %1 = bitcast i8* %Element6 to { i8*, i32 }**
  %2 = bitcast i8* %Element6 to i8**
  store i8* %malloccall, i8** %2, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @0, i64 0, i64 0))
  %field_var = load i8*, i8** %Element5, align 8
  tail call void @tig_print(i8* %field_var)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @1, i64 0, i64 0))
  %field_var10 = load i8*, i8** %Element5, align 8
  tail call void @assert_equal_string(i8* %field_var10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i64 0, i64 0))
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @3, i64 0, i64 0))
  %field_var13 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %3 = bitcast { i8*, i32 }* %field_var13 to i8*
  tail call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i64 0, i64 0))
  %element14 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var13, i64 0, i32 1
  %field_var15 = load i32, i32* %element14, align 4
  tail call void @tig_print_int(i32 %field_var15)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i64 0, i64 0))
  %field_var18 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %4 = bitcast { i8*, i32 }* %field_var18 to i8*
  tail call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i64 0, i64 0))
  %element19 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var18, i64 0, i32 1
  %field_var20 = load i32, i32* %element19, align 4
  tail call void @assert_equal_int(i32 %field_var20, i32 10)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @7, i64 0, i64 0))
  %load_left21 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %5 = bitcast { i8*, i32 }* %load_left21 to i8*
  tail call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i64 0, i64 0))
  %element_left22 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left21, i64 0, i32 1
  store i32 100, i32* %element_left22, align 4
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i64 0, i64 0))
  %field_var25 = load i32, i32* %0, align 4
  tail call void @assert_equal_int(i32 %field_var25, i32 100)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i64 0, i64 0))
  %field_var28 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %6 = bitcast { i8*, i32 }* %field_var28 to i8*
  tail call void @tig_check_null_pointer(i8* %6, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i64 0, i64 0))
  %element29 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var28, i64 0, i32 0
  %field_var30 = load i8*, i8** %element29, align 8
  tail call void @tig_print(i8* %field_var30)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i64 0, i64 0))
  %field_var33 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %7 = bitcast { i8*, i32 }* %field_var33 to i8*
  tail call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i64 0, i64 0))
  %element34 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var33, i64 0, i32 0
  %field_var35 = load i8*, i8** %element34, align 8
  tail call void @assert_equal_string(i8* %field_var35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @14, i64 0, i64 0))
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @15, i64 0, i64 0))
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @20, i64 0, i64 0), i8** %Element, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @16, i64 0, i64 0))
  %field_var40 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %8 = bitcast { i8*, i32 }* %field_var40 to i8*
  tail call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @17, i64 0, i64 0))
  %element41 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var40, i64 0, i32 0
  %field_var42 = load i8*, i8** %element41, align 8
  tail call void @tig_print(i8* %field_var42)
  tail call void @tig_check_null_pointer(i8* %malloccall3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @18, i64 0, i64 0))
  %field_var45 = load { i8*, i32 }*, { i8*, i32 }** %1, align 8
  %9 = bitcast { i8*, i32 }* %field_var45 to i8*
  tail call void @tig_check_null_pointer(i8* %9, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @19, i64 0, i64 0))
  %element46 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var45, i64 0, i32 0
  %field_var47 = load i8*, i8** %element46, align 8
  tail call void @assert_equal_string(i8* %field_var47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @20, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

attributes #0 = { nounwind }
