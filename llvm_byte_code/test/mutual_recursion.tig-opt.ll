; ModuleID = 'llvm_byte_code/test/mutual_recursion.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  tail call void @tig_print_int(i32 4)
  tail call void @assert_equal_int(i32 4, i32 4)
  ret i32 0
}

; Function Attrs: norecurse nounwind readnone
define i32 @a({ i32 }* nocapture readnone) local_unnamed_addr #0 gc "ocaml" {
entry:
  ret i32 4
}

; Function Attrs: norecurse nounwind readnone
define i32 @b({ i32 }* nocapture readnone) local_unnamed_addr #0 gc "ocaml" {
entry:
  ret i32 4
}

attributes #0 = { norecurse nounwind readnone }
