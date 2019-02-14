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
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0), i8** %Element1
  %malloccall4 = tail call i8* @malloc(i32 40)
  %array_init = bitcast i8* %malloccall4 to { i32, i8* }**
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp slt i32 %i.0, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %Element7 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init, i32 %i.0
  store { i32, i8* }* %record_init, { i32, i8* }** %Element7
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32, i8* }** }* getelementptr ({ i32, { i32, i8* }** }, { i32, { i32, i8* }** }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall8 to { i32, { i32, i8* }** }*
  %array_info = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 0
  store i32 5, i32* %array_info
  %array_info9 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 1
  store { i32, i8* }** %array_init, { i32, i8* }*** %array_info9
  %0 = bitcast { i32, { i32, i8* }** }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %0, i32 0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 1
  %arr_addr = load { i32, i8* }**, { i32, i8* }*** %array_pointer
  %arr_ele_addr = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr, i32 0
  %arr_ele = load { i32, i8* }*, { i32, i8* }** %arr_ele_addr
  %1 = bitcast { i32, i8* }* %arr_ele to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @2, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %arr_ele, i32 0, i32 0
  %field_var = load i32, i32* %element
  br label %test11

test11:                                           ; preds = %loop12, %end
  %counter.0 = phi i32 [ %field_var, %end ], [ %minus_tmp, %loop12 ]
  %gt_tmp = icmp sgt i32 %counter.0, 0
  %bool_tmp15 = zext i1 %gt_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop12, label %end13

loop12:                                           ; preds = %test11
  %2 = call i32 @fib({ i32 }* %frame_pointer, i32 %counter.0)
  call void @tig_print_int(i32 %2)
  %3 = bitcast { i32, i8* }* %record_init to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @3, i32 0, i32 0))
  %element19 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  %field_var20 = load i8*, i8** %element19
  call void @tig_print(i8* %field_var20)
  %minus_tmp = sub i32 %counter.0, 1
  br label %test11

end13:                                            ; preds = %test11
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define i32 @fib({ i32 }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %eq_tmp = icmp eq i32 %1, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  br label %test2

merge:                                            ; preds = %merge5, %then
  %if_result_addr15.0 = phi i32 [ 0, %then ], [ %if_result_addr.0, %merge5 ]
  ret i32 %if_result_addr15.0

test2:                                            ; preds = %else
  %eq_tmp7 = icmp eq i32 %1, 1
  %bool_tmp8 = zext i1 %eq_tmp7 to i32
  %cond9 = icmp eq i32 %bool_tmp8, 1
  br i1 %cond9, label %then3, label %else4

then3:                                            ; preds = %test2
  br label %merge5

else4:                                            ; preds = %test2
  %minus_tmp = sub i32 %1, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @fib({ i32 }* %fp_addr, i32 %minus_tmp)
  %minus_tmp12 = sub i32 %1, 2
  %fp_addr_in_sl13 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { i32 }*, { i32 }** %fp_addr_in_sl13
  %3 = call i32 @fib({ i32 }* %fp_addr14, i32 %minus_tmp12)
  %add_tmp = add i32 %2, %3
  br label %merge5

merge5:                                           ; preds = %else4, %then3
  %if_result_addr.0 = phi i32 [ 1, %then3 ], [ %add_tmp, %else4 ]
  br label %merge
}
