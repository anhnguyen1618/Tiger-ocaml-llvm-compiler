; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [13 x i8] c"Demo program\00"
@1 = private unnamed_addr constant [41 x i8] c"test/demo.tig::14.20: Array out of bound\00"
@2 = private unnamed_addr constant [45 x i8] c"test/demo.tig::14.23: Nil pointer exception!\00"
@3 = private unnamed_addr constant [45 x i8] c"test/demo.tig::19.19: Nil pointer exception!\00"

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
  %counter = alloca i32
  %arr = alloca { i32, { i32, i8* }** }*
  %i = alloca i32
  %array_size = alloca i32
  %record = alloca { i32, i8* }*
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* getelementptr inbounds ([13 x i8], [13 x i8]* @0, i32 0, i32 0), i8** %Element1
  store { i32, i8* }* %record_init, { i32, i8* }** %record
  store i32 5, i32* %array_size
  %array_size2 = load i32, i32* %array_size
  %record3 = load { i32, i8* }*, { i32, i8* }** %record
  %mallocsize = mul i32 %array_size2, ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32)
  %malloccall4 = tail call i8* @malloc(i32 %mallocsize)
  %array_init = bitcast i8* %malloccall4 to { i32, i8* }**
  store i32 0, i32* %i
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %i5 = load i32, i32* %i
  %lt_tmp = icmp slt i32 %i5, %array_size2
  %bool_tmp = zext i1 %lt_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %i6 = load i32, i32* %i
  %Element7 = getelementptr { i32, i8* }*, { i32, i8* }** %array_init, i32 %i6
  store { i32, i8* }* %record3, { i32, i8* }** %Element7
  %add_tmp = add i32 %i6, 1
  store i32 %add_tmp, i32* %i
  br label %test

end:                                              ; preds = %test
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint ({ i32, { i32, i8* }** }* getelementptr ({ i32, { i32, i8* }** }, { i32, { i32, i8* }** }* null, i32 1) to i32))
  %array_wrapper = bitcast i8* %malloccall8 to { i32, { i32, i8* }** }*
  %array_info = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 0
  store i32 %array_size2, i32* %array_info
  %array_info9 = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %array_wrapper, i32 0, i32 1
  store { i32, i8* }** %array_init, { i32, i8* }*** %array_info9
  store { i32, { i32, i8* }** }* %array_wrapper, { i32, { i32, i8* }** }** %arr
  %arr10 = load { i32, { i32, i8* }** }*, { i32, { i32, i8* }** }** %arr
  %0 = bitcast { i32, { i32, i8* }** }* %arr10 to i8*
  call void @tig_check_array_bound(i8* %0, i32 0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @1, i32 0, i32 0))
  %array_pointer = getelementptr { i32, { i32, i8* }** }, { i32, { i32, i8* }** }* %arr10, i32 0, i32 1
  %arr_addr = load { i32, i8* }**, { i32, i8* }*** %array_pointer
  %arr_ele_addr = getelementptr { i32, i8* }*, { i32, i8* }** %arr_addr, i32 0
  %arr_ele = load { i32, i8* }*, { i32, i8* }** %arr_ele_addr
  %1 = bitcast { i32, i8* }* %arr_ele to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @2, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %arr_ele, i32 0, i32 0
  %field_var = load i32, i32* %element
  store i32 %field_var, i32* %counter
  br label %test11

test11:                                           ; preds = %loop12, %end
  %counter14 = load i32, i32* %counter
  %gt_tmp = icmp sgt i32 %counter14, 0
  %bool_tmp15 = zext i1 %gt_tmp to i32
  %cond16 = icmp eq i32 %bool_tmp15, 0
  br i1 %cond16, label %end13, label %loop12

loop12:                                           ; preds = %test11
  %counter17 = load i32, i32* %counter
  %2 = call i32 @fib({ i32 }* %frame_pointer, i32 %counter17)
  call void @tig_print_int(i32 %2)
  %record18 = load { i32, i8* }*, { i32, i8* }** %record
  %3 = bitcast { i32, i8* }* %record18 to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @3, i32 0, i32 0))
  %element19 = getelementptr { i32, i8* }, { i32, i8* }* %record18, i32 0, i32 1
  %field_var20 = load i8*, i8** %element19
  call void @tig_print(i8* %field_var20)
  %counter21 = load i32, i32* %counter
  %minus_tmp = sub i32 %counter21, 1
  store i32 %minus_tmp, i32* %counter
  br label %test11

end13:                                            ; preds = %test11
  ret i32 0
}

declare noalias i8* @malloc(i32)

define i32 @fib({ i32 }*, i32) gc "ocaml" {
entry:
  %if_result_addr15 = alloca i32
  %if_result_addr = alloca i32
  %n = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %n
  br label %test

test:                                             ; preds = %entry
  %n1 = load i32, i32* %n
  %eq_tmp = icmp eq i32 %n1, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %else, label %then

then:                                             ; preds = %test
  store i32 0, i32* %if_result_addr15
  br label %merge

else:                                             ; preds = %test
  br label %test2

merge:                                            ; preds = %merge5, %then
  %if_result16 = load i32, i32* %if_result_addr15
  ret i32 %if_result16

test2:                                            ; preds = %else
  %n6 = load i32, i32* %n
  %eq_tmp7 = icmp eq i32 %n6, 1
  %bool_tmp8 = zext i1 %eq_tmp7 to i32
  %cond9 = icmp eq i32 %bool_tmp8, 0
  br i1 %cond9, label %else4, label %then3

then3:                                            ; preds = %test2
  store i32 1, i32* %if_result_addr
  br label %merge5

else4:                                            ; preds = %test2
  %n10 = load i32, i32* %n
  %minus_tmp = sub i32 %n10, 1
  %fp_addr_in_sl = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr = load { i32 }*, { i32 }** %fp_addr_in_sl
  %2 = call i32 @fib({ i32 }* %fp_addr, i32 %minus_tmp)
  %n11 = load i32, i32* %n
  %minus_tmp12 = sub i32 %n11, 2
  %fp_addr_in_sl13 = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  %fp_addr14 = load { i32 }*, { i32 }** %fp_addr_in_sl13
  %3 = call i32 @fib({ i32 }* %fp_addr14, i32 %minus_tmp12)
  %add_tmp = add i32 %2, %3
  store i32 %add_tmp, i32* %if_result_addr
  br label %merge5

merge5:                                           ; preds = %else4, %then3
  %if_result = load i32, i32* %if_result_addr
  store i32 %if_result, i32* %if_result_addr15
  br label %merge
}
