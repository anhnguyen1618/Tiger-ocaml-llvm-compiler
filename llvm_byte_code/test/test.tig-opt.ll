; ModuleID = 'llvm_byte_code/test/test.tig.ll'
source_filename = "Tiger jit"

%a = type { i32 }

declare void @tig_print_int(i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to %a*
  %Element = getelementptr %a, %a* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %element = getelementptr %a, %a* %record_init, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr
