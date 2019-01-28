; ModuleID = 'llvm_byte_code/test/whileloop.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  br label %test

test:                                             ; preds = %merge, %entry
  %a.0 = phi i32 [ 0, %entry ], [ %add_tmp9, %merge ]
  %b.0 = phi i32 [ 2, %entry ], [ %add_tmp, %merge ]
  %lt_tmp = icmp slt i32 %a.0, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end.loopexit

loop:                                             ; preds = %test
  call void @tig_print_int(i32 %a.0)
  br label %test3

end.loopexit:                                     ; preds = %test
  %a.0.lcssa = phi i32 [ %a.0, %test ]
  %b.0.lcssa = phi i32 [ %b.0, %test ]
  br label %end

end:                                              ; preds = %end.loopexit, %then
  %a.04 = phi i32 [ %a.0.lcssa, %end.loopexit ], [ %a.0.lcssa3, %then ]
  %b.02 = phi i32 [ %b.0.lcssa, %end.loopexit ], [ %b.0.lcssa1, %then ]
  call void @assert_equal_int(i32 %a.04, i32 3)
  call void @assert_equal_int(i32 %b.02, i32 5)
  ret i32 0

test3:                                            ; preds = %loop
  %eq_tmp = icmp eq i32 %a.0, 3
  %bool_tmp5 = zext i1 %eq_tmp to i32
  %cond6 = icmp eq i32 %bool_tmp5, 1
  br i1 %cond6, label %then, label %else

then:                                             ; preds = %test3
  %a.0.lcssa3 = phi i32 [ %a.0, %test3 ]
  %b.0.lcssa1 = phi i32 [ %b.0, %test3 ]
  br label %end

else:                                             ; preds = %test3
  br label %merge

merge:                                            ; preds = %else
  %add_tmp = add i32 %b.0, 1
  %add_tmp9 = add i32 %a.0, 1
  br label %test
}
