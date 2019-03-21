; ModuleID = 'llvm_byte_code/test/compose.tig.ll'
source_filename = "Tiger jit"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 4)
  %malloccall1 = tail call i8* @malloc(i32 16)
  %closure_addr = bitcast i8* %malloccall1 to { i32 (i8*, i32)*, i8* }*
  %closure_ele = bitcast i8* %malloccall1 to i32 (i8*, i32)**
  store i32 (i8*, i32)* @double, i32 (i8*, i32)** %closure_ele, align 8
  %closure_ele2 = getelementptr i8, i8* %malloccall1, i64 8
  %0 = bitcast i8* %closure_ele2 to i8**
  store i8* %malloccall, i8** %0, align 8
  %malloccall3 = tail call i8* @malloc(i32 16)
  %closure_addr4 = bitcast i8* %malloccall3 to { i32 (i8*, i32)*, i8* }*
  %closure_ele5 = bitcast i8* %malloccall3 to i32 (i8*, i32)**
  store i32 (i8*, i32)* @add_two, i32 (i8*, i32)** %closure_ele5, align 8
  %closure_ele7 = getelementptr i8, i8* %malloccall3, i64 8
  %1 = bitcast i8* %closure_ele7 to i8**
  store i8* %malloccall, i8** %1, align 8
  %2 = tail call { i32 (i8*, i32)*, i8* }* @compose(i8* %malloccall, { i32 (i8*, i32)*, i8* }* %closure_addr, { i32 (i8*, i32)*, i8* }* %closure_addr4)
  %closure_val_addr = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %2, i64 0, i32 0
  %closure_val = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr, align 8
  %closure_val_addr9 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %2, i64 0, i32 1
  %closure_val10 = load i8*, i8** %closure_val_addr9, align 8
  %3 = tail call i32 %closure_val(i8* %closure_val10, i32 5)
  tail call void @tig_print_int(i32 %3)
  %4 = tail call i32 %closure_val(i8* %closure_val10, i32 3)
  tail call void @assert_equal_int(i32 %4, i32 10)
  %5 = tail call i32 %closure_val(i8* %closure_val10, i32 0)
  tail call void @assert_equal_int(i32 %5, i32 4)
  %6 = tail call i32 %closure_val(i8* %closure_val10, i32 -2)
  tail call void @assert_equal_int(i32 %6, i32 0)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

; Function Attrs: norecurse nounwind readnone
define i32 @add_two(i8* nocapture readnone, i32) #1 gc "ocaml" {
entry:
  %add_tmp = add i32 %1, 2
  ret i32 %add_tmp
}

; Function Attrs: norecurse nounwind readnone
define i32 @double(i8* nocapture readnone, i32) #1 gc "ocaml" {
entry:
  %mul_tmp = shl i32 %1, 1
  ret i32 %mul_tmp
}

; Function Attrs: nounwind
define noalias { i32 (i8*, i32)*, i8* }* @compose(i8*, { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }*) local_unnamed_addr #0 gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 24)
  %3 = bitcast i8* %malloccall to i8**
  store i8* %0, i8** %3, align 8
  %arg_address = getelementptr i8, i8* %malloccall, i64 8
  %4 = bitcast i8* %arg_address to { i32 (i8*, i32)*, i8* }**
  store { i32 (i8*, i32)*, i8* }* %1, { i32 (i8*, i32)*, i8* }** %4, align 8
  %arg_address1 = getelementptr i8, i8* %malloccall, i64 16
  %5 = bitcast i8* %arg_address1 to { i32 (i8*, i32)*, i8* }**
  store { i32 (i8*, i32)*, i8* }* %2, { i32 (i8*, i32)*, i8* }** %5, align 8
  %malloccall2 = tail call i8* @malloc(i32 16)
  %closure_addr = bitcast i8* %malloccall2 to { i32 (i8*, i32)*, i8* }*
  %closure_ele = bitcast i8* %malloccall2 to i32 (i8*, i32)**
  store i32 (i8*, i32)* @h, i32 (i8*, i32)** %closure_ele, align 8
  %closure_ele3 = getelementptr i8, i8* %malloccall2, i64 8
  %6 = bitcast i8* %closure_ele3 to i8**
  store i8* %malloccall, i8** %6, align 8
  ret { i32 (i8*, i32)*, i8* }* %closure_addr
}

define i32 @h(i8*, i32) gc "ocaml" {
entry:
  %g = getelementptr i8, i8* %0, i64 16
  %2 = bitcast i8* %g to { i32 (i8*, i32)*, i8* }**
  %g2 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %2, align 8
  %closure_val_addr = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %g2, i64 0, i32 0
  %closure_val = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr, align 8
  %closure_val_addr3 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %g2, i64 0, i32 1
  %closure_val4 = load i8*, i8** %closure_val_addr3, align 8
  %3 = tail call i32 %closure_val(i8* %closure_val4, i32 %1)
  %f = getelementptr i8, i8* %0, i64 8
  %4 = bitcast i8* %f to { i32 (i8*, i32)*, i8* }**
  %f7 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %4, align 8
  %closure_val_addr8 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %f7, i64 0, i32 0
  %closure_val9 = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr8, align 8
  %closure_val_addr10 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %f7, i64 0, i32 1
  %closure_val11 = load i8*, i8** %closure_val_addr10, align 8
  %5 = tail call i32 %closure_val9(i8* %closure_val11, i32 %3)
  ret i32 %5
}

attributes #0 = { nounwind }
attributes #1 = { norecurse nounwind readnone }
