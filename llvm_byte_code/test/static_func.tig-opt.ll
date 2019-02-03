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

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare void @tig_check_array_bound(i8*, i32, i8*) local_unnamed_addr

declare void @tig_check_null_pointer(i8*, i8*) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

declare void @assert_equal_string(i8*, i8*) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32, { i32, i32* }*, { i32, i8* }* }
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 5))
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
  store i32 9, i32* %Element
  %add_tmp = add i32 %i.0, 1
  br label %test

end:                                              ; preds = %test
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall3 to { i32, i32* }*
  %array_info = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 0
  store i32 5, i32* %array_info
  %array_info4 = getelementptr { i32, i32* }, { i32, i32* }* %array_wrapper, i32 0, i32 1
  store i32* %array_init, i32** %array_info4
  %arr1 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 1
  store { i32, i32* }* %array_wrapper, { i32, i32* }** %arr1
  %malloccall5 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall5 to { i32, i8* }*
  %Element6 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 0, i32* %Element6
  %Element7 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0), i8** %Element7
  %rec = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 2
  store { i32, i8* }* %record_init, { i32, i8* }** %rec
  call void @f({ i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 1, i32 2, i32 3, i32 4)
  %rec8 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 2
  %rec9 = load { i32, i8* }*, { i32, i8* }** %rec8
  %0 = bitcast { i32, i8* }* %rec9 to i8*
  call void @tig_check_null_pointer(i8* %0, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @4, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %rec9, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  %rec10 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 2
  %rec11 = load { i32, i8* }*, { i32, i8* }** %rec10
  %1 = bitcast { i32, i8* }* %rec11 to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @5, i32 0, i32 0))
  %element12 = getelementptr { i32, i8* }, { i32, i8* }* %rec11, i32 0, i32 1
  %field_var13 = load i8*, i8** %element12
  call void @tig_print(i8* %field_var13)
  %rec14 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 2
  %rec15 = load { i32, i8* }*, { i32, i8* }** %rec14
  %2 = bitcast { i32, i8* }* %rec15 to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i32 0, i32 0))
  %element16 = getelementptr { i32, i8* }, { i32, i8* }* %rec15, i32 0, i32 0
  %field_var17 = load i32, i32* %element16
  call void @assert_equal_int(i32 %field_var17, i32 28)
  %rec18 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %frame_pointer, i32 0, i32 2
  %rec19 = load { i32, i8* }*, { i32, i8* }** %rec18
  %3 = bitcast { i32, i8* }* %rec19 to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i32 0, i32 0))
  %element20 = getelementptr { i32, i8* }, { i32, i8* }* %rec19, i32 0, i32 1
  %field_var21 = load i8*, i8** %element20
  call void @assert_equal_string(i8* %field_var21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0))
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define void @f({ i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }
  %arg_address = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 0, i32 0
  store { i32, { i32, i32* }*, { i32, i8* }* }* %0, { i32, { i32, i32* }*, { i32, i8* }* }** %arg_address
  %arg_address1 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 0, i32 2
  store i32 %1, i32* %arg_address1
  %arg_address2 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 0, i32 3
  store i32 %3, i32* %arg_address2
  %arg_address3 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 0, i32 4
  store i32 %4, i32* %arg_address3
  %var_dec = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 0, i32 1
  store i32 7, i32* %var_dec
  call void @g({ { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %frame_pointer, i32 4)
  ret void
}

define void @g({ { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }
  %arg_address = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  store { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %0, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %arg_address
  %fp_addr_in_sl = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl
  %a = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr, i32 0, i32 2
  %a1 = load i32, i32* %a
  call void @tig_print_int(i32 %a1)
  call void @tig_print_int(i32 %1)
  %fp_addr_in_sl3 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr4 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl3
  %c = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr4, i32 0, i32 3
  %c5 = load i32, i32* %c
  call void @tig_print_int(i32 %c5)
  %fp_addr_in_sl6 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr7 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl6
  %d = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr7, i32 0, i32 4
  %d8 = load i32, i32* %d
  call void @tig_print_int(i32 %d8)
  %fp_addr_in_sl9 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr10 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl9
  %fp_addr_in_sl11 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr10, i32 0, i32 0
  %fp_addr12 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl11
  %rec = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr12, i32 0, i32 2
  %load_left = load { i32, i8* }*, { i32, i8* }** %rec
  %2 = bitcast { i32, i8* }* %load_left to i8*
  call void @tig_check_null_pointer(i8* %2, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @1, i32 0, i32 0))
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %load_left, i32 0, i32 1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @8, i32 0, i32 0), i8** %element_left
  %fp_addr_in_sl13 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl13
  %fp_addr_in_sl15 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr14, i32 0, i32 0
  %fp_addr16 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl15
  %rec17 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr16, i32 0, i32 2
  %load_left18 = load { i32, i8* }*, { i32, i8* }** %rec17
  %3 = bitcast { i32, i8* }* %load_left18 to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @2, i32 0, i32 0))
  %element_left19 = getelementptr { i32, i8* }, { i32, i8* }* %load_left18, i32 0, i32 0
  %fp_addr_in_sl20 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr21 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl20
  %a22 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr21, i32 0, i32 2
  %a23 = load i32, i32* %a22
  %add_tmp = add i32 %a23, %1
  %fp_addr_in_sl25 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr26 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl25
  %c27 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr26, i32 0, i32 3
  %c28 = load i32, i32* %c27
  %add_tmp29 = add i32 %add_tmp, %c28
  %fp_addr_in_sl30 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr31 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl30
  %d32 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr31, i32 0, i32 4
  %d33 = load i32, i32* %d32
  %add_tmp34 = add i32 %add_tmp29, %d33
  %fp_addr_in_sl35 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr36 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl35
  %e = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr36, i32 0, i32 1
  %e37 = load i32, i32* %e
  %add_tmp38 = add i32 %add_tmp34, %e37
  %fp_addr_in_sl39 = getelementptr { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }, { { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr40 = load { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }*, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }** %fp_addr_in_sl39
  %fp_addr_in_sl41 = getelementptr { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }, { { i32, { i32, i32* }*, { i32, i8* }* }*, i32, i32, i32, i32 }* %fp_addr40, i32 0, i32 0
  %fp_addr42 = load { i32, { i32, i32* }*, { i32, i8* }* }*, { i32, { i32, i32* }*, { i32, i8* }* }** %fp_addr_in_sl41
  %arr1 = getelementptr { i32, { i32, i32* }*, { i32, i8* }* }, { i32, { i32, i32* }*, { i32, i8* }* }* %fp_addr42, i32 0, i32 1
  %arr143 = load { i32, i32* }*, { i32, i32* }** %arr1
  %4 = bitcast { i32, i32* }* %arr143 to i8*
  call void @tig_check_array_bound(i8* %4, i32 4, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @3, i32 0, i32 0))
  %array_pointer = getelementptr { i32, i32* }, { i32, i32* }* %arr143, i32 0, i32 1
  %arr_addr = load i32*, i32** %array_pointer
  %arr_ele_addr = getelementptr i32, i32* %arr_addr, i32 4
  %arr_ele = load i32, i32* %arr_ele_addr
  %add_tmp44 = add i32 %add_tmp38, %arr_ele
  store i32 %add_tmp44, i32* %element_left19
  ret void
}
