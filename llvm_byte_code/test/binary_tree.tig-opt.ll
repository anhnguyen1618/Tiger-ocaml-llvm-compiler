; ModuleID = 'llvm_byte_code/test/binary_tree.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [16 x i8] c"binary_tree.tig\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare i32 @tig_nillable(i8*) local_unnamed_addr

declare void @assert_equal_int(i8*, i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8*, i8* }*
  %Element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  %Element2 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 2
  store i8* null, i8** %Element2
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init4 = bitcast i8* %malloccall3 to { i32, i8*, i8* }*
  %Element5 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 0
  store i32 1, i32* %Element5
  %Element6 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 1
  store i8* null, i8** %Element6
  %Element7 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init4, i32 0, i32 2
  store i8* null, i8** %Element7
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init9 = bitcast i8* %malloccall8 to { i32, i8*, i8* }*
  %Element10 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 0
  store i32 2, i32* %Element10
  %Element11 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 1
  store i8* null, i8** %Element11
  %Element12 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 2
  store i8* null, i8** %Element12
  %malloccall13 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init14 = bitcast i8* %malloccall13 to { i32, i8*, i8* }*
  %Element15 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 0
  store i32 3, i32* %Element15
  %Element16 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 1
  store i8* null, i8** %Element16
  %Element17 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init14, i32 0, i32 2
  store i8* null, i8** %Element17
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init19 = bitcast i8* %malloccall18 to { i32, i8*, i8* }*
  %Element20 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 0
  store i32 6, i32* %Element20
  %Element21 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 1
  store i8* null, i8** %Element21
  %Element22 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init19, i32 0, i32 2
  store i8* null, i8** %Element22
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init24 = bitcast i8* %malloccall23 to { i32, i8*, i8* }*
  %Element25 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 0
  store i32 8, i32* %Element25
  %Element26 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 1
  store i8* null, i8** %Element26
  %Element27 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 2
  store i8* null, i8** %Element27
  %malloccall28 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8*, i8* }* getelementptr ({ i32, i8*, i8* }, { i32, i8*, i8* }* null, i32 1) to i32))
  %record_init29 = bitcast i8* %malloccall28 to { i32, i8*, i8* }*
  %Element30 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 0
  store i32 9, i32* %Element30
  %Element31 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 1
  store i8* null, i8** %Element31
  %Element32 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init29, i32 0, i32 2
  store i8* null, i8** %Element32
  %element_left = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 1
  %0 = bitcast { i32, i8*, i8* }* %record_init9 to i8*
  store i8* %0, i8** %element_left
  %element_left35 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init, i32 0, i32 2
  %1 = bitcast { i32, i8*, i8* }* %record_init24 to i8*
  store i8* %1, i8** %element_left35
  %element_left38 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 1
  %2 = bitcast { i32, i8*, i8* }* %record_init4 to i8*
  store i8* %2, i8** %element_left38
  %element_left41 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init9, i32 0, i32 2
  %3 = bitcast { i32, i8*, i8* }* %record_init14 to i8*
  store i8* %3, i8** %element_left41
  %element_left44 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 1
  %4 = bitcast { i32, i8*, i8* }* %record_init19 to i8*
  store i8* %4, i8** %element_left44
  %element_left47 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %record_init24, i32 0, i32 2
  %5 = bitcast { i32, i8*, i8* }* %record_init29 to i8*
  store i8* %5, i8** %element_left47
  %6 = call i32 @eval_sum({ i32 }* %frame_pointer, { i32, i8*, i8* }* %record_init)
  call void @tig_print_int(i32 %6)
  %7 = call i32 @eval_sum({ i32 }* %frame_pointer, { i32, i8*, i8* }* %record_init)
  call void @assert_equal_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %7, i32 34)
  ret i32 0
}

define i32 @eval_sum({ i32 }*, { i32, i8*, i8* }*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  br label %test

test:                                             ; preds = %entry
  %2 = bitcast { i32, i8*, i8* }* %1 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  br label %merge

else:                                             ; preds = %test
  %element = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 0
  %field_var = load i32, i32* %element
  %element4 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 1
  %field_var5 = load i8*, i8** %element4
  %4 = bitcast i8* %field_var5 to { i32, i8*, i8* }*
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %5 = call i32 @eval_sum({ i32 }* %fp_addr, { i32, i8*, i8* }* %4)
  %add_tmp = add i32 %field_var, %5
  %element7 = getelementptr { i32, i8*, i8* }, { i32, i8*, i8* }* %1, i32 0, i32 2
  %field_var8 = load i8*, i8** %element7
  %6 = bitcast i8* %field_var8 to { i32, i8*, i8* }*
  %fp_addr_in_sl9 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr10 = load { i32 }*, { i32 }** %fp_addr_in_sl9
  %7 = call i32 @eval_sum({ i32 }* %fp_addr10, { i32, i8*, i8* }* %6)
  %add_tmp11 = add i32 %add_tmp, %7
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result_addr.0 = phi i32 [ 0, %then ], [ %add_tmp11, %else ]
  ret i32 %if_result_addr.0
}

declare noalias i8* @malloc(i32) local_unnamed_addr
