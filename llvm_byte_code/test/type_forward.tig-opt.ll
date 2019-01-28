; ModuleID = 'llvm_byte_code/test/type_forward.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  call void @tig_print_int(i32 11)
  call void @assert_equal_int(i32 11, i32 11)
  ret i32 0
}
