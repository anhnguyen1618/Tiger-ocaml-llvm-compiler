; ModuleID = 'llvm_byte_code/test/nested_dec.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  tail call void @tig_print_int(i32 -8)
  tail call void @assert_equal_int(i32 -8, i32 -8)
  ret i32 0
}
