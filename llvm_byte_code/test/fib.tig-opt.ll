; ModuleID = 'llvm_byte_code/test/fib.tig.ll'
source_filename = "Tiger jit"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }, align 8
  %0 = call i32 @fib({ i32 }* nonnull %frame_pointer, i32 5)
  %1 = call i32 @fib({ i32 }* nonnull %frame_pointer, i32 14)
  %2 = call i32 @fib({ i32 }* nonnull %frame_pointer, i32 30)
  tail call void @assert_equal_int(i32 0, i32 0)
  tail call void @assert_equal_int(i32 1, i32 1)
  call void @assert_equal_int(i32 %0, i32 5)
  call void @assert_equal_int(i32 %1, i32 377)
  call void @assert_equal_int(i32 %2, i32 832040)
  ret i32 0
}

; Function Attrs: nounwind readnone
define i32 @fib({ i32 }*, i32) local_unnamed_addr #0 gc "ocaml" {
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

attributes #0 = { nounwind readnone }
