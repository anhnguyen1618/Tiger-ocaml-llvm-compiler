; ModuleID = 'llvm_byte_code/test/mutable.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  tail call void @tig_print_int(i32 20)
  tail call void @assert_equal_int(i32 20, i32 20)
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone
define i32 @f({ i32 }* nocapture readnone, i32) local_unnamed_addr #0 gc "ocaml" {
entry:
  %add_tmp3 = add i32 %1, 10
  ret i32 %add_tmp3
}

attributes #0 = { norecurse nounwind readnone }
