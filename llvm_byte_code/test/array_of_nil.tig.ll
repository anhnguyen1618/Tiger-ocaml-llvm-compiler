; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [53 x i8] c"test/array_of_nil.tig::10.17: Nil pointer exception!\00"
@1 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::16.25: Array out of bound\00"
@2 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::17.26: Array out of bound\00"
@3 = private unnamed_addr constant [49 x i8] c"test/array_of_nil.tig::18.26: Array out of bound\00"
@4 = private unnamed_addr constant [53 x i8] c"test/array_of_nil.tig::21.18: Nil pointer exception!\00"

declare void @tig_print_int(i32) gc "ocaml"

declare void @tig_print(i8*) gc "ocaml"

declare void @print_arr_int_ele(i32) gc "ocaml"

declare i32* @tig_init_array(i32, i32) gc "ocaml"

declare i32* @tig_init_record(i32) gc "ocaml"

declare i32 @tig_array_length(i8*) gc "ocaml"

declare i32 @tig_nillable(i8*) gc "ocaml"

declare void @tig_check_array_bound(i8*, i32, i8*) gc "ocaml"

declare void @tig_check_null_pointer(i8*, i8*) gc "ocaml"

declare i32 @tig_random(i32) gc "ocaml"

declare void @tig_exit(i32) gc "ocaml"

declare void @tig_flush() gc "ocaml"

declare i8* @tig_getchar() gc "ocaml"

declare i32 @tig_ord(i8*) gc "ocaml"

declare i8* @tig_chr(i32) gc "ocaml"

declare i32 @tig_string_cmp(i8*, i8*) gc "ocaml"

declare i32 @tig_size(i8*) gc "ocaml"

declare i8* @tig_substring(i8*, i32, i32) gc "ocaml"

declare i8* @tig_concat(i8*, i8*) gc "ocaml"

declare i32 @tig_not(i32) gc "ocaml"

declare void @assert_equal_int(i32, i32) gc "ocaml"

declare void @assert_equal_string(i8*, i8*) gc "ocaml"

define i32 @main() gc "ocaml" {
entry:
  %arr2 = alloca { i32, { i32, i8* }** }*
  %i28 = alloca i32
  %arr1 = alloca { i32, { i32, i8* }** }*
  %i10 = alloca i32
  %arr = alloca { i32, { i32, i8* }** }*
  %i = alloca i32
  %nil_var = alloca { i32, i8* }*
  %x = alloca { i32, i8* }*
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 1, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  store { i32, i8* }* %record_init, { i32, i8* }** %x
  store { i32, i8* }* null, { i32, i8* }** %nil_var
  %0 = call { i32, i8* }* @f({ i32 }* %frame_pointer)
  %malloccall2 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 5))
  %array_init = bitcast i8* %malloccall2 to { i32, i8* }**
  store i32 0, i32* %i
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %i3 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i3, 5
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %i4 = load i32, i32* %i
  %Element5 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init, i32 %i4
  store { i32, i8* }* %0, { i32, i8* }** %Element5
  %add_tmp = add i32 %i4, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32, i8* }** }* getelementptr ({ i32, { i32, i8* }** }, { i32, { i32, i8* }** }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall6 to { i32, { i32, i8* }** }*
  %array_info = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 0
  store i32 5, i32* %array_info
  %array_info7 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 1
  store { i32, i8* }** %array_init, { i32, i8* }*** %array_info7
  store { i32, { i32, i8* }** }* %array_wrapper, { i32, { i32, i8* }** }** %arr
  %malloccall8 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 5))
  %array_init9 = bitcast i8* %malloccall8 to { i32, i8* }**
  store i32 0, i32* %i10
  br label %test11

test11:                                           ; preds = %loop12, %end
  %i14 = load i32, i32* %i10
  %lt_tmp15 = icmp slt i32 %i14, 5
  %bool_tmp16 = zext i1 %lt_tmp15 to i32
  %cond17 = icmp eq i32 %bool_tmp16, 0
  br i1 %cond17, label %end13, label %loop12

loop12:                                           ; preds = %test11
  %i18 = load i32, i32* %i10
  %Element19 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init9, i32 %i18
  store { i32, i8* }* null, { i32, i8* }** %Element19
  %add_tmp20 = add i32 %i18, 1
  store i32 %add_tmp20, i32* %i10
  br label %test11

end13:                                            ; preds = %test11
  %malloccall21 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32, i8* }** }* getelementptr ({ i32, { i32, i8* }** }, { i32, { i32, i8* }** }* null, i32 1) to i32))
  %array_wrapper22 = bitcast i8* %malloccall21 to { i32, { i32, i8* }** }*
  %array_info23 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper22, i32 0, i32 0
  store i32 5, i32* %array_info23
  %array_info24 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper22, i32 0, i32 1
  store { i32, i8* }** %array_init9, { i32, i8* }*** %array_info24
  store { i32, { i32, i8* }** }* %array_wrapper22, { i32, { i32, i8* }** }** %arr1
  %nil_var25 = load { i32, i8* }*, { i32, i8* }** %nil_var
  %malloccall26 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 5))
  %array_init27 = bitcast i8* %malloccall26 to { i32, i8* }**
  store i32 0, i32* %i28
  br label %test29

