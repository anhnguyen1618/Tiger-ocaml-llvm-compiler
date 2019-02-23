; ModuleID = 'llvm_byte_code/test/quick_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [46 x i8] c"test/quick_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::24.36: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::25.47: Array out of bound\00"
@7 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::29.46: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::30.48: Array out of bound\00"
@9 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::34.35: Array out of bound\00"
@10 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::35.35: Array out of bound\00"
@11 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::39.43: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::40.23: Array out of bound\00"
@13 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::41.23: Array out of bound\00"
@14 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::64.41: Array out of bound\00"
@15 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@16 = private unnamed_addr constant [15 x i8] c"==============\00"
@17 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@18 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::78.23: Array out of bound\00"
@19 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::79.23: Array out of bound\00"
@20 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::80.23: Array out of bound\00"
@21 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::81.23: Array out of bound\00"
@22 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::82.23: Array out of bound\00"
@23 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::86.23: Array out of bound\00"
@24 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::87.23: Array out of bound\00"
@25 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::88.23: Array out of bound\00"
@26 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::89.23: Array out of bound\00"
@27 = private unnamed_addr constant [47 x i8] c"test/quick_sort.tig::90.23: Array out of bound\00"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @print_arr_int_ele(i32) local_unnamed_addr gc "ocaml"

declare i32 @tig_array_length(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_random(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }, align 8
  %0 = tail call { i32, i32* }* @create_array({ i32 }* undef)
  %1 = tail call { i32, i32* }* @create_array_test({ i32 }* undef)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @15, i64 0, i64 0))
  tail call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i64 0, i64 0))
  call void @quick_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @17, i64 0, i64 0))
  call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @18, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele = load i32, i32* %arr_addr, align 4
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @19, i64 0, i64 0))
  %arr_addr7 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i64 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8, align 4
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @20, i64 0, i64 0))
  %arr_addr12 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i64 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13, align 4
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @21, i64 0, i64 0))
  %arr_addr17 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i64 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18, align 4
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @22, i64 0, i64 0))
  %arr_addr22 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i64 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23, align 4
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @quick_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %1)
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @23, i64 0, i64 0))
  %arr_addr28 = load i32*, i32** %array_pointer, align 8
  %arr_ele30 = load i32, i32* %arr_addr28, align 4
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @24, i64 0, i64 0))
  %arr_addr33 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i64 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34, align 4
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @25, i64 0, i64 0))
  %arr_addr38 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i64 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39, align 4
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @26, i64 0, i64 0))
  %arr_addr43 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i64 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44, align 4
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @27, i64 0, i64 0))
  %arr_addr48 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr49 = getelementptr i32, i32* %arr_addr48, i64 4
  %arr_ele50 = load i32, i32* %arr_ele_addr49, align 4
  call void @assert_equal_int(i32 %arr_ele50, i32 4)
  ret i32 0
}

define void @print_array({ i32 }* nocapture readnone, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  tail call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i64 0, i64 0))
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = tail call i32 @tig_array_length(i8* %2)
  %4 = tail call i32 @tig_array_length(i8* %2)
  %minus_tmp3 = add i32 %4, -1
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %ge_tmp = icmp slt i32 %minus_tmp3, %i.0
  br i1 %ge_tmp, label %end, label %loop

loop:                                             ; preds = %test
  tail call void @tig_check_array_bound(i8* %2, i32 %i.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @1, i64 0, i64 0))
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %5 = sext i32 %i.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %5
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  tail call void @print_arr_int_ele(i32 %arr_ele)
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  tail call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i64 0, i64 0))
  tail call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i64 0, i64 0))
  ret void
}

define { i32, i32* }* @create_array({ i32 }* nocapture readnone) local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 32)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 7
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %1 = zext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %1
  store i32 1, i32* %Element, align 4
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall4 to i32*
  store i32 8, i32* %array_info, align 4
  %array_info5 = getelementptr i8, i8* %malloccall4, i64 8
  %2 = bitcast i8* %array_info5 to i32**
  %3 = bitcast i8* %array_info5 to i8**
  store i8* %malloccall, i8** %3, align 8
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp19, %loop11 ]
  %ge_tmp = icmp ugt i32 %i7.0, 7
  br i1 %ge_tmp, label %end12, label %loop11

loop11:                                           ; preds = %test10
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @4, i64 0, i64 0))
  %arr_addr = load i32*, i32** %2, align 8
  %4 = zext i32 %i7.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %4
  %5 = tail call i32 @tig_random(i32 50)
  store i32 %5, i32* %arr_ele_addr, align 4
  %add_tmp19 = add nuw nsw i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  ret { i32, i32* }* %array_wrapper
}

define void @quick_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }*, { i32, i32* }* }, align 8
  %arg_address = getelementptr inbounds { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %frame_pointer, i64 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %frame_pointer, i64 0, i32 1
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1, align 8
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = tail call i32 @tig_array_length(i8* %2)
  %minus_tmp = add i32 %3, -1
  call void @sort({ { i32 }*, { i32, i32* }* }* nonnull %frame_pointer, i32 0, i32 %minus_tmp)
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define i32 @partition({ { i32 }*, { i32, i32* }* }* nocapture readonly, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %arr = getelementptr { { i32 }*, { i32, i32* }* }, { { i32 }*, { i32, i32* }* }* %0, i64 0, i32 1
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %3 = bitcast { i32, i32* }* %arr2 to i8*
  tail call void @tig_check_array_bound(i8* %3, i32 %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr2, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %4 = sext i32 %2 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %4
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  %5 = bitcast { i32, i32* }** %arr to i8**
  %arr717 = load i8*, i8** %5, align 8
  tail call void @tig_check_array_bound(i8* %arr717, i32 %1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i64 0, i64 0))
  %minus_tmp17 = add i32 %2, -1
  br label %test

test:                                             ; preds = %merge, %entry
  %wall_index.0 = phi i32 [ %1, %entry ], [ %wall_index.1, %merge ]
  %i.0 = phi i32 [ %1, %entry ], [ %add_tmp61, %merge ]
  %ge_tmp = icmp slt i32 %minus_tmp17, %i.0
  %arr65 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %6 = bitcast { i32, i32* }* %arr65 to i8*
  br i1 %ge_tmp, label %end, label %loop

loop:                                             ; preds = %test
  tail call void @tig_check_array_bound(i8* %6, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i64 0, i64 0))
  %array_pointer25 = getelementptr { i32, i32* }, { i32, i32* }* %arr65, i64 0, i32 1
  %arr_addr26 = load i32*, i32** %array_pointer25, align 8
  %7 = sext i32 %i.0 to i64
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i64 %7
  %arr_ele28 = load i32, i32* %arr_ele_addr27, align 4
  %arr32 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %8 = bitcast { i32, i32* }* %arr32 to i8*
  tail call void @tig_check_array_bound(i8* %8, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i64 0, i64 0))
  %lt_tmp = icmp slt i32 %arr_ele28, %arr_ele
  br i1 %lt_tmp, label %then, label %merge

end:                                              ; preds = %test
  %9 = bitcast { i32, i32* }* %arr65 to i8*
  tail call void @tig_check_array_bound(i8* %9, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i64 0, i64 0))
  %array_pointer67 = getelementptr { i32, i32* }, { i32, i32* }* %arr65, i64 0, i32 1
  %arr_addr68 = load i32*, i32** %array_pointer67, align 8
  %10 = sext i32 %wall_index.0 to i64
  %arr_ele_addr69 = getelementptr i32, i32* %arr_addr68, i64 %10
  %arr_ele70 = load i32, i32* %arr_ele_addr69, align 4
  %load_left75 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %11 = bitcast { i32, i32* }* %load_left75 to i8*
  tail call void @tig_check_array_bound(i8* %11, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i64 0, i64 0))
  %array_addr_ptr76 = getelementptr { i32, i32* }, { i32, i32* }* %load_left75, i64 0, i32 1
  %arr_addr77 = load i32*, i32** %array_addr_ptr76, align 8
  %arr_ele_addr78 = getelementptr i32, i32* %arr_addr77, i64 %10
  store i32 %arr_ele, i32* %arr_ele_addr78, align 4
  %load_left84 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %12 = bitcast { i32, i32* }* %load_left84 to i8*
  tail call void @tig_check_array_bound(i8* %12, i32 %2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i64 0, i64 0))
  %array_addr_ptr85 = getelementptr { i32, i32* }, { i32, i32* }* %load_left84, i64 0, i32 1
  %arr_addr86 = load i32*, i32** %array_addr_ptr85, align 8
  %arr_ele_addr87 = getelementptr i32, i32* %arr_addr86, i64 %4
  store i32 %arr_ele70, i32* %arr_ele_addr87, align 4
  ret i32 %wall_index.0

