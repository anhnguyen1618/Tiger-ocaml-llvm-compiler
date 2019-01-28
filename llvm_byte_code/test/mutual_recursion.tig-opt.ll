; ModuleID = 'llvm_byte_code/test/mutual_recursion.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @a({ i32 }* %frame_pointer)
  call void @tig_print_int(i32 %0)
  %1 = call i32 @a({ i32 }* %frame_pointer)
  %2 = call i32 @b({ i32 }* %frame_pointer)
  call void @assert_equal_int(i32 %1, i32 %2)
  ret i32 0
}

define i32 @a({ i32 }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %1 = call i32 @b({ i32 }* %fp_addr)
  ret i32 %1
}

define i32 @b({ i32 }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  ret i32 4
}
