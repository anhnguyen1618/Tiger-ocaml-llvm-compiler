; ModuleID = 'llvm_byte_code/test/static_func.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"hello world\00"
@1 = private unnamed_addr constant [51 x i8] c"test/static_func.tig::15.8: Nil pointer exception!\00"
@2 = private unnamed_addr constant [51 x i8] c"test/static_func.tig::16.8: Nil pointer exception!\00"
@3 = private unnamed_addr constant [48 x i8] c"test/static_func.tig::16.43: Array out of bound\00"
@4 = private unnamed_addr constant [52 x i8] c"test/static_func.tig::23.13: Nil pointer exception!\00"
@5 = private unnamed_addr constant [52 x i8] c"test/static_func.tig::24.10: Nil pointer exception!\00"
@6 = private unnamed_addr constant [52 x i8] c"test/static_func.tig::26.15: Nil pointer exception!\00"
@7 = private unnamed_addr constant [52 x i8] c"test/static_func.tig::27.18: Nil pointer exception!\00"
@8 = private unnamed_addr constant [8 x i8] c"foo bar\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32, { i32, i32* }*, { i32, i8* }* }, align 8
  %malloccall = tail call i8* @malloc(i32 20)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 4
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %0 = zext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %0
  store i32 9, i32* %Element, align 4
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall3 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall3 to i32*
  store i32 5, i32* %array_info, align 4
  %array_info4 = getelementptr i8, i8* %malloccall3, i64 8
  %1 = bitcast i8* %array_info4 to i8**
  store i8* %malloccall, i8** %1, align 8
  %arr1 = getelementptr inbounds { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i64 0, i32 1
  %2 = bitcast { i32, i32* }** %arr1 to i8**
  store i8* %malloccall3, i8** %2, align 8
  %malloccall5 = tail call i8* @malloc(i32 16)
  %Element6 = bitcast i8* %malloccall5 to i32*
  store i32 0, i32* %Element6, align 4
  %Element7 = getelementptr i8, i8* %malloccall5, i64 8
  %3 = bitcast i8* %Element7 to i8**
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i64 0, i64 0), i8** %3, align 8
  %rec = getelementptr inbounds { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i64 0, i32 2
  %4 = bitcast { i32, i8* }** %rec to i8**
  store i8* %malloccall5, i8** %4, align 8
  call void @f({ i32, { i32, i32* }*, { i32, i8* }* }* nonnull %frame_pointer, i32 1, i32 undef, i32 3, i32 4)
  %rec9 = load { i32, i8* }*, { i32, i8* }** %rec, align 8
  %5 = bitcast { i32, i8* }* %rec9 to i8*
  call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @4, i64 0, i64 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %rec9, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  call void @tig_print_int(i32 %field_var)
  %rec11 = load { i32, i8* }*, { i32, i8* }** %rec, align 8
  %6 = bitcast { i32, i8* }* %rec11 to i8*
  call void @tig_check_null_pointer(i8* %6, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @5, i64 0, i64 0))
  %element12 = getelementptr { i32, i8* }, { i32, i8* }* %rec11, i64 0, i32 1
  %field_var13 = load i8*, i8** %element12, align 8
  call void @tig_print(i8* %field_var13)
  %rec15 = load { i32, i8* }*, { i32, i8* }** %rec, align 8
  %7 = bitcast { i32, i8* }* %rec15 to i8*
  call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i64 0, i64 0))
  %element16 = getelementptr { i32, i8* }, { i32, i8* }* %rec15, i64 0, i32 0
  %field_var17 = load i32, i32* %element16, align 4
  call void @assert_equal_int(i32 %field_var17, i32 28)
  %rec19 = load { i32, i8* }*, { i32, i8* }** %rec, align 8
  %8 = bitcast { i32, i8* }* %rec19 to i8*
  call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i64 0, i64 0))
  %element20 = getelementptr { i32, i8* }, { i32, i8* }* %rec19, i64 0, i32 1
  %field_var21 = load i8*, i8** %element20, align 8
  call void @assert_equal_string(i8* %field_var21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define void @f({ i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, align 8
  %arg_address = getelementptr inbounds { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i64 0, i32 0
  store { i32, { i32, i32* }*, { i32, i8* }* }* %0, { i32, { i32, i32* }*, { i32, i8* }* }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i64 0, i32 2
  store i32 %1, i32* %arg_address1, align 4
  %arg_address2 = getelementptr inbounds { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i64 0, i32 3
  store i32 %3, i32* %arg_address2, align 8
  %arg_address3 = getelementptr inbounds { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i64 0, i32 4
  store i32 %4, i32* %arg_address3, align 4
  %var_dec = getelementptr inbounds { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i64 0, i32 1
  store i32 7, i32* %var_dec, align 8
  call void @g({ { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* nonnull %frame_pointer, i32 4)
  ret void
}

define void @g({ { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* nocapture readonly, i32) local_unnamed_addr gc "ocaml" {
entry:
  %a = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, i64 0, i32 2
  %a1 = load i32, i32* %a, align 4
  tail call void @tig_print_int(i32 %a1)
  tail call void @tig_print_int(i32 %1)
  %c = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, i64 0, i32 3
  %c5 = load i32, i32* %c, align 4
  tail call void @tig_print_int(i32 %c5)
  %d = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, i64 0, i32 4
  %d8 = load i32, i32* %d, align 4
  tail call void @tig_print_int(i32 %d8)
  %fp_addr_in_sl11 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, i64 0, i32 0
  %fp_addr12 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl11, align 8
  %rec = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr12, i64 0, i32 2
  %load_left = load { i32, i8* }*, { i32, i8* }** %rec, align 8
  %2 = bitcast { i32, i8* }* %load_left to i8*
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @1, i64 0, i64 0))
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %load_left, i64 0, i32 1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i64 0, i64 0), i8** %element_left, align 8
  %fp_addr16 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl11, align 8
  %rec17 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr16, i64 0, i32 2
  %load_left18 = load { i32, i8* }*, { i32, i8* }** %rec17, align 8
  %3 = bitcast { i32, i8* }* %load_left18 to i8*
  tail call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @2, i64 0, i64 0))
  %element_left19 = getelementptr { i32, i8* }, { i32, i8* }* %load_left18, i64 0, i32 0
  %a23 = load i32, i32* %a, align 4
  %add_tmp = add i32 %a23, %1
  %c28 = load i32, i32* %c, align 4
  %add_tmp29 = add i32 %add_tmp, %c28
  %d33 = load i32, i32* %d, align 4
  %add_tmp34 = add i32 %add_tmp29, %d33
  %e = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, i64 0, i32 1
  %e37 = load i32, i32* %e, align 4
  %add_tmp38 = add i32 %add_tmp34, %e37
  %fp_addr42 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl11, align 8
  %arr1 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr42, i64 0, i32 1
  %arr143 = load { i32, i32* }*, { i32, i32* }** %arr1, align 8
  %4 = bitcast { i32, i32* }* %arr143 to i8*
  tail call void @tig_check_array_bound(i8* %4, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @3, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr143, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 4
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  %add_tmp44 = add i32 %add_tmp38, %arr_ele
  store i32 %add_tmp44, i32* %element_left19, align 4
  ret void
}

attributes #0 = { nounwind }
