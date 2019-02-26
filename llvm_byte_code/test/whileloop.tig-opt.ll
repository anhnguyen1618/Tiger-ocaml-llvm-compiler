; ModuleID = 'llvm_byte_code/test/whileloop.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  tail call void @tig_print_int(i32 0)
  tail call void @tig_print_int(i32 1)
  tail call void @tig_print_int(i32 2)
  tail call void @tig_print_int(i32 3)
  tail call void @assert_equal_int(i32 3, i32 3)
  tail call void @assert_equal_int(i32 5, i32 5)
  ret i32 0
}
