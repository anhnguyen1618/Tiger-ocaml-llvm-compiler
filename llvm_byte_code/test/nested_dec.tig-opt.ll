; ModuleID = 'llvm_byte_code/test/nested_dec.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  br label %test

test:                                             ; preds = %entry
  br i1 false, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result_addr.0 = phi i32 [ 6, %then ], [ -8, %else ]
  call void @tig_print_int(i32 %if_result_addr.0)
  call void @assert_equal_int(i32 %if_result_addr.0, i32 -8)
  ret i32 0
}
