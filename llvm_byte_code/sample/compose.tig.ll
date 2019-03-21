; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

%main_fp = type { i32 }
%add_two = type { %main_fp* }
%double = type { %main_fp* }
%compose = type { %main_fp*, { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }* }
%h = type { %compose* }

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
  %add_two_then_double = alloca { i32 (i8*, i32)*, i8* }*
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32))
  %main_fp_fp = bitcast i8* %malloccall to %main_fp*
  %malloccall1 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %closure_addr = bitcast i8* %malloccall1 to { i32 (i8*, i32)*, i8* }*
  %closure_ele = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr, i32 0, i32 0
  store i32 (i8*, i32)* @double, i32 (i8*, i32)** %closure_ele
  %closure_env = bitcast %main_fp* %main_fp_fp to i8*
  %closure_ele2 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr, i32 0, i32 1
  store i8* %closure_env, i8** %closure_ele2
  %malloccall3 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %closure_addr4 = bitcast i8* %malloccall3 to { i32 (i8*, i32)*, i8* }*
  %closure_ele5 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr4, i32 0, i32 0
  store i32 (i8*, i32)* @add_two, i32 (i8*, i32)** %closure_ele5
  %closure_env6 = bitcast %main_fp* %main_fp_fp to i8*
  %closure_ele7 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr4, i32 0, i32 1
  store i8* %closure_env6, i8** %closure_ele7
  %0 = bitcast %main_fp* %main_fp_fp to i8*
  %1 = call { i32 (i8*, i32)*, i8* }* @compose(i8* %0, { i32 (i8*, i32)*, i8* }* %closure_addr, { i32 (i8*, i32)*, i8* }* %closure_addr4)
  store { i32 (i8*, i32)*, i8* }* %1, { i32 (i8*, i32)*, i8* }** %add_two_then_double
  %add_two_then_double8 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %add_two_then_double
  %closure_val_addr = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double8, i32 0, i32 0
  %closure_val = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr
  %closure_val_addr9 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double8, i32 0, i32 1
  %closure_val10 = load i8*, i8** %closure_val_addr9
  %2 = call i32 %closure_val(i8* %closure_val10, i32 5)
  call void @tig_print_int(i32 %2)
  %add_two_then_double11 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %add_two_then_double
  %closure_val_addr12 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double11, i32 0, i32 0
  %closure_val13 = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr12
  %closure_val_addr14 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double11, i32 0, i32 1
  %closure_val15 = load i8*, i8** %closure_val_addr14
  %3 = call i32 %closure_val13(i8* %closure_val15, i32 3)
  call void @assert_equal_int(i32 %3, i32 10)
  %add_two_then_double16 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %add_two_then_double
  %closure_val_addr17 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double16, i32 0, i32 0
  %closure_val18 = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr17
  %closure_val_addr19 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double16, i32 0, i32 1
  %closure_val20 = load i8*, i8** %closure_val_addr19
  %4 = call i32 %closure_val18(i8* %closure_val20, i32 0)
  call void @assert_equal_int(i32 %4, i32 4)
  %add_two_then_double21 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %add_two_then_double
  %closure_val_addr22 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double21, i32 0, i32 0
  %closure_val23 = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr22
  %closure_val_addr24 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %add_two_then_double21, i32 0, i32 1
  %closure_val25 = load i8*, i8** %closure_val_addr24
  %5 = call i32 %closure_val23(i8* %closure_val25, i32 -2)
  call void @assert_equal_int(i32 %5, i32 0)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

declare noalias i8* @malloc(i32)

define i32 @add_two(i8*, i32) gc "ocaml" {
entry:
  %x = alloca i32
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %add_two_fp = bitcast i8* %malloccall to %add_two*
  %static_link_addr = getelementptr %add_two, %add_two* %add_two_fp, i32 0, i32 0
  %parent_fp = bitcast i8* %0 to %main_fp*
  store %main_fp* %parent_fp, %main_fp** %static_link_addr
  store i32 %1, i32* %x
  %x1 = load i32, i32* %x
  %add_tmp = add i32 %x1, 2
  ret i32 %add_tmp
}

