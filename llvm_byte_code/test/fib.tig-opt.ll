; ModuleID = 'llvm_byte_code/test/fib.tig.ll'
source_filename = "Tiger jit"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @fib({ i32 }* %frame_pointer, i32 0)
  %1 = call i32 @fib({ i32 }* %frame_pointer, i32 1)
  %2 = call i32 @fib({ i32 }* %frame_pointer, i32 5)
  %3 = call i32 @fib({ i32 }* %frame_pointer, i32 14)
  %4 = call i32 @fib({ i32 }* %frame_pointer, i32 30)
  call void @assert_equal_int(i32 %0, i32 0)
  call void @assert_equal_int(i32 %1, i32 1)
  call void @assert_equal_int(i32 %2, i32 5)
  call void @assert_equal_int(i32 %3, i32 377)
  call void @assert_equal_int(i32 %4, i32 832040)
  ret i32 0
}

define i32 @fib({ i32 }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %eq_tmp = icmp eq i32 %1, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  br label %test2

merge:                                            ; preds = %merge5, %then
  %if_result_addr15.0 = phi i32 [ %if_result_addr.0, %merge5 ], [ 0, %then ]
  ret i32 %if_result_addr15.0

test2:                                            ; preds = %else
  %eq_tmp7 = icmp eq i32 %1, 1
  %bool_tmp8 = zext i1 %eq_tmp7 to i32
  %cond9 = icmp eq i32 %bool_tmp8, 0
  br i1 %cond9, label %else4, label %then3

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
  %if_result_addr.0 = phi i32 [ %add_tmp, %else4 ], [ 1, %then3 ]
  br label %merge
}
