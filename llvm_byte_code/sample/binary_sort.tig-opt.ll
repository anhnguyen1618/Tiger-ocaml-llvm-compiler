; ModuleID = 'llvm_byte_code/test/binary_sort.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [2 x i8] c"[\00"
@1 = private unnamed_addr constant [47 x i8] c"test/binary_sort.tig::6.67: Array out of bound\00"
@2 = private unnamed_addr constant [1 x i8] zeroinitializer
@3 = private unnamed_addr constant [2 x i8] c"]\00"
@4 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::16.41: Array out of bound\00"
@5 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::35.47: Nil pointer exception!\00"
@6 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::35.79: Nil pointer exception!\00"
@7 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::36.49: Nil pointer exception!\00"
@8 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::37.52: Nil pointer exception!\00"
@9 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::37.83: Nil pointer exception!\00"
@10 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::38.49: Nil pointer exception!\00"
@11 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::39.52: Nil pointer exception!\00"
@12 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::40.61: Nil pointer exception!\00"
@13 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::41.61: Nil pointer exception!\00"
@14 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::49.36: Array out of bound\00"
@15 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::57.48: Nil pointer exception!\00"
@16 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::58.23: Array out of bound\00"
@17 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::58.44: Nil pointer exception!\00"
@18 = private unnamed_addr constant [52 x i8] c"test/binary_sort.tig::60.48: Nil pointer exception!\00"
@19 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::77.41: Array out of bound\00"
@20 = private unnamed_addr constant [15 x i8] c"Before sorting\00"
@21 = private unnamed_addr constant [15 x i8] c"==============\00"
@22 = private unnamed_addr constant [14 x i8] c"After sorting\00"
@23 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::90.23: Array out of bound\00"
@24 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::91.23: Array out of bound\00"
@25 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::92.23: Array out of bound\00"
@26 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::93.23: Array out of bound\00"
@27 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::94.23: Array out of bound\00"
@28 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::98.23: Array out of bound\00"
@29 = private unnamed_addr constant [48 x i8] c"test/binary_sort.tig::99.23: Array out of bound\00"
@30 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::100.23: Array out of bound\00"
@31 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::101.23: Array out of bound\00"
@32 = private unnamed_addr constant [49 x i8] c"test/binary_sort.tig::102.23: Array out of bound\00"

declare void @tig_print(i8*) local_unnamed_addr gc "ocaml"

declare void @print_arr_int_ele(i32) local_unnamed_addr gc "ocaml"

declare i32 @tig_array_length(i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_nillable(i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr gc "ocaml"

declare i32 @tig_random(i32) local_unnamed_addr gc "ocaml"

declare void @assert_equal_int(i32, i32) local_unnamed_addr gc "ocaml"

define i32 @main() local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { i32 }, align 8
  %0 = tail call { i32, i32* }* @create_array({ i32 }* undef)
  %1 = tail call { i32, i32* }* @create_array_test({ i32 }* undef)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @20, i64 0, i64 0))
  tail call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  tail call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @21, i64 0, i64 0))
  call void @binary_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @22, i64 0, i64 0))
  call void @print_array({ i32 }* undef, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @23, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %arr_ele = load i32, i32* %arr_addr, align 4
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @24, i64 0, i64 0))
  %arr_addr7 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i64 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8, align 4
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @25, i64 0, i64 0))
  %arr_addr12 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i64 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13, align 4
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @26, i64 0, i64 0))
  %arr_addr17 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i64 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18, align 4
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @27, i64 0, i64 0))
  %arr_addr22 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i64 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23, align 4
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @binary_sort({ i32 }* nonnull %frame_pointer, { i32, i32* }* %1)
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @28, i64 0, i64 0))
  %arr_addr28 = load i32*, i32** %array_pointer, align 8
  %arr_ele30 = load i32, i32* %arr_addr28, align 4
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  call void @tig_check_array_bound(i8* %2, i32 1, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @29, i64 0, i64 0))
  %arr_addr33 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i64 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34, align 4
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  call void @tig_check_array_bound(i8* %2, i32 2, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @30, i64 0, i64 0))
  %arr_addr38 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i64 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39, align 4
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  call void @tig_check_array_bound(i8* %2, i32 3, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @31, i64 0, i64 0))
  %arr_addr43 = load i32*, i32** %array_pointer, align 8
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i64 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44, align 4
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  call void @tig_check_array_bound(i8* %2, i32 4, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @32, i64 0, i64 0))
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
  tail call void @tig_check_array_bound(i8* %2, i32 %i.0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @1, i64 0, i64 0))
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
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @4, i64 0, i64 0))
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

define void @binary_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }*, i32, { i32, i32* }* }, align 8
  %arg_address = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 2
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1, align 8
  %var_dec = getelementptr inbounds { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i64 0, i32 1
  store i32 0, i32* %var_dec, align 8
  %2 = call { i32, i8*, i8* }* @build_binary_tree({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer)
  call void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }* nonnull %frame_pointer, { i32, i8*, i8* }* %2)
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i32) local_unnamed_addr #0

define { i32, i8*, i8* }* @build_binary_tree({ { i32 }*, i32, { i32, i32* }* }*) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, align 8
  %arg_address = getelementptr inbounds { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i64 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address, align 8
  %root_node = getelementptr inbounds { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %frame_pointer, i64 0, i32 1
  store { i32, i8*, i8* }* null, { i32, i8*, i8* }** %root_node, align 8
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 2
  %1 = bitcast { i32, i32* }** %arr to i8**
  %arr13 = load i8*, i8** %1, align 8
  %2 = tail call i32 @tig_array_length(i8* %arr13)
  %arr54 = load i8*, i8** %1, align 8
  %3 = tail call i32 @tig_array_length(i8* %arr54)
  %minus_tmp6 = add i32 %3, -1
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %ge_tmp = icmp slt i32 %minus_tmp6, %i.0
  br i1 %ge_tmp, label %end, label %loop

loop:                                             ; preds = %test
  %fp_addr10 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %arg_address, align 8
  %arr11 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr10, i64 0, i32 2
  %arr12 = load { i32, i32* }*, { i32, i32* }** %arr11, align 8
  %4 = bitcast { i32, i32* }* %arr12 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %i.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @14, i64 0, i64 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr12, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer, align 8
  %5 = sext i32 %i.0 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %5
  %arr_ele = load i32, i32* %arr_ele_addr, align 4
  call void @add_node({ { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* nonnull %frame_pointer, i32 %arr_ele)
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %root_node16 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root_node, align 8
  ret { i32, i8*, i8* }* %root_node16
}

define void @add_node({ { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, i32) local_unnamed_addr gc "ocaml" {
entry:
  %frame_pointer = alloca { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, align 8
  %arg_address = getelementptr inbounds { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i64 0, i32 0
  store { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %0, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }** %arg_address, align 8
  %arg_address1 = getelementptr inbounds { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i64 0, i32 2
  store i32 %1, i32* %arg_address1, align 8
  %malloccall = tail call i8* @malloc(i32 24)
  %Element = bitcast i8* %malloccall to i32*
  store i32 %1, i32* %Element, align 4
  %Element3 = getelementptr i8, i8* %malloccall, i64 8
  %var_dec = getelementptr inbounds { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %frame_pointer, i64 0, i32 1
  %2 = bitcast { i32, i8*, i8* }** %var_dec to i8**
  call void @llvm.memset.p0i8.i64(i8* align 8 %Element3, i8 0, i64 16, i1 false)
  store i8* %malloccall, i8** %2, align 8
  %root_node = getelementptr { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }, { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }* %0, i64 0, i32 1
  %3 = bitcast { i32, i8*, i8* }** %root_node to i8**
  %root_node51 = load i8*, i8** %3, align 8
  %4 = tail call i32 @tig_nillable(i8* %root_node51)
  %cond = icmp eq i32 %4, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %entry
  %5 = bitcast { i32, i8*, i8* }** %root_node to i8**
  store i8* %malloccall, i8** %5, align 8
  br label %merge

else:                                             ; preds = %entry
  %root_node13 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %root_node, align 8
  call void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* nonnull %frame_pointer, { i32, i8*, i8* }* %root_node13)
  br label %merge

merge:                                            ; preds = %else, %then
  ret void
}

define void @insert_node({ { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* readonly, { i32, i8*, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  %value = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %0, i64 0, i32 2
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse.backedge, %entry
  %.tr4 = phi { i32, i8*, i8* }* [ %1, %entry ], [ %.tr4.be, %tailrecurse.backedge ]
  %2 = bitcast { i32, i8*, i8* }* %.tr4 to i8*
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @5, i64 0, i64 0))
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr4, i64 0, i32 0
  %field_var = load i32, i32* %element, align 4
  %value6 = load i32, i32* %value, align 4
  %le_tmp = icmp sgt i32 %field_var, %value6
  br i1 %le_tmp, label %test18, label %then2

then:                                             ; preds = %then2
  %3 = bitcast { i32, i8*, i8* }* %.tr4 to i8*
  tail call void @tig_check_null_pointer(i8* nonnull %3, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i64 0, i64 0))
  br label %merge

merge:                                            ; preds = %then15, %then
  %element32.sink = phi i8** [ %element32, %then15 ], [ %element8, %then ]
  %4 = bitcast i8** %element32.sink to { i32, i8*, i8* }**
  %new_node41 = getelementptr { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }, { { { { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }* }*, { i32, i8*, i8* }*, i32 }* %0, i64 0, i32 1
  %new_node42 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %new_node41, align 8
  store { i32, i8*, i8* }* %new_node42, { i32, i8*, i8* }** %4, align 8
  ret void

then2:                                            ; preds = %tailrecurse
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i64 0, i64 0))
  %element8 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr4, i64 0, i32 2
  %field_var9 = load i8*, i8** %element8, align 8
  %5 = tail call i32 @tig_nillable(i8* %field_var9)
  %phitmp = icmp eq i32 %5, 0
  br i1 %phitmp, label %test18, label %then

then15:                                           ; preds = %then19
  %6 = bitcast { i32, i8*, i8* }* %.tr4 to i8*
  tail call void @tig_check_null_pointer(i8* nonnull %6, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @10, i64 0, i64 0))
  br label %merge

test18:                                           ; preds = %tailrecurse, %then2
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @8, i64 0, i64 0))
  %field_var24 = load i32, i32* %element, align 4
  %value28 = load i32, i32* %value, align 4
  %gt_tmp = icmp sgt i32 %field_var24, %value28
  br i1 %gt_tmp, label %then19, label %test43

then19:                                           ; preds = %test18
  tail call void @tig_check_null_pointer(i8* nonnull %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @9, i64 0, i64 0))
  %element32 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr4, i64 0, i32 1
  %field_var33 = load i8*, i8** %element32, align 8
  %7 = tail call i32 @tig_nillable(i8* %field_var33)
  %phitmp1 = icmp eq i32 %7, 0
  br i1 %phitmp1, label %test43, label %then15

test43:                                           ; preds = %test18, %then19
  tail call void @tig_check_null_pointer(i8* nonnull %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @11, i64 0, i64 0))
  %field_var49 = load i32, i32* %element, align 4
  %value53 = load i32, i32* %value, align 4
  %le_tmp54 = icmp sgt i32 %field_var49, %value53
  br i1 %le_tmp54, label %else45, label %then44

then44:                                           ; preds = %test43
  tail call void @tig_check_null_pointer(i8* nonnull %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @12, i64 0, i64 0))
  %element58 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr4, i64 0, i32 2
  br label %tailrecurse.backedge

else45:                                           ; preds = %test43
  tail call void @tig_check_null_pointer(i8* nonnull %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @13, i64 0, i64 0))
  %element63 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr4, i64 0, i32 1
  br label %tailrecurse.backedge

tailrecurse.backedge:                             ; preds = %else45, %then44
  %.tr4.be.in.in = phi i8** [ %element63, %else45 ], [ %element58, %then44 ]
  %.tr4.be.in = bitcast i8** %.tr4.be.in.in to { i32, i8*, i8* }**
  %.tr4.be = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %.tr4.be.in, align 8
  br label %tailrecurse
}

define void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }*, { i32, i8*, i8* }*) local_unnamed_addr gc "ocaml" {
entry:
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 2
  %counter = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %0, i64 0, i32 1
  br label %tailrecurse

tailrecurse:                                      ; preds = %else, %entry
  %.tr3 = phi { i32, i8*, i8* }* [ %1, %entry ], [ %field_var202, %else ]
  %2 = bitcast { i32, i8*, i8* }* %.tr3 to i8*
  %3 = tail call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 0
  br i1 %cond, label %else, label %merge

else:                                             ; preds = %tailrecurse
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @15, i64 0, i64 0))
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 1
  %4 = bitcast i8** %element to { i32, i8*, i8* }**
  %field_var1 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %4, align 8
  tail call void @in_order_traversing({ { i32 }*, i32, { i32, i32* }* }* %0, { i32, i8*, i8* }* %field_var1)
  %counter7 = load i32, i32* %counter, align 4
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr, align 8
  %5 = bitcast { i32, i32* }* %load_left to i8*
  tail call void @tig_check_array_bound(i8* %5, i32 %counter7, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @16, i64 0, i64 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i64 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr, align 8
  %6 = sext i32 %counter7 to i64
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i64 %6
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @17, i64 0, i64 0))
  %element9 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 0
  %field_var10 = load i32, i32* %element9, align 4
  store i32 %field_var10, i32* %arr_ele_addr, align 4
  %counter17 = load i32, i32* %counter, align 4
  %add_tmp = add i32 %counter17, 1
  store i32 %add_tmp, i32* %counter, align 4
  tail call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @18, i64 0, i64 0))
  %element19 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %.tr3, i64 0, i32 2
  %7 = bitcast i8** %element19 to { i32, i8*, i8* }**
  %field_var202 = load { i32, i8*, i8* }*, { i32, i8*, i8* }** %7, align 8
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
  tail call void @tig_check_array_bound(i8* %malloccall4, i32 %i7.0, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @19, i64 0, i64 0))
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1) #1

attributes #0 = { nounwind }
attributes #1 = { argmemonly nounwind }
