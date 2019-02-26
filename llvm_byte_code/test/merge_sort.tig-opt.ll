; ModuleID = 'llvm_byte_code/test/merge_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [46 x i8] c"test/merge_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::29.35: Array out of bound\00"
@6 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::29.45: Array out of bound\00"
@7 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::45.35: Array out of bound\00"
@8 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::45.50: Array out of bound\00"
@9 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::47.38: Array out of bound\00"
@10 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::47.66: Array out of bound\00"
@11 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::52.38: Array out of bound\00"
@12 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::52.67: Array out of bound\00"
@13 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::58.34: Array out of bound\00"
@14 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::58.62: Array out of bound\00"
@15 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::64.34: Array out of bound\00"
@16 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::64.63: Array out of bound\00"
@17 = private unnamed_addr constant [47 x i8] c"test/merge_sort.tig::89.41: Array out of bound\00"
@18 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@19 = private unnamed_addr constant [15 x i8] c"==============\00"
@20 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@21 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::103.23: Array out of bound\00"
@22 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::104.23: Array out of bound\00"
@23 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::105.23: Array out of bound\00"
@24 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::106.23: Array out of bound\00"
@25 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::107.23: Array out of bound\00"
@26 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::111.23: Array out of bound\00"
@27 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::112.23: Array out of bound\00"
@28 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::113.23: Array out of bound\00"
@29 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::114.23: Array out of bound\00"
@30 = private unnamed_addr constant [48 x i8] c"test/merge_sort.tig::115.23: Array out of bound\00"

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
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @18, i64 0, i64 0))
  tail call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @19, i64 0, i64 0))
  %2 = call { i32, i32* }* @merge_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @20, i64 0, i64 0))
  call void @print_array({ i32 }* undef, { i32, i32* }* %2)
  %3 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @21, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele = load i32, i32* %arr_addr, align 4
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  call void @tig_check_array_bound(i8* %3, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @22, i64 0, i64 0))
  %arr_addr7 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i64 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8, align 4
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  call void @tig_check_array_bound(i8* %3, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @23, i64 0, i64 0))
  %arr_addr12 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i64 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13, align 4
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  call void @tig_check_array_bound(i8* %3, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @24, i64 0, i64 0))
  %arr_addr17 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i64 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18, align 4
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  call void @tig_check_array_bound(i8* %3, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @25, i64 0, i64 0))
  %arr_addr22 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i64 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23, align 4
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  %4 = call { i32, i32* }* @merge_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %1)
  %5 = bitcast { i32, i32* }* %4 to i8*
  call void @tig_check_array_bound(i8* %5, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @26, i64 0, i64 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %4, i64 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27, align 8
  %arr_ele30 = load i32, i32* %arr_addr28, align 4
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  call void @tig_check_array_bound(i8* %5, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @27, i64 0, i64 0))
  %arr_addr33 = load i32*, i32** %array_pointer27, align 8
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i64 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34, align 4
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  call void @tig_check_array_bound(i8* %5, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @28, i64 0, i64 0))
  %arr_addr38 = load i32*, i32** %array_pointer27, align 8
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i64 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39, align 4
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  call void @tig_check_array_bound(i8* %5, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @29, i64 0, i64 0))
  %arr_addr43 = load i32*, i32** %array_pointer27, align 8
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i64 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44, align 4
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  call void @tig_check_array_bound(i8* %5, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @30, i64 0, i64 0))
  %arr_addr48 = load i32*, i32** %array_pointer27, align 8
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

define { i32, i32* }* @merge_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = tail call i32 @tig_array_length(i8* %2)
  %lt_tmp = icmp sgt i32 %3, 1
  br i1 %lt_tmp, label %else, label %merge

else:                                             ; preds = %entry
  %div_tmp4 = lshr i32 %3, 1
  %minus_tmp = add nsw i32 %div_tmp4, -1
  %4 = tail call { i32, i32* }* @sub_arr({ { i32 }* }* undef, { i32, i32* }* %1, i32 0, i32 %minus_tmp)
  %5 = tail call { i32, i32* }* @merge_sort({ i32 }* %0, { i32, i32* }* %4)
  %minus_tmp10 = add i32 %3, -1
  %6 = tail call { i32, i32* }* @sub_arr({ { i32 }* }* undef, { i32, i32* }* %1, i32 %div_tmp4, i32 %minus_tmp10)
  %7 = tail call { i32, i32* }* @merge_sort({ i32 }* %0, { i32, i32* }* %6)
  %8 = tail call { i32, i32* }* @merge({ { i32 }* }* undef, { i32, i32* }* %5, { i32, i32* }* %7)
  ret { i32, i32* }* %8

merge:                                            ; preds = %entry
  ret { i32, i32* }* %1
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define { i32, i32* }* @sub_arr({ { i32 }* }* nocapture readnone, { i32, i32* }*, i32, i32) local_unnamed_addr gc "ocaml" {
entry:
  %minus_tmp = sub i32 %3, %2
  %add_tmp = add i32 %minus_tmp, 1
  %mallocsize = shl i32 %add_tmp, 2
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp5, %loop ]
  %lt_tmp = icmp slt i32 %i.0, %add_tmp
  br i1 %lt_tmp, label %loop, label %end

