; ModuleID = 'Tiger jit'
source_filename = "Tiger jit"

%0 = type { i32, i8*, i8* }
%1 = type { i32, i8*, i8* }
%2 = type { i32, i8*, i8* }
%3 = type { i32, i8*, i8* }
%4 = type { i32, i8*, i8* }
%5 = type { i32, i8*, i8* }
%6 = type { i32, i8*, i8* }
%7 = type { i32, i8*, i8* }
%8 = type { i32, i8*, i8* }
%9 = type { i32, i8*, i8* }
%10 = type { i32, i8*, i8* }
%11 = type { i32, i8*, i8* }
%12 = type { i32, i8*, i8* }
%13 = type { i32, i8*, i8* }
%fp = type { i32 }
%fp.0 = type { i32 }
%node = type { i32, i8*, i8* }
%node.3 = type { i32, i8*, i8* }
%fp.1 = type { %fp.2* }
%fp.2 = type { i32 }
%node.4 = type { i32, i8*, i8* }
%node.5 = type { i32, i8*, i8* }

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

declare void @assert_equal_int(i32, i32)

declare void @assert_equal_string(i8*, i8*)

define i32 @main() {
entry:
  %f = alloca %0*
  %e = alloca %1*
  %d = alloca %2*
  %c = alloca %3*
  %b = alloca %4*
  %a = alloca %5*
  %root = alloca %6*
  %frame_pointer = alloca %fp
  %malloccall = tail call i8* @malloc(i32 ptrtoint (%7* getelementptr (%7, %7* null, i32 1) to i32))
  %record_init = bitcast i8* %malloccall to %7*
  %Element = getelementptr %7, %7* %record_init, i32 0, i32 0
  store i32 5, i32* %Element
  %Element1 = getelementptr %7, %7* %record_init, i32 0, i32 1
  store i8* null, i8** %Element1
  %Element2 = getelementptr %7, %7* %record_init, i32 0, i32 2
  store i8* null, i8** %Element2
  store %7* %record_init, %6** %root
  %malloccall3 = tail call i8* @malloc(i32 ptrtoint (%8* getelementptr (%8, %8* null, i32 1) to i32))
  %record_init4 = bitcast i8* %malloccall3 to %8*
  %Element5 = getelementptr %8, %8* %record_init4, i32 0, i32 0
  store i32 1, i32* %Element5
  %Element6 = getelementptr %8, %8* %record_init4, i32 0, i32 1
  store i8* null, i8** %Element6
  %Element7 = getelementptr %8, %8* %record_init4, i32 0, i32 2
  store i8* null, i8** %Element7
  store %8* %record_init4, %5** %a
  %malloccall8 = tail call i8* @malloc(i32 ptrtoint (%9* getelementptr (%9, %9* null, i32 1) to i32))
  %record_init9 = bitcast i8* %malloccall8 to %9*
  %Element10 = getelementptr %9, %9* %record_init9, i32 0, i32 0
  store i32 2, i32* %Element10
  %Element11 = getelementptr %9, %9* %record_init9, i32 0, i32 1
  store i8* null, i8** %Element11
  %Element12 = getelementptr %9, %9* %record_init9, i32 0, i32 2
  store i8* null, i8** %Element12
  store %9* %record_init9, %4** %b
  %malloccall13 = tail call i8* @malloc(i32 ptrtoint (%10* getelementptr (%10, %10* null, i32 1) to i32))
  %record_init14 = bitcast i8* %malloccall13 to %10*
  %Element15 = getelementptr %10, %10* %record_init14, i32 0, i32 0
  store i32 3, i32* %Element15
  %Element16 = getelementptr %10, %10* %record_init14, i32 0, i32 1
  store i8* null, i8** %Element16
  %Element17 = getelementptr %10, %10* %record_init14, i32 0, i32 2
  store i8* null, i8** %Element17
  store %10* %record_init14, %3** %c
  %malloccall18 = tail call i8* @malloc(i32 ptrtoint (%11* getelementptr (%11, %11* null, i32 1) to i32))
  %record_init19 = bitcast i8* %malloccall18 to %11*
  %Element20 = getelementptr %11, %11* %record_init19, i32 0, i32 0
  store i32 6, i32* %Element20
  %Element21 = getelementptr %11, %11* %record_init19, i32 0, i32 1
  store i8* null, i8** %Element21
  %Element22 = getelementptr %11, %11* %record_init19, i32 0, i32 2
  store i8* null, i8** %Element22
  store %11* %record_init19, %2** %d
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint (%12* getelementptr (%12, %12* null, i32 1) to i32))
  %record_init24 = bitcast i8* %malloccall23 to %12*
  %Element25 = getelementptr %12, %12* %record_init24, i32 0, i32 0
  store i32 8, i32* %Element25
  %Element26 = getelementptr %12, %12* %record_init24, i32 0, i32 1
  store i8* null, i8** %Element26
  %Element27 = getelementptr %12, %12* %record_init24, i32 0, i32 2
  store i8* null, i8** %Element27
  store %12* %record_init24, %1** %e
  %malloccall28 = tail call i8* @malloc(i32 ptrtoint (%13* getelementptr (%13, %13* null, i32 1) to i32))
  %record_init29 = bitcast i8* %malloccall28 to %13*
  %Element30 = getelementptr %13, %13* %record_init29, i32 0, i32 0
  store i32 9, i32* %Element30
  %Element31 = getelementptr %13, %13* %record_init29, i32 0, i32 1
  store i8* null, i8** %Element31
  %Element32 = getelementptr %13, %13* %record_init29, i32 0, i32 2
  store i8* null, i8** %Element32
  store %13* %record_init29, %0** %f
  %load_left = load %6*, %6** %root
  %element_left = getelementptr %6, %6* %load_left, i32 0, i32 1
  %b33 = load %4*, %4** %b
  %0 = bitcast %4* %b33 to i8*
  store i8* %0, i8** %element_left
  %load_left34 = load %6*, %6** %root
  %element_left35 = getelementptr %6, %6* %load_left34, i32 0, i32 2
  %e36 = load %1*, %1** %e
  %1 = bitcast %1* %e36 to i8*
  store i8* %1, i8** %element_left35
  %load_left37 = load %4*, %4** %b
  %element_left38 = getelementptr %4, %4* %load_left37, i32 0, i32 1
  %a39 = load %5*, %5** %a
  %2 = bitcast %5* %a39 to i8*
  store i8* %2, i8** %element_left38
  %load_left40 = load %4*, %4** %b
  %element_left41 = getelementptr %4, %4* %load_left40, i32 0, i32 2
  %c42 = load %3*, %3** %c
  %3 = bitcast %3* %c42 to i8*
  store i8* %3, i8** %element_left41
  %load_left43 = load %1*, %1** %e
  %element_left44 = getelementptr %1, %1* %load_left43, i32 0, i32 1
  %d45 = load %2*, %2** %d
  %4 = bitcast %2* %d45 to i8*
  store i8* %4, i8** %element_left44
  %load_left46 = load %1*, %1** %e
  %element_left47 = getelementptr %1, %1* %load_left46, i32 0, i32 2
  %f48 = load %0*, %0** %f
  %5 = bitcast %0* %f48 to i8*
  store i8* %5, i8** %element_left47
  %root49 = load %6*, %6** %root
  %6 = call i32 @eval_sum(%fp* %frame_pointer, %6* %root49)
  call void @tig_print_int(i32 %6)
  %root50 = load %6*, %6** %root
  %7 = call i32 @eval_sum(%fp* %frame_pointer, %6* %root50)
  call void @assert_equal_int(i32 %7, i32 34)
  ret i32 0

