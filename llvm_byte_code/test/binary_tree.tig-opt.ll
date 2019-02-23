; ModuleID = 'llvm_byte_code/test/binary_tree.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::7.17: Nil pointer exception!\00"
@1 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::7.38: Nil pointer exception!\00"
@2 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::7.60: Nil pointer exception!\00"
@3 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::17.8: Nil pointer exception!\00"
@4 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::18.8: Nil pointer exception!\00"
@5 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::19.5: Nil pointer exception!\00"
@6 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::20.5: Nil pointer exception!\00"
@7 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::21.5: Nil pointer exception!\00"
@8 = private unnamed_addr constant [51 x i8] c"test/binary_tree.tig::22.5: Nil pointer exception!\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }, align 8
  %malloccall = tail call i8* @malloc(i32 24)
  %record_init = bitcast i8* %malloccall to { i32, i8*, i8* }*
  %Element = bitcast i8* %malloccall to i32*
  store i32 5, i32* %Element, align 4
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %0 = bitcast i8* %Element1 to i8**
  %Element2 = getelementptr i8, i8* %malloccall, i64 16
  %1 = bitcast i8* %Element2 to i8**
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element1, i8 0, i64 16, i1 false)
  %malloccall3 = tail call i8* @malloc(i32 24)
  %Element5 = bitcast i8* %malloccall3 to i32*
  store i32 1, i32* %Element5, align 4
  %Element6 = getelementptr i8, i8* %malloccall3, i64 8
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element6, i8 0, i64 16, i1 false)
  %malloccall8 = tail call i8* @malloc(i32 24)
  %Element10 = bitcast i8* %malloccall8 to i32*
  store i32 2, i32* %Element10, align 4
  %Element11 = getelementptr i8, i8* %malloccall8, i64 8
  %2 = bitcast i8* %Element11 to i8**
  %Element12 = getelementptr i8, i8* %malloccall8, i64 16
  %3 = bitcast i8* %Element12 to i8**
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element11, i8 0, i64 16, i1 false)
  %malloccall13 = tail call i8* @malloc(i32 24)
  %Element15 = bitcast i8* %malloccall13 to i32*
  store i32 3, i32* %Element15, align 4
  %Element16 = getelementptr i8, i8* %malloccall13, i64 8
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element16, i8 0, i64 16, i1 false)
  %malloccall18 = tail call i8* @malloc(i32 24)
  %Element20 = bitcast i8* %malloccall18 to i32*
  store i32 6, i32* %Element20, align 4
  %Element21 = getelementptr i8, i8* %malloccall18, i64 8
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element21, i8 0, i64 16, i1 false)
  %malloccall23 = tail call i8* @malloc(i32 24)
  %Element25 = bitcast i8* %malloccall23 to i32*
  store i32 8, i32* %Element25, align 4
  %Element26 = getelementptr i8, i8* %malloccall23, i64 8
  %4 = bitcast i8* %Element26 to i8**
  %Element27 = getelementptr i8, i8* %malloccall23, i64 16
  %5 = bitcast i8* %Element27 to i8**
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element26, i8 0, i64 16, i1 false)
  %malloccall28 = tail call i8* @malloc(i32 24)
  %Element30 = bitcast i8* %malloccall28 to i32*
  store i32 9, i32* %Element30, align 4
  %Element31 = getelementptr i8, i8* %malloccall28, i64 8
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element31, i8 0, i64 16, i1 false)
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @3, i64 0, i64 0))
  store i8* %malloccall8, i8** %0, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @4, i64 0, i64 0))
  store i8* %malloccall23, i8** %1, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall8, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @5, i64 0, i64 0))
  store i8* %malloccall3, i8** %2, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall8, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @6, i64 0, i64 0))
  store i8* %malloccall13, i8** %3, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall23, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @7, i64 0, i64 0))
  store i8* %malloccall18, i8** %4, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall23, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @8, i64 0, i64 0))
  store i8* %malloccall28, i8** %5, align 8
  %6 = call i32 @eval_sum({ i32 }* nonnull %frame_pointer, { i32, i8*, i8* }* %record_init)
  call void @tig_print_int(i32 %6)
  %7 = call i32 @eval_sum({ i32 }* nonnull %frame_pointer, { i32, i8*, i8* }* %record_init)
  call void @assert_equal_int(i32 %7, i32 34)
  ret i32 0
}

define i32 @eval_sum({ i32 }*, { i32, i8*, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %else, %entry
  %accumulator.tr = phi i32 [ 0, %entry ], [ %add_tmp11, %else ]
  %.tr3 = phi { i32, i8*, i8* }* [ %1, %entry ], [ %field_var82, %else ]
  %2 = bitcast { i32, i8*, i8* }* %.tr3 to i8*
  %3 = tail call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 0
  br i1 %cond, label %else, label %merge

else:                                             ; preds = %tailrecurse
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @0, i64 0, i64 0))
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @1, i64 0, i64 0))
  %element4 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 1
  %4 = bitcast i8** %element4 to { i32, i8*, i8* }**
  %field_var51 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %4, align 8
  %5 = tail call i32 @eval_sum({ i32 }* %0, { i32, i8*, i8* }* %field_var51)
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @2, i64 0, i64 0))
  %element7 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 2
  %6 = bitcast i8** %element7 to { i32, i8*, i8* }**
  %field_var82 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %6, align 8
  %add_tmp = add i32 %field_var, %accumulator.tr
  %add_tmp11 = add i32 %add_tmp, %5
  br label %tailrecurse

merge:                                            ; preds = %tailrecurse
  ret i32 %accumulator.tr
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