then:                                             ; preds = %loop
  %array_pointer34 = getelementptr { i32, i32* }, { i32, i32* }* %arr32, i64 0, i32 1
  %arr_addr35 = load i32*, i32** %array_pointer34, align 8
  %13 = sext i32 %wall_index.0 to i64
  %arr_ele_addr36 = getelementptr i32, i32* %arr_addr35, i64 %13
  %arr_ele37 = load i32, i32* %arr_ele_addr36, align 4
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %14 = bitcast { i32, i32* }* %load_left to i8*
  tail call void @tig_check_array_bound(i8* %14, i32 %wall_index.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i64 0, i64 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i64 0, i32 1
  %arr_addr47 = load i32*, i32** %array_addr_ptr, align 8
  %arr_ele_addr48 = getelementptr i32, i32* %arr_addr47, i64 %13
  store i32 %arr_ele28, i32* %arr_ele_addr48, align 4
  %load_left54 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %15 = bitcast { i32, i32* }* %load_left54 to i8*
  tail call void @tig_check_array_bound(i8* %15, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i64 0, i64 0))
  %array_addr_ptr55 = getelementptr { i32, i32* }, { i32, i32* }* %load_left54, i64 0, i32 1
  %arr_addr56 = load i32*, i32** %array_addr_ptr55, align 8
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i64 %7
  store i32 %arr_ele37, i32* %arr_ele_addr57, align 4
  %add_tmp = add i32 %wall_index.0, 1
  br label %merge

merge:                                            ; preds = %loop, %then
  %wall_index.1 = phi i32 [ %add_tmp, %then ], [ %wall_index.0, %loop ]
  %add_tmp61 = add i32 %i.0, 1
  br label %test
}

define void @sort({ { i32 }*, { i32, i32* }* }* readonly, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  br label %tailrecurse

tailrecurse:                                      ; preds = %then, %entry
  %.tr6 = phi i32 [ %1, %entry ], [ %add_tmp, %then ]
  %lt_tmp = icmp slt i32 %.tr6, %2
  br i1 %lt_tmp, label %then, label %merge

then:                                             ; preds = %tailrecurse
  %3 = tail call i32 @partition({ { i32 }*, { i32, i32* }* }* %0, i32 %.tr6, i32 %2)
  %minus_tmp = add i32 %3, -1
  tail call void @sort({ { i32 }*, { i32, i32* }* }* %0, i32 %.tr6, i32 %minus_tmp)
  %add_tmp = add i32 %3, 1
  br label %tailrecurse

merge:                                            ; preds = %tailrecurse
  ret void
}

define { i32, i32* }* @create_array_test({ i32 }* nocapture readnone) local_unnamed_addr gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 20)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp ugt i32 %i.0, 4
  br i1 %lt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %1 = zext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %1
  store i32 1, i32* %Element, align 4
  %add_tmp = add nuw nsw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall4 to i32*
  store i32 5, i32* %array_info, align 4
  %array_info5 = getelementptr i8, i8* %malloccall4, i64 8
  %2 = bitcast i8* %array_info5 to i32**
  %3 = bitcast i8* %array_info5 to i8**
  store i8* %malloccall, i8** %3, align 8
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp23, %loop11 ]
  %ge_tmp = icmp ugt i32 %i7.0, 4
  br i1 %ge_tmp, label %end12, label %loop11

loop11:                                           ; preds = %test10
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i64 0, i64 0))
  %arr_addr = load i32*, i32** %2, align 8
  %4 = zext i32 %i7.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %4
  %minus_tmp21 = sub nsw i32 4, %i7.0
  store i32 %minus_tmp21, i32* %arr_ele_addr, align 4
  %add_tmp23 = add nuw nsw i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  ret { i32, i32* }* %array_wrapper
}

attributes #0 = { nounwind }
