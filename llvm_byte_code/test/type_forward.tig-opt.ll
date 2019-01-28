; ModuleID = 'llvm_byte_code/test/type_forward.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [17 x i8] c"type_forward.tig\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @assert_equal_int(i8*, i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  call void @tig_print_int(i32 11)
  call void @assert_equal_int(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @0, i32 0, i32 0), i32 11, i32 11)
  ret i32 0
}