define i32 @double(i8*, i32) gc "ocaml" {
entry:
  %x = alloca i32
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %double_fp = bitcast i8* %malloccall to %double*
  %static_link_addr = getelementptr %double, %double* %double_fp, i32 0, i32 0
  %parent_fp = bitcast i8* %0 to %main_fp*
  store %main_fp* %parent_fp, %main_fp** %static_link_addr
  store i32 %1, i32* %x
  %x1 = load i32, i32* %x
  %mul_tmp = mul i32 %x1, 2
  ret i32 %mul_tmp
}

define { i32 (i8*, i32)*, i8* }* @compose(i8*, { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }*) gc "ocaml" {
entry:
  %malloccall = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 3) to i32))
  %compose_fp = bitcast i8* %malloccall to %compose*
  %static_link_addr = getelementptr %compose, %compose* %compose_fp, i32 0, i32 0
  %parent_fp = bitcast i8* %0 to %main_fp*
  store %main_fp* %parent_fp, %main_fp** %static_link_addr
  %arg_address = getelementptr %compose, %compose* %compose_fp, i32 0, i32 1
  store { i32 (i8*, i32)*, i8* }* %1, { i32 (i8*, i32)*, i8* }** %arg_address
  %arg_address1 = getelementptr %compose, %compose* %compose_fp, i32 0, i32 2
  store { i32 (i8*, i32)*, i8* }* %2, { i32 (i8*, i32)*, i8* }** %arg_address1
  %malloccall2 = tail call i8* @malloc(i32 trunc (i64 mul nuw (i64 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i64), i64 2) to i32))
  %closure_addr = bitcast i8* %malloccall2 to { i32 (i8*, i32)*, i8* }*
  %closure_ele = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr, i32 0, i32 0
  store i32 (i8*, i32)* @h, i32 (i8*, i32)** %closure_ele
  %closure_env = bitcast %compose* %compose_fp to i8*
  %closure_ele3 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %closure_addr, i32 0, i32 1
  store i8* %closure_env, i8** %closure_ele3
  ret { i32 (i8*, i32)*, i8* }* %closure_addr
}

define i32 @h(i8*, i32) gc "ocaml" {
entry:
  %x = alloca i32
  %malloccall = tail call i8* @malloc(i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32))
  %h_fp = bitcast i8* %malloccall to %h*
  %static_link_addr = getelementptr %h, %h* %h_fp, i32 0, i32 0
  %parent_fp = bitcast i8* %0 to %compose*
  store %compose* %parent_fp, %compose** %static_link_addr
  store i32 %1, i32* %x
  %x1 = load i32, i32* %x
  %fp_addr_in_sl = getelementptr %h, %h* %h_fp, i32 0, i32 0
  %fp_addr = load %compose*, %compose** %fp_addr_in_sl
  %g = getelementptr %compose, %compose* %fp_addr, i32 0, i32 2
  %g2 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %g
  %closure_val_addr = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %g2, i32 0, i32 0
  %closure_val = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr
  %closure_val_addr3 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %g2, i32 0, i32 1
  %closure_val4 = load i8*, i8** %closure_val_addr3
  %2 = call i32 %closure_val(i8* %closure_val4, i32 %x1)
  %fp_addr_in_sl5 = getelementptr %h, %h* %h_fp, i32 0, i32 0
  %fp_addr6 = load %compose*, %compose** %fp_addr_in_sl5
  %f = getelementptr %compose, %compose* %fp_addr6, i32 0, i32 1
  %f7 = load { i32 (i8*, i32)*, i8* }*, { i32 (i8*, i32)*, i8* }** %f
  %closure_val_addr8 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %f7, i32 0, i32 0
  %closure_val9 = load i32 (i8*, i32)*, i32 (i8*, i32)** %closure_val_addr8
  %closure_val_addr10 = getelementptr { i32 (i8*, i32)*, i8* }, { i32 (i8*, i32)*, i8* }* %f7, i32 0, i32 1
  %closure_val11 = load i8*, i8** %closure_val_addr10
  %3 = call i32 %closure_val9(i8* %closure_val11, i32 %2)
  ret i32 %3
}