loop:                                             ; preds = %test
  %4 = sext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %4
  store i32 0, i32* %Element, align 4
  %add_tmp5 = add nuw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall6 to i32*
  store i32 %add_tmp, i32* %array_info, align 4
  %array_info7 = getelementptr i8, i8* %malloccall6, i64 8
  %5 = bitcast i8* %array_info7 to i32**
  %6 = bitcast i8* %array_info7 to i8**
  store i8* %malloccall, i8** %6, align 8
  %7 = bitcast { i32, i32* }* %1 to i8*
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  br label %test16

test16:                                           ; preds = %loop17, %end
  %counter.0 = phi i32 [ %2, %end ], [ %add_tmp29, %loop17 ]
  %i12.0 = phi i32 [ 0, %end ], [ %add_tmp31, %loop17 ]
  %ge_tmp = icmp slt i32 %minus_tmp, %i12.0
  br i1 %ge_tmp, label %end18, label %loop17

loop17:                                           ; preds = %test16
  tail call void @tig_check_array_bound(i8* %malloccall6, i32 %i12.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @5, i64 0, i64 0))
  %arr_addr = load i32*, i32** %5, align 8
  %8 = sext i32 %i12.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %8
  tail call void @tig_check_array_bound(i8* %7, i32 %counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @6, i64 0, i64 0))
  %arr_addr26 = load i32*, i32** %array_pointer, align 8
  %9 = sext i32 %counter.0 to i64
  %arr_ele_addr27 = getelementptr i32, i32* %arr_addr26, i64 %9
  %arr_ele = load i32, i32* %arr_ele_addr27, align 4
  store i32 %arr_ele, i32* %arr_ele_addr, align 4
  %add_tmp29 = add i32 %counter.0, 1
  %add_tmp31 = add i32 %i12.0, 1
  br label %test16

end18:                                            ; preds = %test16
  %array_wrapper = bitcast i8* %malloccall6 to { i32, i32* }*
  ret { i32, i32* }* %array_wrapper
}

define { i32, i32* }* @merge({ { i32 }* }* nocapture readnone, { i32, i32* }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %3 = bitcast { i32, i32* }* %1 to i8*
  %4 = tail call i32 @tig_array_length(i8* %3)
  %5 = bitcast { i32, i32* }* %2 to i8*
  %6 = tail call i32 @tig_array_length(i8* %5)
  %add_tmp = add i32 %6, %4
  %mallocsize = shl i32 %add_tmp, 2
  %malloccall = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp7, %loop ]
  %lt_tmp = icmp slt i32 %i.0, %add_tmp
  br i1 %lt_tmp, label %loop, label %end

loop:                                             ; preds = %test
  %7 = sext i32 %i.0 to i64
  %Element = getelementptr i32, i32* %array_init, i64 %7
  store i32 0, i32* %Element, align 4
  %add_tmp7 = add nuw i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 16)
  %array_info = bitcast i8* %malloccall8 to i32*
  store i32 %add_tmp, i32* %array_info, align 4
  %array_info9 = getelementptr i8, i8* %malloccall8, i64 8
  %8 = bitcast i8* %array_info9 to i32**
  %9 = bitcast i8* %array_info9 to i8**
  store i8* %malloccall, i8** %9, align 8
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  %array_pointer33 = getelementptr { i32, i32* }, { i32, i32* }* %2, i64 0, i32 1
  br label %test11

test11:                                           ; preds = %merge28, %end
  %i10.0 = phi i32 [ 0, %end ], [ %i10.1, %merge28 ]
  %j.0 = phi i32 [ 0, %end ], [ %j.1, %merge28 ]
  %result_counter.0 = phi i32 [ 0, %end ], [ %result_counter.1, %merge28 ]
  %lt_tmp17 = icmp sge i32 %i10.0, %4
  %lt_tmp22 = icmp sge i32 %j.0, %6
  %cond24 = or i1 %lt_tmp17, %lt_tmp22
  br i1 %cond24, label %test68.preheader, label %test25

test68.preheader:                                 ; preds = %test11
  %array_wrapper = bitcast i8* %malloccall8 to { i32, i32* }*
  br label %test68

test25:                                           ; preds = %test11
  tail call void @tig_check_array_bound(i8* %3, i32 %i10.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @7, i64 0, i64 0))
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %10 = sext i32 %i10.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %10
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  tail call void @tig_check_array_bound(i8* %5, i32 %j.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @8, i64 0, i64 0))
  %arr_addr34 = load i32*, i32** %array_pointer33, align 8
  %11 = sext i32 %j.0 to i64
  %arr_ele_addr35 = getelementptr i32, i32* %arr_addr34, i64 %11
  %arr_ele36 = load i32, i32* %arr_ele_addr35, align 4
  %lt_tmp37 = icmp slt i32 %arr_ele, %arr_ele36
  br i1 %lt_tmp37, label %then26, label %else27

then26:                                           ; preds = %test25
  tail call void @tig_check_array_bound(i8* %malloccall8, i32 %result_counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @9, i64 0, i64 0))
  %arr_addr41 = load i32*, i32** %8, align 8
  %12 = sext i32 %result_counter.0 to i64
  %arr_ele_addr42 = getelementptr i32, i32* %arr_addr41, i64 %12
  tail call void @tig_check_array_bound(i8* nonnull %3, i32 %i10.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @10, i64 0, i64 0))
  %arr_addr46 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr47 = getelementptr i32, i32* %arr_addr46, i64 %10
  %arr_ele48 = load i32, i32* %arr_ele_addr47, align 4
  store i32 %arr_ele48, i32* %arr_ele_addr42, align 4
  %add_tmp50 = add i32 %i10.0, 1
  br label %merge28

else27:                                           ; preds = %test25
  tail call void @tig_check_array_bound(i8* %malloccall8, i32 %result_counter.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @11, i64 0, i64 0))
  %arr_addr56 = load i32*, i32** %8, align 8
  %13 = sext i32 %result_counter.0 to i64
  %arr_ele_addr57 = getelementptr i32, i32* %arr_addr56, i64 %13
  tail call void @tig_check_array_bound(i8* nonnull %5, i32 %j.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @12, i64 0, i64 0))
  %arr_addr61 = load i32*, i32** %array_pointer33, align 8
  %arr_ele_addr62 = getelementptr i32, i32* %arr_addr61, i64 %11
  %arr_ele63 = load i32, i32* %arr_ele_addr62, align 4
  store i32 %arr_ele63, i32* %arr_ele_addr57, align 4
  %add_tmp65 = add i32 %j.0, 1
  br label %merge28

merge28:                                          ; preds = %else27, %then26
  %i10.1 = phi i32 [ %i10.0, %else27 ], [ %add_tmp50, %then26 ]
  %j.1 = phi i32 [ %add_tmp65, %else27 ], [ %j.0, %then26 ]
  %result_counter.1 = add i32 %result_counter.0, 1
  br label %test11

test68:                                           ; preds = %test68.preheader, %loop69
  %i10.2 = phi i32 [ %add_tmp88, %loop69 ], [ %i10.0, %test68.preheader ]
  %result_counter.2 = phi i32 [ %add_tmp90, %loop69 ], [ %result_counter.0, %test68.preheader ]
  %lt_tmp73 = icmp slt i32 %i10.2, %4
  br i1 %lt_tmp73, label %loop69, label %test91

loop69:                                           ; preds = %test68
  tail call void @tig_check_array_bound(i8* %malloccall8, i32 %result_counter.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @13, i64 0, i64 0))
  %arr_addr79 = load i32*, i32** %8, align 8
  %14 = sext i32 %result_counter.2 to i64
  %arr_ele_addr80 = getelementptr i32, i32* %arr_addr79, i64 %14
  tail call void @tig_check_array_bound(i8* %3, i32 %i10.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @14, i64 0, i64 0))
  %arr_addr84 = load i32*, i32** %array_pointer, align 8
  %15 = sext i32 %i10.2 to i64
  %arr_ele_addr85 = getelementptr i32, i32* %arr_addr84, i64 %15
  %arr_ele86 = load i32, i32* %arr_ele_addr85, align 4
  store i32 %arr_ele86, i32* %arr_ele_addr80, align 4
  %add_tmp88 = add i32 %i10.2, 1
  %add_tmp90 = add i32 %result_counter.2, 1
  br label %test68

test91:                                           ; preds = %test68, %loop92
  %j.2 = phi i32 [ %add_tmp111, %loop92 ], [ %j.0, %test68 ]
  %result_counter.3 = phi i32 [ %add_tmp113, %loop92 ], [ %result_counter.2, %test68 ]
  %lt_tmp96 = icmp slt i32 %j.2, %6
  br i1 %lt_tmp96, label %loop92, label %end93

loop92:                                           ; preds = %test91
  tail call void @tig_check_array_bound(i8* %malloccall8, i32 %result_counter.3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @15, i64 0, i64 0))
  %arr_addr102 = load i32*, i32** %8, align 8
  %16 = sext i32 %result_counter.3 to i64
  %arr_ele_addr103 = getelementptr i32, i32* %arr_addr102, i64 %16
  tail call void @tig_check_array_bound(i8* %5, i32 %j.2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @16, i64 0, i64 0))
  %arr_addr107 = load i32*, i32** %array_pointer33, align 8
  %17 = sext i32 %j.2 to i64
  %arr_ele_addr108 = getelementptr i32, i32* %arr_addr107, i64 %17
  %arr_ele109 = load i32, i32* %arr_ele_addr108, align 4
  store i32 %arr_ele109, i32* %arr_ele_addr103, align 4
  %add_tmp111 = add i32 %j.2, 1
  %add_tmp113 = add i32 %result_counter.3, 1
  br label %test91

end93:                                            ; preds = %test91
  ret { i32, i32* }* %array_wrapper
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
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @17, i64 0, i64 0))
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
