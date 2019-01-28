; ModuleID = 'llvm_byte_code/test/mutable.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"mutable.tig\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @assert_equal_int(i8*, i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call i32 @f({ i32 }* %frame_pointer, i32 10)
  call void @tig_print_int(i32 %0)
  %1 = call i32 @f({ i32 }* %frame_pointer, i32 10)
  call void @assert_equal_int(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i32 %1, i32 20)
  ret i32 0
}

define i32 @f({ i32 }*, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %add_tmp = add i32 %1, 5
  %add_tmp3 = add i32 %add_tmp, 5
  ret i32 %add_tmp3
}
