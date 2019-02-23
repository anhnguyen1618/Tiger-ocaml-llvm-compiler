; ModuleID = 'llvm_byte_code/test/linked_list.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::12.5: Nil pointer exception!\00"
@1 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::13.5: Nil pointer exception!\00"
@2 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::13.10: Nil pointer exception!\00"
@3 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::13.15: Nil pointer exception!\00"
@4 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::14.16: Nil pointer exception!\00"
@5 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::16.5: Nil pointer exception!\00"
@6 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::16.10: Nil pointer exception!\00"
@7 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::16.15: Nil pointer exception!\00"
@8 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::18.5: Nil pointer exception!\00"
@9 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::18.10: Nil pointer exception!\00"
@10 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::18.15: Nil pointer exception!\00"
@11 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::24.33: Nil pointer exception!\00"
@12 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::25.35: Nil pointer exception!\00"
@13 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::26.40: Nil pointer exception!\00"
@14 = private unnamed_addr constant [12 x i8] c"end program\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 16)
  %Element = bitcast i8* %malloccall to i32*
  store i32 3, i32* %Element, align 4
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %0 = bitcast i8* %Element1 to i8**
  store i8* null, i8** %0, align 8
  %malloccall2 = tail call i8* @malloc(i32 16)
  %Element4 = bitcast i8* %malloccall2 to i32*
  store i32 2, i32* %Element4, align 4
  %Element5 = getelementptr i8, i8* %malloccall2, i64 8
  %1 = bitcast i8* %Element5 to i8**
  store i8* null, i8** %1, align 8
  %malloccall7 = tail call i8* @malloc(i32 16)
  %Element9 = bitcast i8* %malloccall7 to i32*
  store i32 1, i32* %Element9, align 4
  %Element10 = getelementptr i8, i8* %malloccall7, i64 8
  %2 = bitcast i8* %Element10 to i8**
  store i8* %malloccall2, i8** %2, align 8
  %malloccall11 = tail call i8* @malloc(i32 16)
  %Element13 = bitcast i8* %malloccall11 to i32*
  store i32 4, i32* %Element13, align 4
  %Element14 = getelementptr i8, i8* %malloccall11, i64 8
  %3 = bitcast i8* %Element14 to i8**
  store i8* null, i8** %3, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @0, i64 0, i64 0))
  store i8* %malloccall, i8** %1, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall7, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @1, i64 0, i64 0))
  %4 = bitcast i8* %Element10 to { i32, i8* }**
  %load_left19 = load { i32, i8* }*, { i32, i8* }** %4, align 8
  %5 = bitcast { i32, i8* }* %load_left19 to i8*
  tail call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @2, i64 0, i64 0))
  %element_left20 = getelementptr { i32, i8* }, { i32, i8* }* %load_left19, i64 0, i32 1
  %6 = bitcast i8** %element_left20 to { i32, i8* }**
  %load_left21 = load { i32, i8* }*, { i32, i8* }** %6, align 8
  %7 = bitcast { i32, i8* }* %load_left21 to i8*
  tail call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @3, i64 0, i64 0))
  %element_left22 = getelementptr { i32, i8* }, { i32, i8* }* %load_left21, i64 0, i32 0
  store i32 5, i32* %element_left22, align 4
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @4, i64 0, i64 0))
  %field_var = load i32, i32* %Element, align 4
  tail call void @assert_equal_int(i32 %field_var, i32 5)
  tail call void @tig_check_null_pointer(i8* %malloccall7, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @5, i64 0, i64 0))
  %load_left26 = load { i32, i8* }*, { i32, i8* }** %4, align 8
  %8 = bitcast { i32, i8* }* %load_left26 to i8*
  tail call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i64 0, i64 0))
  %element_left27 = getelementptr { i32, i8* }, { i32, i8* }* %load_left26, i64 0, i32 1
  %9 = bitcast i8** %element_left27 to { i32, i8* }**
  %load_left28 = load { i32, i8* }*, { i32, i8* }** %9, align 8
  %10 = bitcast { i32, i8* }* %load_left28 to i8*
  tail call void @tig_check_null_pointer(i8* %10, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i64 0, i64 0))
  %element_left29 = getelementptr { i32, i8* }, { i32, i8* }* %load_left28, i64 0, i32 0
  store i32 3, i32* %element_left29, align 4
  tail call void @tig_check_null_pointer(i8* %malloccall7, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @8, i64 0, i64 0))
  %load_left32 = load { i32, i8* }*, { i32, i8* }** %4, align 8
  %11 = bitcast { i32, i8* }* %load_left32 to i8*
  tail call void @tig_check_null_pointer(i8* %11, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @9, i64 0, i64 0))
  %element_left33 = getelementptr { i32, i8* }, { i32, i8* }* %load_left32, i64 0, i32 1
  %12 = bitcast i8** %element_left33 to { i32, i8* }**
  %load_left34 = load { i32, i8* }*, { i32, i8* }** %12, align 8
  %13 = bitcast { i32, i8* }* %load_left34 to i8*
  tail call void @tig_check_null_pointer(i8* %13, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @10, i64 0, i64 0))
  %element_left35 = getelementptr { i32, i8* }, { i32, i8* }* %load_left34, i64 0, i32 1
  store i8* %malloccall11, i8** %element_left35, align 8
  %14 = tail call i32 @tig_nillable(i8* %malloccall7)
  tail call void @tig_print_int(i32 %14)
  br label %test

test:                                             ; preds = %loop, %entry
  %current_node.0.in = phi i8* [ %malloccall7, %entry ], [ %field_var48, %loop ]
  %index.0 = phi i32 [ 1, %entry ], [ %add_tmp, %loop ]
  %15 = tail call i32 @tig_nillable(i8* %current_node.0.in)
  %eq_tmp = icmp eq i32 %15, 0
  br i1 %eq_tmp, label %loop, label %end

loop:                                             ; preds = %test
  tail call void @tig_check_null_pointer(i8* %current_node.0.in, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @11, i64 0, i64 0))
  %element40 = bitcast i8* %current_node.0.in to i32*
  %field_var41 = load i32, i32* %element40, align 4
  tail call void @tig_print_int(i32 %field_var41)
  tail call void @tig_check_null_pointer(i8* %current_node.0.in, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @12, i64 0, i64 0))
  %field_var44 = load i32, i32* %element40, align 4
  tail call void @assert_equal_int(i32 %field_var44, i32 %index.0)
  tail call void @tig_check_null_pointer(i8* %current_node.0.in, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @13, i64 0, i64 0))
  %element47 = getelementptr i8, i8* %current_node.0.in, i64 8
  %16 = bitcast i8* %element47 to i8**
  %field_var48 = load i8*, i8** %16, align 8
  %add_tmp = add i32 %index.0, 1
  br label %test

end:                                              ; preds = %test
  tail call void @tig_print(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @14, i64 0, i64 0))
  tail call void @assert_equal_int(i32 %index.0, i32 5)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

attributes #0 = { nounwind }