break_loop:                                       ; No predecessors!
  ret i32 0
}

define i32 @eval_sum(%fp.0*, %node*) {
entry:
  %if_result_addr = alloca i32
  %root = alloca %node.3*
  %frame_pointer = alloca %fp.1
  %arg_address = getelementptr %fp.1, %fp.1* %frame_pointer, i32 0, i32 0
  store %fp.0* %0, %fp.2** %arg_address
  store %node* %1, %node.3** %root
  br label %test

test:                                             ; preds = %entry
  %root1 = load %node.3*, %node.3** %root
  %2 = bitcast %node.3* %root1 to i8*
  %3 = call i32 @tig_nillable(i8* %2)
  %cond = icmp eq i32 %3, 1
  br i1 %cond, label %then, label %else

then:                                             ; preds = %test
  store i32 0, i32* %if_result_addr
  br label %merge

else:                                             ; preds = %test
  %root2 = load %node.3*, %node.3** %root
  %element = getelementptr %node.3, %node.3* %root2, i32 0, i32 0
  %field_var = load i32, i32* %element
  %root3 = load %node.3*, %node.3** %root
  %element4 = getelementptr %node.3, %node.3* %root3, i32 0, i32 1
  %field_var5 = load i8*, i8** %element4
  %4 = bitcast i8* %field_var5 to %node.4*
  %fp_addr_in_sl = getelementptr %fp.1, %fp.1* %frame_pointer, i32 0, i32 0
  %fp_addr = load %fp.2*, %fp.2** %fp_addr_in_sl
  %5 = call i32 @eval_sum(%fp.2* %fp_addr, %node.4* %4)
  %add_tmp = add i32 %field_var, %5
  %root6 = load %node.3*, %node.3** %root
  %element7 = getelementptr %node.3, %node.3* %root6, i32 0, i32 2
  %field_var8 = load i8*, i8** %element7
  %6 = bitcast i8* %field_var8 to %node.5*
  %fp_addr_in_sl9 = getelementptr %fp.1, %fp.1* %frame_pointer, i32 0, i32 0
  %fp_addr10 = load %fp.2*, %fp.2** %fp_addr_in_sl9
  %7 = call i32 @eval_sum(%fp.2* %fp_addr10, %node.5* %6)
  %add_tmp11 = add i32 %add_tmp, %7
  store i32 %add_tmp11, i32* %if_result_addr
  br label %merge

merge:                                            ; preds = %else, %then
  %if_result = load i32, i32* %if_result_addr
  ret i32 %if_result
}

declare noalias i8* @malloc(i32)
