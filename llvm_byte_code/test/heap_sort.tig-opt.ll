; ModuleID = 'llvm_byte_code/test/heap_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [45 x i8] c"test/heap_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::36.37: Array out of bound\00"
@6 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::37.37: Array out of bound\00"
@7 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::39.23: Array out of bound\00"
@8 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::40.23: Array out of bound\00"
@9 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::45.38: Array out of bound\00"
@10 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::50.47: Array out of bound\00"
@11 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::51.40: Array out of bound\00"
@12 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::53.46: Array out of bound\00"
@13 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::54.40: Array out of bound\00"
@14 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::56.37: Array out of bound\00"
@15 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::80.41: Array out of bound\00"
@16 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@17 = private unnamed_addr constant [15 x i8] c"==============\00"
@18 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@19 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::94.23: Array out of bound\00"
@20 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::95.23: Array out of bound\00"
@21 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::96.23: Array out of bound\00"
@22 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::97.23: Array out of bound\00"
@23 = private unnamed_addr constant [46 x i8] c"test/heap_sort.tig::98.23: Array out of bound\00"
@24 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::102.23: Array out of bound\00"
@25 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::103.23: Array out of bound\00"
@26 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::104.23: Array out of bound\00"
@27 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::105.23: Array out of bound\00"
@28 = private unnamed_addr constant [47 x i8] c"test/heap_sort.tig::106.23: Array out of bound\00"

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
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i64 0, i64 0))
  tail call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @17, i64 0, i64 0))
  call void @heap_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i64 0, i64 0))
  call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @19, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele = load i32, i32* %arr_addr, align 4
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @20, i64 0, i64 0))
  %arr_addr7 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i64 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8, align 4
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @21, i64 0, i64 0))
  %arr_addr12 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i64 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13, align 4
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @22, i64 0, i64 0))
  %arr_addr17 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i64 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18, align 4
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @23, i64 0, i64 0))
  %arr_addr22 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i64 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23, align 4
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @heap_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %1)
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @24, i64 0, i64 0))
  %arr_addr28 = load i32*, i32** %array_pointer, align 8
  %arr_ele30 = load i32, i32* %arr_addr28, align 4
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @25, i64 0, i64 0))
  %arr_addr33 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i64 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34, align 4
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @26, i64 0, i64 0))
  %arr_addr38 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i64 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39, align 4
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @27, i64 0, i64 0))
  %arr_addr43 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i64 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44, align 4
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @28, i64 0, i64 0))
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
  tail call void @tig_check_array_bound(i8* %2, i32 %i.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @1, i64 0, i64 0))
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
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @4, i64 0, i64 0))
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

define void @heap_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }*, i32, { i32, i32* }* }, align 8
  %arg_address = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 2
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1, align 8
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = tail call i32 @tig_array_length(i8* %2)
  %var_dec = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 1
  store i32 %3, i32* %var_dec, align 8
  call void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer)
  %minus_tmp = add i32 %3, -1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 0, i32 %minus_tmp)
  br label %test

test:                                             ; preds = %loop, %entry
  %size.0 = phi i32 [ %minus_tmp, %entry ], [ %minus_tmp11, %loop ]
  %gt_tmp = icmp slt i32 %size.0, 2
  br i1 %gt_tmp, label %end, label %loop

loop:                                             ; preds = %test
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 0, i32 %size.0)
  %minus_tmp11 = add i32 %size.0, -1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer, i32 0, i32 %minus_tmp11)
  br label %test

end:                                              ; preds = %test
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }* nocapture readonly) local_unnamed_addr gc "ocaml" {
entry:
  %arr_size = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 1
  %arr_size1 = load i32, i32* %arr_size, align 4
  %minus_tmp = add i32 %arr_size1, -1
  %div_tmp = sdiv i32 %minus_tmp, 2
  br label %test

test:                                             ; preds = %loop, %entry
  %index.0 = phi i32 [ %div_tmp, %entry ], [ %minus_tmp11, %loop ]
  %cond = icmp slt i32 %index.0, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %arr_size7 = load i32, i32* %arr_size, align 4
  tail call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* nonnull %0, i32 %index.0, i32 %arr_size7)
  %minus_tmp11 = add nsw i32 %index.0, -1
  br label %test

end:                                              ; preds = %test
  ret void
}

define void @swap({ { i32 }*, i32, { i32, i32* }* }* nocapture readonly, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  tail call void @tig_check_array_bound(i8* %3, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @5, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %4 = sext i32 %1 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %4
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %5 = bitcast { i32, i32* }* %arr6 to i8*
  tail call void @tig_check_array_bound(i8* %5, i32 %2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @6, i64 0, i64 0))
  %array_pointer8 = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i64 0, i32 1
  %arr_addr9 = load i32*, i32** %array_pointer8, align 8
  %6 = sext i32 %2 to i64
  %arr_ele_addr10 = getelementptr i32, i32* %arr_addr9, i64 %6
  %arr_ele11 = load i32, i32* %arr_ele_addr10, align 4
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %7 = bitcast { i32, i32* }* %load_left to i8*
  tail call void @tig_check_array_bound(i8* %7, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @7, i64 0, i64 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i64 0, i32 1
  %arr_addr16 = load i32*, i32** %array_addr_ptr, align 8
  %arr_ele_addr17 = getelementptr i32, i32* %arr_addr16, i64 %4
  store i32 %arr_ele11, i32* %arr_ele_addr17, align 4
  %load_left23 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %8 = bitcast { i32, i32* }* %load_left23 to i8*
  tail call void @tig_check_array_bound(i8* %8, i32 %2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @8, i64 0, i64 0))
  %array_addr_ptr24 = getelementptr { i32, i32* }, { i32, i32* }* %load_left23, i64 0, i32 1
  %arr_addr25 = load i32*, i32** %array_addr_ptr24, align 8
  %arr_ele_addr26 = getelementptr i32, i32* %arr_addr25, i64 %6
  store i32 %arr_ele, i32* %arr_ele_addr26, align 4
  ret void
}

