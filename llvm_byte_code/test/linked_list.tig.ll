; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [16 x i8] c"linked_list.tig\00"
@1 = private unnamed_addr constant [12 x i8] c"end program\00"

declare void @tig_print_int(i32)

declare void @tig_print(i8*)

declare void @print_arr_int_ele(i32)

declare i32* @tig_init_array(i32, i32)

declare i32* @tig_init_record(i32)

declare i32 @tig_array_length(i8*)

declare i32 @tig_nillable(i8*)

declare void @tig_check_array_bound(i8*, i32, i8*)

declare i32 @tig_random(i32)

declare void @tig_exit(i32)

declare void @tig_flush()

declare i8* @tig_getchar()

declare i32 @tig_ord(i8*)

declare i8* @tig_chr(i32)

declare i32 @tig_string_cmp(i8*, i8*)

declare i32 @tig_size(i8*)

declare i8* @tig_substring(i8*, i32, i32)

declare i8* @tig_concat(i8*, i8*)

declare i32 @tig_not(i32)

declare void @assert_equal_int(i8*, i32, i32)

declare void @assert_equal_string(i8*, i8*, i8*)

define i32 @main() {
entry:
  %index = alloca i32
  %current_node = alloca { i32, i8* }*
  %c = alloca { i32, i8* }*
  %b = alloca { i32, i8* }*
  %a = alloca { i32, i8* }*
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 3, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  store { i32, i8* }* %record_init, { i32, i8* }** %a
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init3 = bitcast i8* %malloccall2 to { i32, i8* }*
  %Element4 = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 0
  store i32 2, i32* %Element4
  %Element5 = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 1
  store i8* null, i8** %Element5
  store { i32, i8* }* %record_init3, { i32, i8* }** %b
  %b6 = load { i32, i8* }*, { i32, i8* }** %b
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init8 = bitcast i8* %malloccall7 to { i32, i8* }*
  %0 = bitcast { i32, i8* }* %b6 to i8*
  %Element9 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 0
  store i32 1, i32* %Element9
  %Element10 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 1
  store i8* %0, i8** %Element10
  store { i32, i8* }* %record_init8, { i32, i8* }** %c
  %c11 = load { i32, i8* }*, { i32, i8* }** %c
  store { i32, i8* }* %c11, { i32, i8* }** %current_node
  store i32 1, i32* %index
  %load_left = load { i32, i8* }*, { i32, i8* }** %b
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %load_left, i32 0, i32 1
  %a12 = load { i32, i8* }*, { i32, i8* }** %a
  %1 = bitcast { i32, i8* }* %a12 to i8*
  store i8* %1, i8** %element_left
  %current_node13 = load { i32, i8* }*, { i32, i8* }** %current_node
  %2 = bitcast { i32, i8* }* %current_node13 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @tig_print_int(i32 %3)
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %current_node14 = load { i32, i8* }*, { i32, i8* }** %current_node
  %4 = bitcast { i32, i8* }* %current_node14 to i8*
  %5 = call i32 @tig_nillable(i8* %4)
  %eq_tmp = icmp eq i32 %5, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %current_node15 = load { i32, i8* }*, { i32, i8* }** %current_node
  %element = getelementptr { i32, i8* }, { i32, i8* }* %current_node15, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  %current_node16 = load { i32, i8* }*, { i32, i8* }** %current_node
  %element17 = getelementptr { i32, i8* }, { i32, i8* }* %current_node16, i32 0, i32 0
  %field_var18 = load i32, i32* %element17
  %index19 = load i32, i32* %index
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var18, i32 %index19)
  %current_node20 = load { i32, i8* }*, { i32, i8* }** %current_node
  %element21 = getelementptr { i32, i8* }, { i32, i8* }* %current_node20, i32 0, i32 1
  %field_var22 = load i8*, i8** %element21
  %6 = bitcast i8* %field_var22 to { i32, i8* }*
  store { i32, i8* }* %6, { i32, i8* }** %current_node
  %index23 = load i32, i32* %index
  %add_tmp = add i32 %index23, 1
  store i32 %add_tmp, i32* %index
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0))
  %index24 = load i32, i32* %index
  call void @assert_int({ i32 }* %frame_pointer, i32 %index24, i32 4)
  ret i32 0
}

declare noalias i8* @malloc(i32)

define void @assert_int({ i32 }*, i32, i32) {
entry:
  %expected = alloca i32
  %actual = alloca i32
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  store i32 %1, i32* %actual
  store i32 %2, i32* %expected
  %actual1 = load i32, i32* %actual
  %expected2 = load i32, i32* %expected
  call void @assert_equal_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %actual1, i32 %expected2)
  ret void
}
