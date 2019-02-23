; ModuleID = 'llvm_byte_code/test/nil.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [42 x i8] c"test/nil.tig::6.8: Nil pointer exception!\00"
@1 = private unnamed_addr constant [43 x i8] c"test/nil.tig::7.16: Nil pointer exception!\00"
@2 = private unnamed_addr constant [12 x i8] c"hello world\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 8)
  %Element = bitcast i8* %malloccall to i8**
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i64 0, i64 0), i8** %Element, align 8
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @0, i64 0, i64 0))
  %field_var = load i8*, i8** %Element, align 8
  tail call void @tig_print(i8* %field_var)
  tail call void @tig_check_null_pointer(i8* %malloccall, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @1, i64 0, i64 0))
  %field_var4 = load i8*, i8** %Element, align 8
  tail call void @assert_equal_string(i8* %field_var4, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @2, i64 0, i64 0))
  %0 = tail call i32 @tig_nillable(i8* %malloccall)
  tail call void @tig_print_int(i32 %0)
  %1 = tail call i32 @tig_nillable(i8* %malloccall)
  tail call void @assert_equal_int(i32 %1, i32 0)
  %2 = tail call i32 @tig_nillable(i8* null)
  tail call void @tig_print_int(i32 %2)
  %3 = tail call i32 @tig_nillable(i8* null)
  tail call void @assert_equal_int(i32 %3, i32 1)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

attributes #0 = { nounwind }
