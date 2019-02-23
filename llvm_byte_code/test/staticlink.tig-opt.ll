; ModuleID = 'llvm_byte_code/test/staticlink.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [47 x i8] c"test/staticlink.tig::10.35: Array out of bound\00"
@1 = private unnamed_addr constant [46 x i8] c"test/staticlink.tig::12.6: Array out of bound\00"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32, i32, { i32, i32* }* }, align 8
  %var_dec = getelementptr inbounds { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 1
  store i32 5, i32* %var_dec, align 4
  %malloccall = tail call i8* @malloc(i32 28)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 6
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %0 = zext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %0
  store i32 4, i32* %Element, align 4
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall4 to i32*
  store i32 7, i32* %array_info, align 4
  %array_info5 = getelementptr i8, i8* %malloccall4, i64 8
  %1 = bitcast i8* %array_info5 to i8**
  store i8* %malloccall, i8** %1, align 8
  %var_dec6 = getelementptr inbounds { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 2
  %2 = bitcast { i32, i32* }** %var_dec6 to i8**
  store i8* %malloccall4, i8** %2, align 8
  %3 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 0)
  call void @assert_equal_int(i32 %3, i32 18)
  %4 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 -5)
  call void @assert_equal_int(i32 %4, i32 13)
  %5 = call i32 @nested_function({ i32, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 -18)
  call void @assert_equal_int(i32 %5, i32 0)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define i32 @nested_function({ i32, i32, { i32, i32* }* }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32, i32, { i32, i32* }* }*, i32, i32 }, align 8
  %arg_address = getelementptr inbounds { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i64 0, i32 0
  store { i32, i32, { i32, i32* }* }* %0, { i32, i32, { i32, i32* }* }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i64 0, i32 2
  store i32 %1, i32* %arg_address1, align 4
  %var_dec = getelementptr inbounds { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %frame_pointer, i64 0, i32 1
  store i32 6, i32* %var_dec, align 8
  %arr = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %0, i64 0, i32 2
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %2 = bitcast { i32, i32* }* %load_left to i8*
  tail call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i64 0, i64 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr, align 8
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 2
  store i32 7, i32* %arr_ele_addr, align 4
  %3 = call i32 @f({ { i32, i32, { i32, i32* }* }*, i32, i32 }* nonnull %frame_pointer)
  ret i32 %3
}

define i32 @f({ { i32, i32, { i32, i32* }* }*, i32, i32 }* nocapture readonly) local_unnamed_addr gc "ocaml" {
entry:
  %fp_addr_in_sl1 = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %0, i64 0, i32 0
  %fp_addr2 = load { i32, i32, { i32, i32* }* }*, { i32, i32, { i32, i32* }* }** %fp_addr_in_sl1, align 8
  %a = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %fp_addr2, i64 0, i32 1
  %a3 = load i32, i32* %a, align 4
  %b = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %0, i64 0, i32 1
  %b6 = load i32, i32* %b, align 4
  %add_tmp = add i32 %b6, %a3
  %arr = getelementptr { i32, i32, { i32, i32* }* }, { i32, i32, { i32, i32* }* }* %fp_addr2, i64 0, i32 2
  %arr11 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %1 = bitcast { i32, i32* }* %arr11 to i8*
  tail call void @tig_check_array_bound(i8* %1, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @0, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr11, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 2
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  %add_tmp12 = add i32 %add_tmp, %arr_ele
  %d = getelementptr { { i32, i32, { i32, i32* }* }*, i32, i32 }, { { i32, i32, { i32, i32* }* }*, i32, i32 }* %0, i64 0, i32 2
  %d15 = load i32, i32* %d, align 4
  %add_tmp16 = add i32 %add_tmp12, %d15
  ret i32 %add_tmp16
}

attributes #0 = { nounwind }
