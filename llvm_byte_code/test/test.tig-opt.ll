; ModuleID = 'llvm_byte_code/test/test.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [19 x i8] c"Test file: fig.tig\00"
@1 = private unnamed_addr constant [7 x i8] c"Expect\00"
@2 = private unnamed_addr constant [9 x i8] c"To equal\00"
@3 = private unnamed_addr constant [17 x i8] c"fib.tig: Passed!\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare void @tig_exit(i32) local_unnamed_addr

declare i32 @tig_not(i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @fib({ i32 }* %frame_pointer, i32 0)
  %1 = call i32 @fib({ i32 }* %frame_pointer, i32 1)
  %2 = call i32 @fib({ i32 }* %frame_pointer, i32 5)
  %3 = call i32 @fib({ i32 }* %frame_pointer, i32 14)
  %4 = call i32 @fib({ i32 }* %frame_pointer, i32 30)
  call void @assert_int({ i32 }* %frame_pointer, i32 %0, i32 0)
  call void @assert_int({ i32 }* %frame_pointer, i32 %1, i32 1)
  call void @assert_int({ i32 }* %frame_pointer, i32 %2, i32 9)
  call void @assert_int({ i32 }* %frame_pointer, i32 %3, i32 377)
  call void @assert_int({ i32 }* %frame_pointer, i32 %4, i32 832040)
  call void @tig_print(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @3, i32 0, i32 0))
  ret i32 0
}

define i32 @fib({ i32 }*, i32) local_unnamed_addr {
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

define void @assert_int({ i32 }*, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %eq_tmp = icmp eq i32 %1, %2
  %bool_tmp = zext i1 %eq_tmp to i32
  %3 = call i32 @tig_not(i32 %bool_tmp)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @0, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @1, i32 0, i32 0))
  call void @tig_print_int(i32 %1)
  call void @tig_print(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @2, i32 0, i32 0))
  call void @tig_print_int(i32 %2)
  call void @tig_exit(i32 1)
  br label %merge

else:                                             ; preds = %test
  br label %merge

merge:                                            ; preds = %else, %then
  ret void
}
