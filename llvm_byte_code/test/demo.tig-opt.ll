; ModuleID = 'llvm_byte_code/test/demo.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [13 x i8] c"Demo program\00"
@1 = private unnamed_addr constant [41 x i8] c"test/demo.tig::14.20: Array out of bound\00"
@2 = private unnamed_addr constant [45 x i8] c"test/demo.tig::14.23: Nil pointer exception!\00"
@3 = private unnamed_addr constant [45 x i8] c"test/demo.tig::19.19: Nil pointer exception!\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }, align 8
  %malloccall = tail call i8* @malloc(i32 16)
  %Element = bitcast i8* %malloccall to i32*
  store i32 5, i32* %Element, align 4
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %0 = bitcast i8* %Element1 to i8**
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i64 0, i64 0), i8** %0, align 8
  %malloccall4 = tail call i8* @malloc(i32 40)
  %array_init = bitcast i8* %malloccall4 to { i32, i8* }**
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 4
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %1 = zext i32 %i.0 to i64
  %Element7 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init, i64 %1
  %2 = bitcast { i32, i8* }** %Element7 to i8**
  store i8* %malloccall, i8** %2, align 8
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall8 to i32*
  store i32 5, i32* %array_info, align 4
  %array_info9 = getelementptr i8, i8* %malloccall8, i64 8
  %3 = bitcast i8* %array_info9 to { i32, i8* }***
  %4 = bitcast i8* %array_info9 to i8**
  store i8* %malloccall4, i8** %4, align 8
  tail call void @tig_check_array_bound(i8* %malloccall8, i32 0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i64 0, i64 0))
  %arr_addr = load { i32, i8* }**, { i32, i8* }*** %3, align 8
  %arr_ele = load { i32, i8* }*, { i32, i8* }** %arr_addr, align 8
  %5 = bitcast { i32, i8* }* %arr_ele to i8*
  tail call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @2, i64 0, i64 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %arr_ele, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  br label %test11

test11:                                           ; preds = %loop12, %end
  %counter.0 = phi i32 [ %field_var, %end ], [ %minus_tmp, %loop12 ]
  %gt_tmp = icmp slt i32 %counter.0, 1
  br i1 %gt_tmp, label %end13, label %loop12

loop12:                                           ; preds = %test11
  %6 = call i32 @fib({ i32 }* nonnull %frame_pointer, i32 %counter.0)
  call void @tig_print_int(i32 %6)
  call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @3, i64 0, i64 0))
  %field_var20 = load i8*, i8** %0, align 8
  call void @tig_print(i8* %field_var20)
  %minus_tmp = add i32 %counter.0, -1
  br label %test11

end13:                                            ; preds = %test11
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

; Function Attrs: nounwind readnone
define i32 @fib({ i32 }*, i32) local_unnamed_addr #1 gc "ocaml" {
entry:
  %switch = icmp ult i32 %1, 2
  br i1 %switch, label %merge, label %else4

merge:                                            ; preds = %entry, %else4
  %if_result_addr15.0 = phi i32 [ %add_tmp, %else4 ], [ %1, %entry ]
  ret i32 %if_result_addr15.0

else4:                                            ; preds = %entry
  %minus_tmp = add i32 %1, -1
  %2 = tail call i32 @fib({ i32 }* %0, i32 %minus_tmp)
  %minus_tmp12 = add i32 %1, -2
  %3 = tail call i32 @fib({ i32 }* %0, i32 %minus_tmp12)
  %add_tmp = add i32 %3, %2
  br label %merge
}

attributes #0 = { nounwind }
attributes #1 = { nounwind readnone }
