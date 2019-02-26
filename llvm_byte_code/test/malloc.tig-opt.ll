; ModuleID = 'llvm_byte_code/test/malloc.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [42 x i8] c"test/malloc.tig::11.6: Array out of bound\00"
@1 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::17.14: Array out of bound\00"
@2 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::17.17: Nil pointer exception!\00"
@3 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::18.15: Array out of bound\00"
@4 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::18.18: Nil pointer exception!\00"
@5 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::20.12: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::20.15: Nil pointer exception!\00"
@7 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::21.13: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::21.16: Nil pointer exception!\00"
@9 = private unnamed_addr constant [42 x i8] c"test/malloc.tig::23.4: Array out of bound\00"
@10 = private unnamed_addr constant [46 x i8] c"test/malloc.tig::23.7: Nil pointer exception!\00"
@11 = private unnamed_addr constant [43 x i8] c"test/malloc.tig::24.13: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/malloc.tig::24.16: Nil pointer exception!\00"

declare void @tig_print_int(i32) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32, { i32, { i32 }** }* }, align 8
  %malloccall = tail call i8* @malloc(i32 4)
  %Element = bitcast i8* %malloccall to i32*
  store i32 5, i32* %Element, align 4
  %malloccall2 = tail call i8* @malloc(i32 16)
  %array_init = bitcast i8* %malloccall2 to { i32 }**
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 1
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %0 = zext i32 %i.0 to i64
  %Element5 = getelementptr { i32 }*, { i32 }** %array_init, i64 %0
  %1 = bitcast { i32 }** %Element5 to i8**
  store i8* %malloccall, i8** %1, align 8
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall6 to i32*
  store i32 2, i32* %array_info, align 4
  %array_info7 = getelementptr i8, i8* %malloccall6, i64 8
  %2 = bitcast i8* %array_info7 to i8**
  store i8* %malloccall2, i8** %2, align 8
  %var_dec = getelementptr inbounds { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %frame_pointer, i64 0, i32 1
  %3 = bitcast { i32, { i32 }** }** %var_dec to i8**
  store i8* %malloccall6, i8** %3, align 8
  %4 = call { i32, { i32 }** }* @create_rec({ i32, { i32, { i32 }** }* }* nonnull %frame_pointer)
  tail call void @tig_check_array_bound(i8* %malloccall6, i32 0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @1, i64 0, i64 0))
  %5 = bitcast i8* %array_info7 to { i32 }***
  %arr_addr = load { i32 }**, { i32 }*** %5, align 8
  %arr_ele = load { i32 }*, { i32 }** %arr_addr, align 8
  %6 = bitcast { i32 }* %arr_ele to i8*
  tail call void @tig_check_null_pointer(i8* %6, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @2, i64 0, i64 0))
  %element = getelementptr { i32 }, { i32 }* %arr_ele, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  tail call void @tig_print_int(i32 %field_var)
  tail call void @tig_check_array_bound(i8* %malloccall6, i32 0, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @3, i64 0, i64 0))
  %arr_addr12 = load { i32 }**, { i32 }*** %5, align 8
  %arr_ele14 = load { i32 }*, { i32 }** %arr_addr12, align 8
  %7 = bitcast { i32 }* %arr_ele14 to i8*
  tail call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i64 0, i64 0))
  %element15 = getelementptr { i32 }, { i32 }* %arr_ele14, i64 0, i32 0
  %field_var16 = load i32, i32* %element15, align 4
  tail call void @assert_equal_int(i32 %field_var16, i32 5)
  %8 = bitcast { i32, { i32 }** }* %4 to i8*
  tail call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @5, i64 0, i64 0))
  %array_pointer18 = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %4, i64 0, i32 1
  %arr_addr19 = load { i32 }**, { i32 }*** %array_pointer18, align 8
  %arr_ele_addr20 = getelementptr { i32 }*, { i32 }** %arr_addr19, i64 1
  %arr_ele21 = load { i32 }*, { i32 }** %arr_ele_addr20, align 8
  %9 = bitcast { i32 }* %arr_ele21 to i8*
  tail call void @tig_check_null_pointer(i8* %9, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i64 0, i64 0))
  %element22 = getelementptr { i32 }, { i32 }* %arr_ele21, i64 0, i32 0
  %field_var23 = load i32, i32* %element22, align 4
  tail call void @tig_print_int(i32 %field_var23)
  tail call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @7, i64 0, i64 0))
  %arr_addr26 = load { i32 }**, { i32 }*** %array_pointer18, align 8
  %arr_ele_addr27 = getelementptr { i32 }*, { i32 }** %arr_addr26, i64 1
  %arr_ele28 = load { i32 }*, { i32 }** %arr_ele_addr27, align 8
  %10 = bitcast { i32 }* %arr_ele28 to i8*
  tail call void @tig_check_null_pointer(i8* %10, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i64 0, i64 0))
  %element29 = getelementptr { i32 }, { i32 }* %arr_ele28, i64 0, i32 0
  %field_var30 = load i32, i32* %element29, align 4
  tail call void @assert_equal_int(i32 %field_var30, i32 6)
  tail call void @tig_check_array_bound(i8* %malloccall6, i32 1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @9, i64 0, i64 0))
  %arr_addr32 = load { i32 }**, { i32 }*** %5, align 8
  %arr_ele_addr33 = getelementptr { i32 }*, { i32 }** %arr_addr32, i64 1
  %load_left34 = load { i32 }*, { i32 }** %arr_ele_addr33, align 8
  %11 = bitcast { i32 }* %load_left34 to i8*
  tail call void @tig_check_null_pointer(i8* %11, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @10, i64 0, i64 0))
  %element_left = getelementptr { i32 }, { i32 }* %load_left34, i64 0, i32 0
  store i32 5, i32* %element_left, align 4
  tail call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @11, i64 0, i64 0))
  %arr_addr37 = load { i32 }**, { i32 }*** %array_pointer18, align 8
  %arr_ele_addr38 = getelementptr { i32 }*, { i32 }** %arr_addr37, i64 1
  %arr_ele39 = load { i32 }*, { i32 }** %arr_ele_addr38, align 8
  %12 = bitcast { i32 }* %arr_ele39 to i8*
  tail call void @tig_check_null_pointer(i8* %12, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i64 0, i64 0))
  %element40 = getelementptr { i32 }, { i32 }* %arr_ele39, i64 0, i32 0
  %field_var41 = load i32, i32* %element40, align 4
  tail call void @assert_equal_int(i32 %field_var41, i32 5)
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define { i32, { i32 }** }* @create_rec({ i32, { i32, { i32 }** }* }* nocapture readonly) local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 4)
  %Element = bitcast i8* %malloccall to i32*
  store i32 6, i32* %Element, align 4
  %arr = getelementptr { i32, { i32, { i32 }** }* }, { i32, { i32, { i32 }** }* }* %0, i64 0, i32 1
  %load_left = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr, align 8
  %1 = bitcast { i32, { i32 }** }* %load_left to i8*
  tail call void @tig_check_array_bound(i8* %1, i32 1, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @0, i64 0, i64 0))
  %array_addr_ptr = getelementptr { i32, { i32 }** }, { i32, { i32 }** }* %load_left, i64 0, i32 1
  %arr_addr = load { i32 }**, { i32 }*** %array_addr_ptr, align 8
  %arr_ele_addr = getelementptr { i32 }*, { i32 }** %arr_addr, i64 1
  %2 = bitcast { i32 }** %arr_ele_addr to i8**
  store i8* %malloccall, i8** %2, align 8
  %arr5 = load { i32, { i32 }** }*, { i32, { i32 }** }** %arr, align 8
  ret { i32, { i32 }** }* %arr5
}

attributes #0 = { nounwind }