test29:                                           ; preds = %loop30, %end13
  %i32 = load i32, i32* %i28
  %lt_tmp33 = icmp slt i32 %i32, 5
  %bool_tmp34 = zext i1 %lt_tmp33 to i32
  %cond35 = icmp eq i32 %bool_tmp34, 0
  br i1 %cond35, label %end31, label %loop30

loop30:                                           ; preds = %test29
  %i36 = load i32, i32* %i28
  %Element37 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init27, i32 %i36
  store { i32, i8* }* %nil_var25, { i32, i8* }** %Element37
  %add_tmp38 = add i32 %i36, 1
  store i32 %add_tmp38, i32* %i28
  br label %test29

end31:                                            ; preds = %test29
  %malloccall39 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32, i8* }** }* getelementptr ({ i32, { i32, i8* }** }, { i32, { i32, i8* }** }* null, i32 1) to i32))
  %array_wrapper40 = bitcast i8* %malloccall39 to { i32, { i32, i8* }** }*
  %array_info41 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper40, i32 0, i32 0
  store i32 5, i32* %array_info41
  %array_info42 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper40, i32 0, i32 1
  store { i32, i8* }** %array_init27, { i32, i8* }*** %array_info42
  store { i32, { i32, i8* }** }* %array_wrapper40, { i32, { i32, i8* }** }** %arr2
  %arr43 = load { i32, { i32, i8* }** }*, { i32, { i32, i8* }** }** %arr
  %1 = bitcast { i32, { i32, i8* }** }* %arr43 to i8*
  call void @tig_check_array_bound(i8* %1, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %arr43, i32 0, i32 1
  %arr_addr = load { i32, i8* }**, { i32, i8* }*** %array_pointer
  %arr_ele_addr = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr, i32 1
  %arr_ele = load { i32, i8* }*, { i32, i8* }** %arr_ele_addr
  %2 = bitcast { i32, i8* }* %arr_ele to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @assert_equal_int(i32 %3, i32 1)
  %arr144 = load { i32, { i32, i8* }** }*, { i32, { i32, i8* }** }** %arr1
  %4 = bitcast { i32, { i32, i8* }** }* %arr144 to i8*
  call void @tig_check_array_bound(i8* %4, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @2, i32 0, i32 0))
  %array_pointer45 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %arr144, i32 0, i32 1
  %arr_addr46 = load { i32, i8* }**, { i32, i8* }*** %array_pointer45
  %arr_ele_addr47 = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr46, i32 1
  %arr_ele48 = load { i32, i8* }*, { i32, i8* }** %arr_ele_addr47
  %5 = bitcast { i32, i8* }* %arr_ele48 to i8*
  %6 = call i32 @tig_nillable(i8* %5)
  call void @assert_equal_int(i32 %6, i32 1)
  %arr249 = load { i32, { i32, i8* }** }*, { i32, { i32, i8* }** }** %arr2
  %7 = bitcast { i32, { i32, i8* }** }* %arr249 to i8*
  call void @tig_check_array_bound(i8* %7, i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @3, i32 0, i32 0))
  %array_pointer50 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %arr249, i32 0, i32 1
  %arr_addr51 = load { i32, i8* }**, { i32, i8* }*** %array_pointer50
  %arr_ele_addr52 = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr51, i32 1
  %arr_ele53 = load { i32, i8* }*, { i32, i8* }** %arr_ele_addr52
  %8 = bitcast { i32, i8* }* %arr_ele53 to i8*
  %9 = call i32 @tig_nillable(i8* %8)
  call void @assert_equal_int(i32 %9, i32 1)
  %10 = call i32 @g({ i32 }* %frame_pointer, { i32, i8* }* null)
  call void @assert_equal_int(i32 %10, i32 0)
  %x54 = load { i32, i8* }*, { i32, i8* }** %x
  %11 = call i32 @g({ i32 }* %frame_pointer, { i32, i8* }* %x54)
  call void @assert_equal_int(i32 %11, i32 1)
  %x55 = load { i32, i8* }*, { i32, i8* }** %x
  %12 = bitcast { i32, i8* }* %x55 to i8*
  call void @tig_check_null_pointer(i8* %12, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @4, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %x55, i32 0, i32 1
  %field_var = load i8*, i8** %element
  %13 = bitcast i8* %field_var to { i32, i8* }*
  %14 = call i32 @g({ i32 }* %frame_pointer, { i32, i8* }* %13)
  call void @assert_equal_int(i32 %14, i32 0)
  ret i32 0
}

declare noalias i8* @malloc(i32)

define { i32, i8* }* @f({ i32 }*) gc "ocaml" {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  ret { i32, i8* }* null
}

define i32 @g({ i32 }*, { i32, i8* }*) gc "ocaml" {
entry:
  %if_result_addr = alloca i32
  %node = alloca { i32, i8* }*
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store { i32, i8* }* %1, { i32, i8* }** %node
  br label %test

test:                                             ; preds = %entry
  %node1 = load { i32, i8* }*, { i32, i8* }** %node
  %2 = bitcast { i32, i8* }* %node1 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %test
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  %node2 = load { i32, i8* }*, { i32, i8* }** %node
  %4 = bitcast { i32, i8* }* %node2 to i8*
  call void @tig_check_null_pointer(i8* %4, i8* getelementptr inbounds ([53 x i8], [53 x i8]* @0, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %node2, i32 0, i32 0
  %field_var = load i32, i32* %element
  store i32 %field_var, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  ret i32 %if_result
}
