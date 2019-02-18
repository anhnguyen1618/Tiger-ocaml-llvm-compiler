; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::12.5: Nil pointer exception!\00"
@1 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::13.5: Nil pointer exception!\00"
@2 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::13.10: Nil pointer exception!\00"
@3 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::13.15: Nil pointer exception!\00"
@4 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::14.16: Nil pointer exception!\00"
@5 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::16.5: Nil pointer exception!\00"
@6 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::16.10: Nil pointer exception!\00"
@7 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::16.15: Nil pointer exception!\00"
@8 = private unnamed_addr constant [51 x i8] c"test/linked_list.tig::18.5: Nil pointer exception!\00"
@9 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::18.10: Nil pointer exception!\00"
@10 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::18.15: Nil pointer exception!\00"
@11 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::24.33: Nil pointer exception!\00"
@12 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::25.35: Nil pointer exception!\00"
@13 = private unnamed_addr constant [52 x i8] c"test/linked_list.tig::26.40: Nil pointer exception!\00"
@14 = private unnamed_addr constant [12 x i8] c"end program\00"

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
  %index = alloca i32
  %current_node = alloca { i32, i8* }*
  %d = alloca { i32, i8* }*
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
  %malloccall11 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init12 = bitcast i8* %malloccall11 to { i32, i8* }*
  %Element13 = getelementptr { i32, i8* }, { i32, i8* }* %record_init12, i32 0, i32 0
  store i32 4, i32* %Element13
  %Element14 = getelementptr { i32, i8* }, { i32, i8* }* %record_init12, i32 0, i32 1
  store i8* null, i8** %Element14
  store { i32, i8* }* %record_init12, { i32, i8* }** %d
  %c15 = load { i32, i8* }*, { i32, i8* }** %c
  store { i32, i8* }* %c15, { i32, i8* }** %current_node
  store i32 1, i32* %index
  %load_left = load { i32, i8* }*, { i32, i8* }** %b
  %1 = bitcast { i32, i8* }* %load_left to i8*
  call void @tig_check_null_pointer(i8* %1, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @0, i32 0, i32 0))
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %load_left, i32 0, i32 1
  %2 = bitcast i8** %element_left to { i32, i8* }**
  %a16 = load { i32, i8* }*, { i32, i8* }** %a
  store { i32, i8* }* %a16, { i32, i8* }** %2
  %load_left17 = load { i32, i8* }*, { i32, i8* }** %c
  %3 = bitcast { i32, i8* }* %load_left17 to i8*
  call void @tig_check_null_pointer(i8* %3, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @1, i32 0, i32 0))
  %element_left18 = getelementptr { i32, i8* }, { i32, i8* }* %load_left17, i32 0, i32 1
  %4 = bitcast i8** %element_left18 to { i32, i8* }**
  %load_left19 = load { i32, i8* }*, { i32, i8* }** %4
  %5 = bitcast { i32, i8* }* %load_left19 to i8*
  call void @tig_check_null_pointer(i8* %5, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @2, i32 0, i32 0))
  %element_left20 = getelementptr { i32, i8* }, { i32, i8* }* %load_left19, i32 0, i32 1
  %6 = bitcast i8** %element_left20 to { i32, i8* }**
  %load_left21 = load { i32, i8* }*, { i32, i8* }** %6
  %7 = bitcast { i32, i8* }* %load_left21 to i8*
  call void @tig_check_null_pointer(i8* %7, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @3, i32 0, i32 0))
  %element_left22 = getelementptr { i32, i8* }, { i32, i8* }* %load_left21, i32 0, i32 0
  store i32 5, i32* %element_left22
  %a23 = load { i32, i8* }*, { i32, i8* }** %a
  %8 = bitcast { i32, i8* }* %a23 to i8*
  call void @tig_check_null_pointer(i8* %8, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @4, i32 0, i32 0))
  %element = getelementptr { i32, i8* }, { i32, i8* }* %a23, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @assert_equal_int(i32 %field_var, i32 5)
  %load_left24 = load { i32, i8* }*, { i32, i8* }** %c
  %9 = bitcast { i32, i8* }* %load_left24 to i8*
  call void @tig_check_null_pointer(i8* %9, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @5, i32 0, i32 0))
  %element_left25 = getelementptr { i32, i8* }, { i32, i8* }* %load_left24, i32 0, i32 1
  %10 = bitcast i8** %element_left25 to { i32, i8* }**
  %load_left26 = load { i32, i8* }*, { i32, i8* }** %10
  %11 = bitcast { i32, i8* }* %load_left26 to i8*
  call void @tig_check_null_pointer(i8* %11, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @6, i32 0, i32 0))
  %element_left27 = getelementptr { i32, i8* }, { i32, i8* }* %load_left26, i32 0, i32 1
  %12 = bitcast i8** %element_left27 to { i32, i8* }**
  %load_left28 = load { i32, i8* }*, { i32, i8* }** %12
  %13 = bitcast { i32, i8* }* %load_left28 to i8*
  call void @tig_check_null_pointer(i8* %13, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @7, i32 0, i32 0))
  %element_left29 = getelementptr { i32, i8* }, { i32, i8* }* %load_left28, i32 0, i32 0
  store i32 3, i32* %element_left29
  %load_left30 = load { i32, i8* }*, { i32, i8* }** %c
  %14 = bitcast { i32, i8* }* %load_left30 to i8*
  call void @tig_check_null_pointer(i8* %14, i8* getelementptr inbounds ([51 x i8], [51 x i8]* @8, i32 0, i32 0))
  %element_left31 = getelementptr { i32, i8* }, { i32, i8* }* %load_left30, i32 0, i32 1
  %15 = bitcast i8** %element_left31 to { i32, i8* }**
  %load_left32 = load { i32, i8* }*, { i32, i8* }** %15
  %16 = bitcast { i32, i8* }* %load_left32 to i8*
  call void @tig_check_null_pointer(i8* %16, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @9, i32 0, i32 0))
  %element_left33 = getelementptr { i32, i8* }, { i32, i8* }* %load_left32, i32 0, i32 1
  %17 = bitcast i8** %element_left33 to { i32, i8* }**
  %load_left34 = load { i32, i8* }*, { i32, i8* }** %17
  %18 = bitcast { i32, i8* }* %load_left34 to i8*
  call void @tig_check_null_pointer(i8* %18, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @10, i32 0, i32 0))
  %element_left35 = getelementptr { i32, i8* }, { i32, i8* }* %load_left34, i32 0, i32 1
  %19 = bitcast i8** %element_left35 to { i32, i8* }**
  %d36 = load { i32, i8* }*, { i32, i8* }** %d
  store { i32, i8* }* %d36, { i32, i8* }** %19
  %current_node37 = load { i32, i8* }*, { i32, i8* }** %current_node
  %20 = bitcast { i32, i8* }* %current_node37 to i8*
  %21 = call i32 @tig_nillable(i8* %20)
  call void @tig_print_int(i32 %21)
  br label %test

