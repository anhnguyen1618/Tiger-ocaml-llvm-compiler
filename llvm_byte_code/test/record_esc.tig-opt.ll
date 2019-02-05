; ModuleID = 'llvm_byte_code/test/record_esc.tig.ll'
source_filename = "Tiger jit"

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32, { i32, i8* }* }
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i8* }* null, { i32, i8* }** %root
  ret i32 0
}

define void @f({ i32, { i32, i8* }* }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32, { i32, i8* }* }* }
  %arg_address = getelementptr { { i32, { i32, i8* }* }* }, { { i32, { i32, i8* }* }* }* %frame_pointer, i32 0, i32 0
  store { i32, { i32, i8* }* }* %0, { i32, { i32, i8* }* }** %arg_address
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element2 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element2
  ret void
}

declare noalias i8* @malloc(i32) local_unnamed_addr
