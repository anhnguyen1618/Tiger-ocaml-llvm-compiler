; ModuleID = 'llvm_byte_code/test/record_nil_esc.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [54 x i8] c"test/record_nil_esc.tig::8.19: Nil pointer exception!\00"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32, { i32, i8* }* }, align 8
  %root = getelementptr inbounds { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %frame_pointer, i64 0, i32 1
  store { i32, i8* }* null, { i32, i8* }** %root, align 8
  %0 = tail call i32 @tig_nillable(i8* null)
  tail call void @assert_equal_int(i32 %0, i32 1)
  call void @f({ i32, { i32, i8* }* }* nonnull %frame_pointer)
  %root4 = load { i32, i8* }*, { i32, i8* }** %root, align 8
  %1 = bitcast { i32, i8* }* %root4 to i8*
  tail call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @0, i64 0, i64 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %root4, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  tail call void @assert_equal_int(i32 %field_var, i32 5)
  ret i32 0
}

; Function Attrs: nounwind
define void @f({ i32, { i32, i8* }* }* nocapture) local_unnamed_addr #0 gc "ocaml" {
entry:
  %root = getelementptr { i32, { i32, i8* }* }, { i32, { i32, i8* }* }* %0, i64 0, i32 1
  %malloccall = tail call i8* @malloc(i32 16)
  %Element = bitcast i8* %malloccall to i32*
  store i32 5, i32* %Element, align 4
  %Element1 = getelementptr i8, i8* %malloccall, i64 8
  %1 = bitcast i8* %Element1 to i8**
  store i8* null, i8** %1, align 8
  %2 = bitcast { i32, i8* }** %root to i8**
  store i8* %malloccall, i8** %2, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

attributes #0 = { nounwind }