define void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* nocapture readonly, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 2
  br label %tailrecurse

tailrecurse:                                      ; preds = %then79, %entry
  %.tr17 = phi i32 [ %1, %entry ], [ %index_largest.1, %then79 ]
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  tail call void @tig_check_array_bound(i8* %3, i32 %.tr17, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @9, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %4 = sext i32 %.tr17 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %4
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  %mul_tmp = shl i32 %.tr17, 1
  %add_tmp = or i32 %mul_tmp, 1
  %add_tmp7 = add i32 %mul_tmp, 2
  %lt_tmp = icmp slt i32 %add_tmp7, %2
  br i1 %lt_tmp, label %then9, label %merge

then:                                             ; preds = %then9
  %arr29 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %5 = bitcast { i32, i32* }* %arr29 to i8*
  tail call void @tig_check_array_bound(i8* %5, i32 %add_tmp7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @11, i64 0, i64 0))
  %array_pointer31 = getelementptr { i32, i32* }, { i32, i32* }* %arr29, i64 0, i32 1
  %arr_addr32 = load i32*, i32** %array_pointer31, align 8
  %arr_ele_addr33 = getelementptr i32, i32* %arr_addr32, i64 %7
  %arr_ele34 = load i32, i32* %arr_ele_addr33, align 4
  br label %merge

merge:                                            ; preds = %then9, %tailrecurse, %then
  %index_largest.0 = phi i32 [ %add_tmp7, %then ], [ %.tr17, %then9 ], [ %.tr17, %tailrecurse ]
  %largest.0 = phi i32 [ %arr_ele34, %then ], [ %arr_ele, %then9 ], [ %arr_ele, %tailrecurse ]
  %lt_tmp48 = icmp slt i32 %add_tmp, %2
  br i1 %lt_tmp48, label %then43, label %merge41

then9:                                            ; preds = %tailrecurse
  %arr17 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %6 = bitcast { i32, i32* }* %arr17 to i8*
  tail call void @tig_check_array_bound(i8* %6, i32 %add_tmp7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @10, i64 0, i64 0))
  %array_pointer19 = getelementptr { i32, i32* }, { i32, i32* }* %arr17, i64 0, i32 1
  %arr_addr20 = load i32*, i32** %array_pointer19, align 8
  %7 = sext i32 %add_tmp7 to i64
  %arr_ele_addr21 = getelementptr i32, i32* %arr_addr20, i64 %7
  %arr_ele22 = load i32, i32* %arr_ele_addr21, align 4
  %gt_tmp = icmp sgt i32 %arr_ele22, %arr_ele
  br i1 %gt_tmp, label %then, label %merge

then39:                                           ; preds = %then43
  %arr69 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %8 = bitcast { i32, i32* }* %arr69 to i8*
  tail call void @tig_check_array_bound(i8* %8, i32 %add_tmp, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @13, i64 0, i64 0))
  %array_pointer71 = getelementptr { i32, i32* }, { i32, i32* }* %arr69, i64 0, i32 1
  %arr_addr72 = load i32*, i32** %array_pointer71, align 8
  %arr_ele_addr73 = getelementptr i32, i32* %arr_addr72, i64 %11
  %arr_ele74 = load i32, i32* %arr_ele_addr73, align 4
  br label %merge41

merge41:                                          ; preds = %then43, %merge, %then39
  %index_largest.1 = phi i32 [ %add_tmp, %then39 ], [ %index_largest.0, %then43 ], [ %index_largest.0, %merge ]
  %largest.1 = phi i32 [ %arr_ele74, %then39 ], [ %largest.0, %then43 ], [ %largest.0, %merge ]
  %arr86 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %9 = bitcast { i32, i32* }* %arr86 to i8*
  tail call void @tig_check_array_bound(i8* %9, i32 %.tr17, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @14, i64 0, i64 0))
  %array_pointer88 = getelementptr { i32, i32* }, { i32, i32* }* %arr86, i64 0, i32 1
  %arr_addr89 = load i32*, i32** %array_pointer88, align 8
  %arr_ele_addr90 = getelementptr i32, i32* %arr_addr89, i64 %4
  %arr_ele91 = load i32, i32* %arr_ele_addr90, align 4
  %neq_tmp = icmp eq i32 %largest.1, %arr_ele91
  br i1 %neq_tmp, label %merge81, label %then79

then43:                                           ; preds = %merge
  %arr54 = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %10 = bitcast { i32, i32* }* %arr54 to i8*
  tail call void @tig_check_array_bound(i8* %10, i32 %add_tmp, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @12, i64 0, i64 0))
  %array_pointer56 = getelementptr { i32, i32* }, { i32, i32* }* %arr54, i64 0, i32 1
  %arr_addr57 = load i32*, i32** %array_pointer56, align 8
  %11 = sext i32 %add_tmp to i64
  %arr_ele_addr58 = getelementptr i32, i32* %arr_addr57, i64 %11
  %arr_ele59 = load i32, i32* %arr_ele_addr58, align 4
  %gt_tmp61 = icmp sgt i32 %arr_ele59, %largest.0
  br i1 %gt_tmp61, label %then39, label %merge41

then79:                                           ; preds = %merge41
  tail call void @swap({ { i32 }*, i32, { i32, i32* }* }* nonnull %0, i32 %.tr17, i32 %index_largest.1)
  br label %tailrecurse

merge81:                                          ; preds = %merge41
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
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @15, i64 0, i64 0))
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
