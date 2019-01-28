; ModuleID = 'llvm_byte_code/test/nil.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"hello world\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare i32 @tig_nillable(i8*) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i8* }*
  %Element = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i8** %Element
  %element = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %element3 = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  %field_var4 = load i8*, i8** %element3
  call void @assert_equal_string(i8* %field_var4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0))
  %0 = bitcast { i8* }* %record_init to i8*
  %1 = call i32 @tig_nillable(i8* %0)
  call void @tig_print_int(i32 %1)
  %2 = bitcast { i8* }* %record_init to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @assert_equal_int(i32 %3, i32 0)
  %4 = call i32 @tig_nillable(i8* null)
  call void @tig_print_int(i32 %4)
  %5 = call i32 @tig_nillable(i8* null)
  call void @assert_equal_int(i32 %5, i32 1)
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr
