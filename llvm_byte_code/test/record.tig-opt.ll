; ModuleID = 'llvm_byte_code/test/record.tig.ll'
source_filename = "Tiger jit"

@0 = private unnamed_addr constant [16 x i8] c"static_func.tig\00"
@1 = private unnamed_addr constant [6 x i8] c"world\00"
@2 = private unnamed_addr constant [6 x i8] c"hello\00"
@3 = private unnamed_addr constant [4 x i8] c"lol\00"

declare void @tig_print_int(i32) local_unnamed_addr

declare void @tig_print(i8*) local_unnamed_addr

declare void @assert_equal_int(i8*, i32, i32) local_unnamed_addr

declare void @assert_equal_string(i8*, i8*, i8*) local_unnamed_addr

define i32 @main() local_unnamed_addr {
entry:
  %frame_pointer = alloca { i32 }
  %malloccall = tail call i8* @malloc(i32 ptrtoint ({ i8*, i32 }* getelementptr ({ i8*, i32 }, { i8*, i32 }* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to { i8*, i32 }*
  %Element = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0), i8** %Element
  %Element1 = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 1
  store i32 10, i32* %Element1
  %malloccall3 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %record_init4 = bitcast i8* %malloccall3 to { i8*, { i8*, i32 }* }*
  %Element5 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 0
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0), i8** %Element5
  %Element6 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  store { i8*, i32 }* %record_init, { i8*, i32 }** %Element6
  %element = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 0
  %field_var = load i8*, i8** %element
  call void @tig_print(i8* %field_var)
  %element9 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 0
  %field_var10 = load i8*, i8** %element9
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var10, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @1, i32 0, i32 0))
  %element12 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var13 = load { i8*, i32 }*, { i8*, i32 }** %element12
  %element14 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var13, i32 0, i32 1
  %field_var15 = load i32, i32* %element14
  call void @tig_print_int(i32 %field_var15)
  %element17 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var18 = load { i8*, i32 }*, { i8*, i32 }** %element17
  %element19 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var18, i32 0, i32 1
  %field_var20 = load i32, i32* %element19
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var20, i32 10)
  %element_left = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %load_left21 = load { i8*, i32 }*, { i8*, i32 }** %element_left
  %element_left22 = getelementptr { i8*, i32 }, { i8*, i32 }* %load_left21, i32 0, i32 1
  store i32 100, i32* %element_left22
  %element24 = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 1
  %field_var25 = load i32, i32* %element24
  call void @assert_int({ i32 }* %frame_pointer, i32 %field_var25, i32 10)
  %element27 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var28 = load { i8*, i32 }*, { i8*, i32 }** %element27
  %element29 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var28, i32 0, i32 0
  %field_var30 = load i8*, i8** %element29
  call void @tig_print(i8* %field_var30)
  %element32 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var33 = load { i8*, i32 }*, { i8*, i32 }** %element32
  %element34 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var33, i32 0, i32 0
  %field_var35 = load i8*, i8** %element34
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var35, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @2, i32 0, i32 0))
  %element_left37 = getelementptr { i8*, i32 }, { i8*, i32 }* %record_init, i32 0, i32 0
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0), i8** %element_left37
  %element39 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var40 = load { i8*, i32 }*, { i8*, i32 }** %element39
  %element41 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var40, i32 0, i32 0
  %field_var42 = load i8*, i8** %element41
  call void @tig_print(i8* %field_var42)
  %element44 = getelementptr { i8*, { i8*, i32 }* }, { i8*, { i8*, i32 }* }* %record_init4, i32 0, i32 1
  %field_var45 = load { i8*, i32 }*, { i8*, i32 }** %element44
  %element46 = getelementptr { i8*, i32 }, { i8*, i32 }* %field_var45, i32 0, i32 0
  %field_var47 = load i8*, i8** %element46
  call void @assert_string({ i32 }* %frame_pointer, i8* %field_var47, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @3, i32 0, i32 0))
  ret i32 0
}

declare noalias i8* @malloc(i32) local_unnamed_addr

define void @assert_string({ i32 }*, i8*, i8*) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  call void @assert_equal_string(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i8* %1, i8* %2)
  ret void
}

define void @assert_int({ i32 }*, i32, i32) local_unnamed_addr {
entry:
  %frame_pointer = alloca { { i32 }* }
  %arg_address = getelementptr { { i32 }* }, { { i32 }* }* %frame_pointer, i32 0, i32 0
  store { i32 }* %0, { i32 }** %arg_address
  call void @assert_equal_int(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @0, i32 0, i32 0), i32 %1, i32 %2)
  ret void
}
