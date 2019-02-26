; ModuleID = 'llvm_byte_code/test/array_of_nil.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [53 x i8] c"test/array_of_nil.tig::10.17: Nil pointer exception!\00"
@1 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::16.25: Array out of bound\00"
@2 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::17.26: Array out of bound\00"
@3 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::18.26: Array out of bound\00"
@4 = private unnamed_addr constant [53 x i8] c"test/array_of_nil.tig::21.18: Nil pointer exception!\00"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 16)
  %Element = bitcast i8* %malloccall to i32*
  store i32 1, i32* %Element, align 4
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %0 = bitcast i8* %Element1 to i8**
  store i8* null, i8** %0, align 8
  %malloccall2 = tail call i8* @malloc(i32 40)
  %array_init = bitcast i8* %malloccall2 to { i32, i8* }**
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 4
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %1 = zext i32 %i.0 to i64
  %Element5 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init, i64 %1
  store { i32, i8* }* null, { i32, i8* }** %Element5, align 8
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %malloccall6 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall6 to i32*
  store i32 5, i32* %array_info, align 4
  %array_info7 = getelementptr i8, i8* %malloccall6, i64 8
  %2 = bitcast i8* %array_info7 to i8**
  store i8* %malloccall2, i8** %2, align 8
  %malloccall8 = tail call i8* @malloc(i32 40)
  %array_init9 = bitcast i8* %malloccall8 to { i32, i8* }**
  br label %test11

test11:                                           ; preds = %loop12, %end
  %i10.0 = phi i32 [ 0, %end ], [ %add_tmp20, %loop12 ]
  %lt_tmp15 = icmp ugt i32 %i10.0, 4
  br i1 %lt_tmp15, label %end13, label %loop12

loop12:                                           ; preds = %test11
  %3 = zext i32 %i10.0 to i64
  %Element19 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init9, i64 %3
  store { i32, i8* }* null, { i32, i8* }** %Element19, align 8
  %add_tmp20 = add nuw nsw i32 %i10.0, 1
  br label %test11

end13:                                            ; preds = %test11
  %4 = bitcast i8* %array_info7 to { i32, i8* }***
  %malloccall21 = tail call i8* @malloc(i32 16)
  %array_info23 = bitcast i8* %malloccall21 to i32*
  store i32 5, i32* %array_info23, align 4
  %array_info24 = getelementptr i8, i8* %malloccall21, i64 8
  %5 = bitcast i8* %array_info24 to i8**
  store i8* %malloccall8, i8** %5, align 8
  %malloccall26 = tail call i8* @malloc(i32 40)
  %array_init27 = bitcast i8* %malloccall26 to { i32, i8* }**
  br label %test29

test29:                                           ; preds = %loop30, %end13
  %i28.0 = phi i32 [ 0, %end13 ], [ %add_tmp38, %loop30 ]
  %lt_tmp33 = icmp ugt i32 %i28.0, 4
  br i1 %lt_tmp33, label %end31, label %loop30

loop30:                                           ; preds = %test29
  %6 = zext i32 %i28.0 to i64
  %Element37 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init27, i64 %6
  store { i32, i8* }* null, { i32, i8* }** %Element37, align 8
  %add_tmp38 = add nuw nsw i32 %i28.0, 1
  br label %test29

end31:                                            ; preds = %test29
  %7 = bitcast i8* %array_info24 to { i32, i8* }***
  %malloccall39 = tail call i8* @malloc(i32 16)
  %array_info41 = bitcast i8* %malloccall39 to i32*
  store i32 5, i32* %array_info41, align 4
  %array_info42 = getelementptr i8, i8* %malloccall39, i64 8
  %8 = bitcast i8* %array_info42 to { i32, i8* }***
  %9 = bitcast i8* %array_info42 to i8**
  store i8* %malloccall26, i8** %9, align 8
  tail call void @tig_check_array_bound(i8* %malloccall6, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @1, i64 0, i64 0))
  %arr_addr = load { i32, i8* }**, { i32, i8* }*** %4, align 8
  %arr_ele_addr = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr, i64 1
  %10 = bitcast { i32, i8* }** %arr_ele_addr to i8**
  %arr_ele4 = load i8*, i8** %10, align 8
  %11 = tail call i32 @tig_nillable(i8* %arr_ele4)
  tail call void @assert_equal_int(i32 %11, i32 1)
  tail call void @tig_check_array_bound(i8* %malloccall21, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @2, i64 0, i64 0))
  %arr_addr46 = load { i32, i8* }**, { i32, i8* }*** %7, align 8
  %arr_ele_addr47 = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr46, i64 1
  %12 = bitcast { i32, i8* }** %arr_ele_addr47 to i8**
  %arr_ele485 = load i8*, i8** %12, align 8
  %13 = tail call i32 @tig_nillable(i8* %arr_ele485)
  tail call void @assert_equal_int(i32 %13, i32 1)
  tail call void @tig_check_array_bound(i8* %malloccall39, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @3, i64 0, i64 0))
  %arr_addr51 = load { i32, i8* }**, { i32, i8* }*** %8, align 8
  %arr_ele_addr52 = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr51, i64 1
  %14 = bitcast { i32, i8* }** %arr_ele_addr52 to i8**
  %arr_ele536 = load i8*, i8** %14, align 8
  %15 = tail call i32 @tig_nillable(i8* %arr_ele536)
  tail call void @assert_equal_int(i32 %15, i32 1)
  %16 = tail call i32 @g({ i32 }* undef, { i32, i8* }* null)
  tail call void @assert_equal_int(i32 %16, i32 0)
  %17 = tail call i32 @g({ i32 }* undef, { i32, i8* }* %record_init)
  tail call void @assert_equal_int(i32 %17, i32 1)
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @4, i64 0, i64 0))
  %18 = bitcast i8* %Element1 to { i32, i8* }**
  %field_var7 = load { i32, i8* }*, { i32, i8* }** %18, align 8
  %19 = tail call i32 @g({ i32 }* undef, { i32, i8* }* %field_var7)
  tail call void @assert_equal_int(i32 %19, i32 0)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

; Function Attrs: norecurse nounwind readnone
define noalias { i32, i8* }* @f({ i32 }* nocapture readnone) local_unnamed_addr #1 gc "ocaml" {
entry:
  ret { i32, i8* }* null
}

define i32 @g({ i32 }* nocapture readnone, { i32, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  %2 = bitcast { i32, i8* }* %1 to i8*
  %3 = tail call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 0
  br i1 %cond, label %else, label %merge

else:                                             ; preds = %entry
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @0, i64 0, i64 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %1, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  br label %merge

merge:                                            ; preds = %entry, %else
  %if_result_addr.0 = phi i32 [ %field_var, %else ], [ 0, %entry ]
  ret i32 %if_result_addr.0
}

attributes #0 = { nounwind }
attributes #1 = { norecurse nounwind readnone }
