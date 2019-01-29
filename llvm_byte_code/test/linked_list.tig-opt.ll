; ModuleID = 'llvm_byte_code/test/linked_list.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [12 x i8] c"end program\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare i32 @tig_nillable(i8*) local_unnamed_addr

declare void @assert_equal_int(i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i32, i8* }*
  %Element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  store i32 3, i32* %Element
  %Element1 = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init3 = bitcast i8* %malloccall2 to { i32, i8* }*
  %Element4 = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 0
  store i32 2, i32* %Element4
  %Element5 = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 1
  store i8* null, i8** %Element5
  %malloccall7 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init8 = bitcast i8* %malloccall7 to { i32, i8* }*
  %0 = bitcast { i32, i8* }* %record_init3 to i8*
  %Element9 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 0
  store i32 1, i32* %Element9
  %Element10 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 1
  store i8* %0, i8** %Element10
  %malloccall11 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8* }* getelementptr ({ i32, i8* }, { i32, i8* }* null, i32 1) to i32))
  %record_init12 = bitcast i8* %malloccall11 to { i32, i8* }*
  %Element13 = getelementptr { i32, i8* }, { i32, i8* }* %record_init12, i32 0, i32 0
  store i32 4, i32* %Element13
  %Element14 = getelementptr { i32, i8* }, { i32, i8* }* %record_init12, i32 0, i32 1
  store i8* null, i8** %Element14
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 1
  %1 = bitcast i8** %element_left to { i32, i8* }**
  store { i32, i8* }* %record_init, { i32, i8* }** %1
  %element_left18 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 1
  %2 = bitcast i8** %element_left18 to { i32, i8* }**
  %load_left19 = load { i32, i8* }*, { i32, i8* }** %2
  %element_left20 = getelementptr { i32, i8* }, { i32, i8* }* %load_left19, i32 0, i32 1
  %3 = bitcast i8** %element_left20 to { i32, i8* }**
  %load_left21 = load { i32, i8* }*, { i32, i8* }** %3
  %element_left22 = getelementptr { i32, i8* }, { i32, i8* }* %load_left21, i32 0, i32 0
  store i32 5, i32* %element_left22
  %element = getelementptr { i32, i8* }, { i32, i8* }* %record_init, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @assert_equal_int(i32 %field_var, i32 5)
  %element_left25 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 1
  %4 = bitcast i8** %element_left25 to { i32, i8* }**
  %load_left26 = load { i32, i8* }*, { i32, i8* }** %4
  %element_left27 = getelementptr { i32, i8* }, { i32, i8* }* %load_left26, i32 0, i32 1
  %5 = bitcast i8** %element_left27 to { i32, i8* }**
  %load_left28 = load { i32, i8* }*, { i32, i8* }** %5
  %element_left29 = getelementptr { i32, i8* }, { i32, i8* }* %load_left28, i32 0, i32 0
  store i32 3, i32* %element_left29
  %element_left31 = getelementptr { i32, i8* }, { i32, i8* }* %record_init8, i32 0, i32 1
  %6 = bitcast i8** %element_left31 to { i32, i8* }**
  %load_left32 = load { i32, i8* }*, { i32, i8* }** %6
  %element_left33 = getelementptr { i32, i8* }, { i32, i8* }* %load_left32, i32 0, i32 1
  %7 = bitcast i8** %element_left33 to { i32, i8* }**
  %load_left34 = load { i32, i8* }*, { i32, i8* }** %7
  %element_left35 = getelementptr { i32, i8* }, { i32, i8* }* %load_left34, i32 0, i32 1
  %8 = bitcast i8** %element_left35 to { i32, i8* }**
  store { i32, i8* }* %record_init12, { i32, i8* }** %8
  %9 = bitcast { i32, i8* }* %record_init8 to i8*
  %10 = call i32 @tig_nillable(i8* %9)
  call void @tig_print_int(i32 %10)
  br label %test

test:                                             ; preds = %loop, %entry
  %current_node.0 = phi { i32, i8* }* [ %record_init8, %entry ], [ %13, %loop ]
  %index.0 = phi i32 [ 1, %entry ], [ %add_tmp, %loop ]
  %11 = bitcast { i32, i8* }* %current_node.0 to i8*
  %12 = call i32 @tig_nillable(i8* %11)
  %eq_tmp = icmp eq i32 %12, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %element40 = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 0
  %field_var41 = load i32, i32* %element40
  call void @tig_print_int(i32 %field_var41)
  %element43 = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 0
  %field_var44 = load i32, i32* %element43
  call void @assert_equal_int(i32 %field_var44, i32 %index.0)
  %element47 = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 1
  %field_var48 = load i8*, i8** %element47
  %13 = bitcast i8* %field_var48 to { i32, i8* }*
  %add_tmp = add i32 %index.0, 1
  br label %test

end:                                              ; preds = %test
  %index.0.lcssa = phi i32 [ %index.0, %test ]
  call void @tig_print(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @0, i32 0, i32 0))
  call void @assert_equal_int(i32 %index.0.lcssa, i32 5)
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr
