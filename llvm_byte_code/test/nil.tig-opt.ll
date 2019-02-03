; ModuleID = 'llvm_byte_code/test/nil.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [42 x i8] c"test/nil.tig::6.8: Nil pointer exception!\00"
@1 = private unnamed_addr constant [43 x i8] c"test/nil.tig::7.16: Nil pointer exception!\00"
@2 = private unnamed_addr constant [12 x i8] c"hello world\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare i32 @tig_nillable(i8*) local_unnamed_addr

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i8* }*
  %Element = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0), i8** %Element
  %0 = bitcast { i8* }* %record_init to i8*
  call void @tig_check_null_pointer(i8* %0, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @0, i32 0, i32 0))
  %element = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %1 = bitcast { i8* }* %record_init to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @1, i32 0, i32 0))
  %element3 = getelementptr { i8* }, { i8* }* %record_init, i32 0, i32 0
  %field_var4 = load i8*, i8** %element3
  call void @assert_equal_string(i8* %field_var4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i32 0, i32 0))
  %2 = bitcast { i8* }* %record_init to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @tig_print_int(i32 %3)
  %4 = bitcast { i8* }* %record_init to i8*
  %5 = call i32 @tig_nillable(i8* %4)
  call void @assert_equal_int(i32 %5, i32 0)
  %6 = call i32 @tig_nillable(i8* null)
  call void @tig_print_int(i32 %6)
  %7 = call i32 @tig_nillable(i8* null)
  call void @assert_equal_int(i32 %7, i32 1)
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr
