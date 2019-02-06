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

declare void @tig_print(i8*) local_unnamed_addr

declare void @print_arr_int_ele(i32) local_unnamed_addr

declare i32 @tig_array_length(i8*) local_unnamed_addr

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr

declare i32 @tig_random(i32) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %0 = call { i32, i32* }* @create_array({ i32 }* %frame_pointer)
  %1 = call { i32, i32* }* @create_array_test({ i32 }* %frame_pointer)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @16, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @17, i32 0, i32 0))
  call void @heap_sort({ i32 }* %frame_pointer, { i32, i32* }* %0)
  call void @tig_print(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @18, i32 0, i32 0))
  call void @print_array({ i32 }* %frame_pointer, { i32, i32* }* %0)
  %2 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %2, i32 0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @19, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @assert_equal_int(i32 %arr_ele, i32 4)
  %3 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @20, i32 0, i32 0))
  %array_pointer6 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr7 = load i32*, i32** %array_pointer6
  %arr_ele_addr8 = getelementptr i32, i32* %arr_addr7, i32 1
  %arr_ele9 = load i32, i32* %arr_ele_addr8
  call void @assert_equal_int(i32 %arr_ele9, i32 3)
  %4 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %4, i32 2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @21, i32 0, i32 0))
  %array_pointer11 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr12 = load i32*, i32** %array_pointer11
  %arr_ele_addr13 = getelementptr i32, i32* %arr_addr12, i32 2
  %arr_ele14 = load i32, i32* %arr_ele_addr13
  call void @assert_equal_int(i32 %arr_ele14, i32 2)
  %5 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %5, i32 3, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @22, i32 0, i32 0))
  %array_pointer16 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr17 = load i32*, i32** %array_pointer16
  %arr_ele_addr18 = getelementptr i32, i32* %arr_addr17, i32 3
  %arr_ele19 = load i32, i32* %arr_ele_addr18
  call void @assert_equal_int(i32 %arr_ele19, i32 1)
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 4, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @23, i32 0, i32 0))
  %array_pointer21 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr22 = load i32*, i32** %array_pointer21
  %arr_ele_addr23 = getelementptr i32, i32* %arr_addr22, i32 4
  %arr_ele24 = load i32, i32* %arr_ele_addr23
  call void @assert_equal_int(i32 %arr_ele24, i32 0)
  call void @heap_sort({ i32 }* %frame_pointer, { i32, i32* }* %1)
  %7 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %7, i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @24, i32 0, i32 0))
  %array_pointer27 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr28 = load i32*, i32** %array_pointer27
  %arr_ele_addr29 = getelementptr i32, i32* %arr_addr28, i32 0
  %arr_ele30 = load i32, i32* %arr_ele_addr29
  call void @assert_equal_int(i32 %arr_ele30, i32 0)
  %8 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %8, i32 1, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @25, i32 0, i32 0))
  %array_pointer32 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr33 = load i32*, i32** %array_pointer32
  %arr_ele_addr34 = getelementptr i32, i32* %arr_addr33, i32 1
  %arr_ele35 = load i32, i32* %arr_ele_addr34
  call void @assert_equal_int(i32 %arr_ele35, i32 1)
  %9 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %9, i32 2, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @26, i32 0, i32 0))
  %array_pointer37 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr38 = load i32*, i32** %array_pointer37
  %arr_ele_addr39 = getelementptr i32, i32* %arr_addr38, i32 2
  %arr_ele40 = load i32, i32* %arr_ele_addr39
  call void @assert_equal_int(i32 %arr_ele40, i32 2)
  %10 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %10, i32 3, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @27, i32 0, i32 0))
  %array_pointer42 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr43 = load i32*, i32** %array_pointer42
  %arr_ele_addr44 = getelementptr i32, i32* %arr_addr43, i32 3
  %arr_ele45 = load i32, i32* %arr_ele_addr44
  call void @assert_equal_int(i32 %arr_ele45, i32 3)
  %11 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %11, i32 4, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @28, i32 0, i32 0))
  %array_pointer47 = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr48 = load i32*, i32** %array_pointer47
  %arr_ele_addr49 = getelementptr i32, i32* %arr_addr48, i32 4
  %arr_ele50 = load i32, i32* %arr_ele_addr49
  call void @assert_equal_int(i32 %arr_ele50, i32 4)
  ret i32 0
}

define void @print_array({ i32 }*, { i32, i32* }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @0, i32 0, i32 0))
  %2 = bitcast { i32, i32* }* %1 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %4 = bitcast { i32, i32* }* %1 to i8*
  %5 = call i32 @tig_array_length(i8* %4)
  %minus_tmp3 = sub i32 %5, 1
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %ge_tmp = icmp sge i32 %minus_tmp3, %i.0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %6 = bitcast { i32, i32* }* %1 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %i.0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i.0
  %arr_ele = load i32, i32* %arr_ele_addr
  call void @print_arr_int_ele(i32 %arr_ele)
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([1 x i8], [1 x i8]* @2, i32 0, i32 0))
  call void @tig_print(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @3, i32 0, i32 0))
  ret void
}

define { i32, i32* }* @create_array({ i32 }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %malloccall = tail call i8* @malloc(i32 32)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp slt i32 %i.0, 8
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 1, i32* %Element
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 8, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp19, %loop11 ]
  %ge_tmp = icmp sge i32 7, %i7.0
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @4, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7.0
  %2 = call i32 @tig_random(i32 50)
  store i32 %2, i32* %arr_ele_addr
  %add_tmp19 = add i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  ret { i32, i32* }* %array_wrapper
}

define void @heap_sort({ i32 }*, { i32, i32* }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }*, i32, { i32, i32* }* }
  %arg_address = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %arg_address1 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  store { i32, i32* }* %1, { i32, i32* }** %arg_address1
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 2
  %arr2 = load { i32, i32* }*, { i32, i32* }** %arr
  %2 = bitcast { i32, i32* }* %arr2 to i8*
  %3 = call i32 @tig_array_length(i8* %2)
  %var_dec = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  store i32 %3, i32* %var_dec
  %arr_size = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  %arr_size3 = load i32, i32* %arr_size
  call void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer)
  %arr_size4 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 1
  %arr_size5 = load i32, i32* %arr_size4
  %minus_tmp = sub i32 %arr_size5, 1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %minus_tmp)
  %minus_tmp7 = sub i32 %arr_size3, 1
  br label %test

test:                                             ; preds = %loop, %entry
  %size.0 = phi i32 [ %minus_tmp7, %entry ], [ %minus_tmp13, %loop ]
  %gt_tmp = icmp sgt i32 %size.0, 1
  %bool_tmp = zext i1 %gt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %size.0)
  %minus_tmp11 = sub i32 %size.0, 1
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %frame_pointer, i32 0, i32 %minus_tmp11)
  %minus_tmp13 = sub i32 %size.0, 1
  br label %test

end:                                              ; preds = %test
  ret void
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define void @create_max_heap({ { i32 }*, i32, { i32, i32* }* }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr_size = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 1
  %arr_size1 = load i32, i32* %arr_size
  %minus_tmp = sub i32 %arr_size1, 1
  %div_tmp = sdiv i32 %minus_tmp, 2
  br label %test

test:                                             ; preds = %loop, %entry
  %index.0 = phi i32 [ %div_tmp, %entry ], [ %minus_tmp11, %loop ]
  %ge_tmp = icmp sge i32 %index.0, 0
  %bool_tmp = zext i1 %ge_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %fp_addr_in_sl4 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr5 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl4
  %arr_size6 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr5, i32 0, i32 1
  %arr_size7 = load i32, i32* %arr_size6
  %fp_addr_in_sl8 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr9 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl8
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %fp_addr9, i32 %index.0, i32 %arr_size7)
  %minus_tmp11 = sub i32 %index.0, 1
  br label %test

end:                                              ; preds = %test
  ret void
}

define void @swap({ { i32 }*, i32, { i32, i32* }* }*, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @5, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %1
  %arr_ele = load i32, i32* %arr_ele_addr
  %fp_addr_in_sl3 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr4 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl3
  %arr5 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr4, i32 0, i32 2
  %arr6 = load { i32, i32* }*, { i32, i32* }** %arr5
  %4 = bitcast { i32, i32* }* %arr6 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @6, i32 0, i32 0))
  %array_pointer8 = getelementptr { i32, i32* }, { i32, i32* }* %arr6, i32 0, i32 1
  %arr_addr9 = load i32*, i32** %array_pointer8
  %arr_ele_addr10 = getelementptr i32, i32* %arr_addr9, i32 %2
  %arr_ele11 = load i32, i32* %arr_ele_addr10
  %fp_addr_in_sl12 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr13 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl12
  %arr14 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr13, i32 0, i32 2
  %load_left = load { i32, i32* }*, { i32, i32* }** %arr14
  %5 = bitcast { i32, i32* }* %load_left to i8*
  call void @tig_check_array_bound(i8* %5, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @7, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %load_left, i32 0, i32 1
  %arr_addr16 = load i32*, i32** %array_addr_ptr
  %arr_ele_addr17 = getelementptr i32, i32* %arr_addr16, i32 %1
  store i32 %arr_ele11, i32* %arr_ele_addr17
  %fp_addr_in_sl19 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr20 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl19
  %arr21 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr20, i32 0, i32 2
  %load_left23 = load { i32, i32* }*, { i32, i32* }** %arr21
  %6 = bitcast { i32, i32* }* %load_left23 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %2, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @8, i32 0, i32 0))
  %array_addr_ptr24 = getelementptr { i32, i32* }, { i32, i32* }* %load_left23, i32 0, i32 1
  %arr_addr25 = load i32*, i32** %array_addr_ptr24
  %arr_ele_addr26 = getelementptr i32, i32* %arr_addr25, i32 %2
  store i32 %arr_ele, i32* %arr_ele_addr26
  ret void
}

define void @max_heapify({ { i32 }*, i32, { i32, i32* }* }*, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { { i32 }*, i32, { i32, i32* }* }* }
  %arg_address = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  store { { i32 }*, i32, { i32, i32* }* }* %0, { { i32 }*, i32, { i32, i32* }* }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl
  %arr = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr, i32 0, i32 2
  %arr1 = load { i32, i32* }*, { i32, i32* }** %arr
  %3 = bitcast { i32, i32* }* %arr1 to i8*
  call void @tig_check_array_bound(i8* %3, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @9, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr1, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %1
  %arr_ele = load i32, i32* %arr_ele_addr
  %mul_tmp = mul i32 %1, 2
  %add_tmp = add i32 %mul_tmp, 1
  %mul_tmp6 = mul i32 %1, 2
  %add_tmp7 = add i32 %mul_tmp6, 2
  br label %test

test:                                             ; preds = %entry
  br label %test8

then:                                             ; preds = %merge11
  %fp_addr_in_sl26 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr27 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl26
  %arr28 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr27, i32 0, i32 2
  %arr29 = load { i32, i32* }*, { i32, i32* }** %arr28
  %4 = bitcast { i32, i32* }* %arr29 to i8*
  call void @tig_check_array_bound(i8* %4, i32 %add_tmp7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @11, i32 0, i32 0))
  %array_pointer31 = getelementptr { i32, i32* }, { i32, i32* }* %arr29, i32 0, i32 1
  %arr_addr32 = load i32*, i32** %array_pointer31
  %arr_ele_addr33 = getelementptr i32, i32* %arr_addr32, i32 %add_tmp7
  %arr_ele34 = load i32, i32* %arr_ele_addr33
  br label %merge

else:                                             ; preds = %merge11
  br label %merge

merge:                                            ; preds = %else, %then
  %index_largest.0 = phi i32 [ %add_tmp7, %then ], [ %1, %else ]
  %largest.0 = phi i32 [ %arr_ele34, %then ], [ %arr_ele, %else ]
  br label %test38

test8:                                            ; preds = %test
  %lt_tmp = icmp slt i32 %add_tmp7, %2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %then9, label %else10

then9:                                            ; preds = %test8
  %fp_addr_in_sl14 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr15 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl14
  %arr16 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr15, i32 0, i32 2
  %arr17 = load { i32, i32* }*, { i32, i32* }** %arr16
  %5 = bitcast { i32, i32* }* %arr17 to i8*
  call void @tig_check_array_bound(i8* %5, i32 %add_tmp7, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @10, i32 0, i32 0))
  %array_pointer19 = getelementptr { i32, i32* }, { i32, i32* }* %arr17, i32 0, i32 1
  %arr_addr20 = load i32*, i32** %array_pointer19
  %arr_ele_addr21 = getelementptr i32, i32* %arr_addr20, i32 %add_tmp7
  %arr_ele22 = load i32, i32* %arr_ele_addr21
  %gt_tmp = icmp sgt i32 %arr_ele22, %arr_ele
  %bool_tmp24 = zext i1 %gt_tmp to i32
  br label %merge11

else10:                                           ; preds = %test8
  br label %merge11

merge11:                                          ; preds = %else10, %then9
  %if_result_addr.0 = phi i32 [ %bool_tmp24, %then9 ], [ 0, %else10 ]
  %cond25 = icmp eq i32 %if_result_addr.0, 1
  br i1 %cond25, label %then, label %else

test38:                                           ; preds = %merge
  br label %test42

then39:                                           ; preds = %merge45
  %fp_addr_in_sl66 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr67 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl66
  %arr68 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr67, i32 0, i32 2
  %arr69 = load { i32, i32* }*, { i32, i32* }** %arr68
  %6 = bitcast { i32, i32* }* %arr69 to i8*
  call void @tig_check_array_bound(i8* %6, i32 %add_tmp, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @13, i32 0, i32 0))
  %array_pointer71 = getelementptr { i32, i32* }, { i32, i32* }* %arr69, i32 0, i32 1
  %arr_addr72 = load i32*, i32** %array_pointer71
  %arr_ele_addr73 = getelementptr i32, i32* %arr_addr72, i32 %add_tmp
  %arr_ele74 = load i32, i32* %arr_ele_addr73
  br label %merge41

else40:                                           ; preds = %merge45
  br label %merge41

merge41:                                          ; preds = %else40, %then39
  %index_largest.1 = phi i32 [ %add_tmp, %then39 ], [ %index_largest.0, %else40 ]
  %largest.1 = phi i32 [ %arr_ele74, %then39 ], [ %largest.0, %else40 ]
  br label %test78

test42:                                           ; preds = %test38
  %lt_tmp48 = icmp slt i32 %add_tmp, %2
  %bool_tmp49 = zext i1 %lt_tmp48 to i32
  %cond50 = icmp eq i32 %bool_tmp49, 1
  br i1 %cond50, label %then43, label %else44

then43:                                           ; preds = %test42
  %fp_addr_in_sl51 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr52 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl51
  %arr53 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr52, i32 0, i32 2
  %arr54 = load { i32, i32* }*, { i32, i32* }** %arr53
  %7 = bitcast { i32, i32* }* %arr54 to i8*
  call void @tig_check_array_bound(i8* %7, i32 %add_tmp, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @12, i32 0, i32 0))
  %array_pointer56 = getelementptr { i32, i32* }, { i32, i32* }* %arr54, i32 0, i32 1
  %arr_addr57 = load i32*, i32** %array_pointer56
  %arr_ele_addr58 = getelementptr i32, i32* %arr_addr57, i32 %add_tmp
  %arr_ele59 = load i32, i32* %arr_ele_addr58
  %gt_tmp61 = icmp sgt i32 %arr_ele59, %largest.0
  %bool_tmp62 = zext i1 %gt_tmp61 to i32
  br label %merge45

else44:                                           ; preds = %test42
  br label %merge45

merge45:                                          ; preds = %else44, %then43
  %if_result_addr63.0 = phi i32 [ %bool_tmp62, %then43 ], [ 0, %else44 ]
  %cond65 = icmp eq i32 %if_result_addr63.0, 1
  br i1 %cond65, label %then39, label %else40

test78:                                           ; preds = %merge41
  %fp_addr_in_sl83 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr84 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl83
  %arr85 = getelementptr { { i32 }*, i32, { i32, i32* }* }, { { i32 }*, i32, { i32, i32* }* }* %fp_addr84, i32 0, i32 2
  %arr86 = load { i32, i32* }*, { i32, i32* }** %arr85
  %8 = bitcast { i32, i32* }* %arr86 to i8*
  call void @tig_check_array_bound(i8* %8, i32 %1, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @14, i32 0, i32 0))
  %array_pointer88 = getelementptr { i32, i32* }, { i32, i32* }* %arr86, i32 0, i32 1
  %arr_addr89 = load i32*, i32** %array_pointer88
  %arr_ele_addr90 = getelementptr i32, i32* %arr_addr89, i32 %1
  %arr_ele91 = load i32, i32* %arr_ele_addr90
  %neq_tmp = icmp ne i32 %largest.1, %arr_ele91
  %bool_tmp92 = zext i1 %neq_tmp to i32
  %cond93 = icmp eq i32 %bool_tmp92, 1
  br i1 %cond93, label %then79, label %else80

then79:                                           ; preds = %test78
  %fp_addr_in_sl96 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr97 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl96
  call void @swap({ { i32 }*, i32, { i32, i32* }* }* %fp_addr97, i32 %1, i32 %index_largest.1)
  %fp_addr_in_sl100 = getelementptr { { { i32 }*, i32, { i32, i32* }* }* }, { { { i32 }*, i32, { i32, i32* }* }* }* %frame_pointer, i32 0, i32 0
  %fp_addr101 = load { { i32 }*, i32, { i32, i32* }* }*, { { i32 }*, i32, { i32, i32* }* }** %fp_addr_in_sl100
  call void @max_heapify({ { i32 }*, i32, { i32, i32* }* }* %fp_addr101, i32 %index_largest.1, i32 %2)
  br label %merge81

else80:                                           ; preds = %test78
  br label %merge81

merge81:                                          ; preds = %else80, %then79
  ret void
}

define { i32, i32* }* @create_array_test({ i32 }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  %malloccall = tail call i8* @malloc(i32 20)
  %array_init = bitcast i8* %malloccall to i32*
  br label %test

test:                                             ; preds = %loop, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add_tmp, %loop ]
  %lt_tmp = icmp slt i32 %i.0, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %Element = getelementptr i32, i32* %array_init, i32 %i.0
  store i32 1, i32* %Element
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall4 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall4 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 5, i32* %array_info
  %array_info5 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info5
  br label %test10

test10:                                           ; preds = %loop11, %end
  %i7.0 = phi i32 [ 0, %end ], [ %add_tmp23, %loop11 ]
  %ge_tmp = icmp sge i32 4, %i7.0
  %bool_tmp15 = zext i1 %ge_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 1
  br i1 %cond16, label %loop11, label %end12

loop11:                                           ; preds = %test10
  %1 = bitcast { i32, i32* }* %array_wrapper to i8*
  call void @tig_check_array_bound(i8* %1, i32 %i7.0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @15, i32 0, i32 0))
  %array_addr_ptr = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_addr_ptr
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 %i7.0
  %minus_tmp20 = sub i32 5, %i7.0
  %minus_tmp21 = sub i32 %minus_tmp20, 1
  store i32 %minus_tmp21, i32* %arr_ele_addr
  %add_tmp23 = add i32 %i7.0, 1
  br label %test10

end12:                                            ; preds = %test10
  ret { i32, i32* }* %array_wrapper
}