break_loop:                                       ; No predecessors!
  ret i32 0

test:                                             ; preds = %loop, %entry
  %current_node38 = load { i32, i8* }*, { i32, i8* }** %current_node
  %22 = bitcast { i32, i8* }* %current_node38 to i8*
  %23 = call i32 @tig_nillable(i8* %22)
  %eq_tmp = icmp eq i32 %23, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 0
  br i1 %cond, label %end, label %loop

loop:                                             ; preds = %test
  %current_node39 = load { i32, i8* }*, { i32, i8* }** %current_node
  %24 = bitcast { i32, i8* }* %current_node39 to i8*
  call void @tig_check_null_pointer(i8* %24, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @11, i32 0, i32 0))
  %element40 = getelementptr { i32, i8* }, { i32, i8* }* %current_node39, i32 0, i32 0
  %field_var41 = load i32, i32* %element40
  call void @tig_print_int(i32 %field_var41)
  %current_node42 = load { i32, i8* }*, { i32, i8* }** %current_node
  %25 = bitcast { i32, i8* }* %current_node42 to i8*
  call void @tig_check_null_pointer(i8* %25, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @12, i32 0, i32 0))
  %element43 = getelementptr { i32, i8* }, { i32, i8* }* %current_node42, i32 0, i32 0
  %field_var44 = load i32, i32* %element43
  %index45 = load i32, i32* %index
  call void @assert_equal_int(i32 %field_var44, i32 %index45)
  %current_node46 = load { i32, i8* }*, { i32, i8* }** %current_node
  %26 = bitcast { i32, i8* }* %current_node46 to i8*
  call void @tig_check_null_pointer(i8* %26, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @13, i32 0, i32 0))
  %element47 = getelementptr { i32, i8* }, { i32, i8* }* %current_node46, i32 0, i32 1
  %field_var48 = load i8*, i8** %element47
  %27 = bitcast i8* %field_var48 to { i32, i8* }*
  store { i32, i8* }* %27, { i32, i8* }** %current_node
  %index49 = load i32, i32* %index
  %add_tmp = add i32 %index49, 1
  store i32 %add_tmp, i32* %index
  br label %test

end:                                              ; preds = %test
  call void @tig_print(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @14, i32 0, i32 0))
  %index50 = load i32, i32* %index
  call void @assert_equal_int(i32 %index50, i32 5)
  ret i32 0
}

declare noalias i8* @malloc(i32)
