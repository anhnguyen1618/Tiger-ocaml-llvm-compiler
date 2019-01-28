; ModuleID = 'llvm_byte_code/test/linked_list.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [16 x i8] c"linked_list.tig\00"
@1 = private unnamed_addr constant [12 x i8] c"end program\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare i32 @tig_nillable(i8*) local_unnamed_addr

declare void @assert_equal_int(i8*, i32, i32) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
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
  %element_left = getelementptr { i32, i8* }, { i32, i8* }* %record_init3, i32 0, i32 1
  %1 = bitcast { i32, i8* }* %record_init to i8*
  store i8* %1, i8** %element_left
  %2 = bitcast { i32, i8* }* %record_init8 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  call void @tig_print_int(i32 %3)
  br label %test

test:                                             ; preds = %loop, %entry
  %current_node.0 = phi { i32, i8* }* [ %record_init8, %entry ], [ %6, %loop ]
  %index.0 = phi i32 [ 1, %entry ], [ %add_tmp, %loop ]
  %4 = bitcast { i32, i8* }* %current_node.0 to i8*
  %5 = call i32 @tig_nillable(i8* %4)
  %eq_tmp = icmp eq i32 %5, 0
  %bool_tmp = zext i1 %eq_tmp to i32
  %cond = icmp eq i32 %bool_tmp, 1
  br i1 %cond, label %loop, label %end

loop:                                             ; preds = %test
  %element = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 0
  %field_var = load i32, i32* %element
  call void @tig_print_int(i32 %field_var)
  %element17 = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 0
  %field_var18 = load i32, i32* %element17
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var18, i32 %index.0)
  %element21 = getelementptr { i32, i8* }, { i32, i8* }* %current_node.0, i32 0, i32 1
  %field_var22 = load i8*, i8** %element21
  %6 = bitcast i8* %field_var22 to { i32, i8* }*
  %add_tmp = add i32 %index.0, 1
  br label %test

end:                                              ; preds = %test
  %index.0.lcssa = phi i32 [ %index.0, %test ]
  call void @tig_print(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @1, i32 0, i32 0))
  call void @assert_int({ i32 }* %frame_pointer, i32 %index.0.lcssa, i32 4)
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define void @assert_int({ i32 }*, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  call void @assert_equal_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %1, i32 %2)
  ret void
}
