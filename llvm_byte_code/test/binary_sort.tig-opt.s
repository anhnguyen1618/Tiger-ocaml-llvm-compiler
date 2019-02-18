	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/binary_sort__code_begin"
"_camlLlvm_byte_code/test/binary_sort__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/binary_sort__data_begin"
"_camlLlvm_byte_code/test/binary_sort__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	leaq	8(%rsp), %r14
	movq	%r14, %rdi
	callq	_create_array
Ltmp0:
	movq	%rax, %r15
	movq	%r14, %rdi
	callq	_create_array_test
Ltmp1:
	movq	%rax, %rbx
	leaq	L___unnamed_1(%rip), %rdi
	callq	_tig_print
Ltmp2:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_print_array
Ltmp3:
	leaq	L___unnamed_2(%rip), %rdi
	callq	_tig_print
Ltmp4:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_binary_sort
Ltmp5:
	leaq	L___unnamed_3(%rip), %rdi
	callq	_tig_print
Ltmp6:
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_print_array
Ltmp7:
	leaq	L___unnamed_4(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp8:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_5(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp11:
	leaq	L___unnamed_6(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp12:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp13:
	leaq	L___unnamed_7(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp14:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp15:
	leaq	L___unnamed_8(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp16:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp17:
	movq	%r14, %rdi
	movq	%rbx, %rsi
	callq	_binary_sort
Ltmp18:
	leaq	L___unnamed_9(%rip), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp19:
	movq	8(%rbx), %rax
	movl	(%rax), %edi
	xorl	%esi, %esi
	callq	_assert_equal_int
Ltmp20:
	leaq	L___unnamed_10(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp21:
	movq	8(%rbx), %rax
	movl	4(%rax), %edi
	movl	$1, %esi
	callq	_assert_equal_int
Ltmp22:
	leaq	L___unnamed_11(%rip), %rdx
	movl	$2, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp23:
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$2, %esi
	callq	_assert_equal_int
Ltmp24:
	leaq	L___unnamed_12(%rip), %rdx
	movl	$3, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp25:
	movq	8(%rbx), %rax
	movl	12(%rax), %edi
	movl	$3, %esi
	callq	_assert_equal_int
Ltmp26:
	leaq	L___unnamed_13(%rip), %rdx
	movl	$4, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp27:
	movq	8(%rbx), %rax
	movl	16(%rax), %edi
	movl	$4, %esi
	callq	_assert_equal_int
Ltmp28:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_print_array            ## -- Begin function print_array
	.p2align	4, 0x90
_print_array:                           ## @print_array
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %rbx
	movq	%rdi, (%rsp)
	leaq	L___unnamed_14(%rip), %rdi
	callq	_tig_print
Ltmp29:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp30:
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp31:
	movl	%eax, %r14d
	decl	%r14d
	xorl	%ebp, %ebp
	leaq	L___unnamed_15(%rip), %r15
	cmpl	%ebp, %r14d
	jl	LBB1_3
	.p2align	4, 0x90
LBB1_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	movl	%ebp, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp32:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %edi
	callq	_print_arr_int_ele
Ltmp33:
	incl	%ebp
	cmpl	%ebp, %r14d
	jge	LBB1_2
LBB1_3:                                 ## %end
	leaq	L___unnamed_16(%rip), %rdi
	callq	_tig_print
Ltmp34:
	leaq	L___unnamed_17(%rip), %rdi
	callq	_tig_print
Ltmp35:
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array           ## -- Begin function create_array
	.p2align	4, 0x90
_create_array:                          ## @create_array
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, (%rsp)
	movl	$32, %edi
	callq	_malloc
Ltmp36:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$7, %eax
	jg	LBB2_3
	.p2align	4, 0x90
LBB2_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$7, %eax
	jle	LBB2_2
LBB2_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp37:
	movq	%rax, %r14
	movl	$8, (%rax)
	movq	%rbx, 8(%rax)
	xorl	%ebx, %ebx
	leaq	L___unnamed_18(%rip), %r15
	cmpl	$7, %ebx
	jg	LBB2_6
	.p2align	4, 0x90
LBB2_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp38:
	movq	8(%r14), %r12
	movl	$50, %edi
	callq	_tig_random
Ltmp39:
	movl	%eax, (%r12,%rbx,4)
	incq	%rbx
	cmpl	$7, %ebx
	jle	LBB2_5
LBB2_6:                                 ## %end12
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_binary_sort            ## -- Begin function binary_sort
	.p2align	4, 0x90
_binary_sort:                           ## @binary_sort
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, 24(%rsp)
	movl	$0, 16(%rsp)
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	_build_binary_tree
Ltmp40:
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	_in_order_traversing
Ltmp41:
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_build_binary_tree      ## -- Begin function build_binary_tree
	.p2align	4, 0x90
_build_binary_tree:                     ## @build_binary_tree
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movq	$0, 8(%rsp)
	movq	16(%rdi), %rdi
	callq	_tig_array_length
Ltmp42:
	movq	(%rsp), %rax
	movq	16(%rax), %rdi
	callq	_tig_array_length
Ltmp43:
	movl	%eax, %r12d
	decl	%r12d
	xorl	%ebp, %ebp
	leaq	L___unnamed_19(%rip), %r14
	movq	%rsp, %r15
	cmpl	%ebp, %r12d
	jl	LBB4_3
	.p2align	4, 0x90
LBB4_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax
	movq	16(%rax), %rbx
	movq	%rbx, %rdi
	movl	%ebp, %esi
	movq	%r14, %rdx
	callq	_tig_check_array_bound
Ltmp44:
	movq	8(%rbx), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %esi
	movq	%r15, %rdi
	callq	_add_node
Ltmp45:
	incl	%ebp
	cmpl	%ebp, %r12d
	jge	LBB4_2
LBB4_3:                                 ## %end
	movq	8(%rsp), %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_add_node               ## -- Begin function add_node
	.p2align	4, 0x90
_add_node:                              ## @add_node
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	%esi, %ebx
	movq	%rdi, 8(%rsp)
	movl	%esi, 24(%rsp)
	movl	$24, %edi
	callq	_malloc
Ltmp46:
	movl	%ebx, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rax
	movq	8(%rax), %rdi
	callq	_tig_nillable
Ltmp47:
	testl	%eax, %eax
	je	LBB5_2
## %bb.1:                               ## %then
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 8(%rax)
	jmp	LBB5_3
LBB5_2:                                 ## %else
	movq	8(%rsp), %rax
	movq	8(%rax), %rsi
	leaq	8(%rsp), %rdi
	callq	_insert_node
Ltmp48:
LBB5_3:                                 ## %merge
	addq	$32, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_insert_node            ## -- Begin function insert_node
	.p2align	4, 0x90
_insert_node:                           ## @insert_node
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	leaq	L___unnamed_20(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp49:
	movl	(%rbx), %eax
	movq	8(%rsp), %rcx
	cmpl	16(%rcx), %eax
	jg	LBB6_1
## %bb.4:                               ## %then2
	leaq	L___unnamed_21(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp51:
	movq	16(%rbx), %rdi
	callq	_tig_nillable
Ltmp52:
	testl	%eax, %eax
	je	LBB6_2
LBB6_6:                                 ## %then
	leaq	L___unnamed_22(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp53:
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 16(%rbx)
	jmp	LBB6_7
LBB6_1:
	xorl	%eax, %eax
	testl	%eax, %eax
	jne	LBB6_6
LBB6_2:                                 ## %else
	leaq	L___unnamed_23(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp50:
	movl	(%rbx), %eax
	movq	8(%rsp), %rcx
	cmpl	16(%rcx), %eax
	jle	LBB6_3
## %bb.8:                               ## %then19
	leaq	L___unnamed_24(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp54:
	movq	8(%rbx), %rdi
	callq	_tig_nillable
Ltmp55:
	testl	%eax, %eax
	je	LBB6_13
LBB6_10:                                ## %then15
	leaq	L___unnamed_25(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp56:
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	%rax, 8(%rbx)
	jmp	LBB6_7
LBB6_3:
	xorl	%eax, %eax
	testl	%eax, %eax
	jne	LBB6_10
LBB6_13:                                ## %else16
	leaq	L___unnamed_26(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp59:
	movl	(%rbx), %eax
	movq	8(%rsp), %rcx
	cmpl	16(%rcx), %eax
	jg	LBB6_14
## %bb.11:                              ## %then44
	leaq	L___unnamed_27(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp57:
	movq	16(%rbx), %rsi
	jmp	LBB6_12
LBB6_14:                                ## %else45
	leaq	L___unnamed_28(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp60:
	movq	8(%rbx), %rsi
LBB6_12:                                ## %merge
	movq	8(%rsp), %rdi
	callq	_insert_node
Ltmp58:
LBB6_7:                                 ## %merge
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_in_order_traversing    ## -- Begin function in_order_traversing
	.p2align	4, 0x90
_in_order_traversing:                   ## @in_order_traversing
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rdi
	callq	_tig_nillable
Ltmp61:
	testl	%eax, %eax
	jne	LBB7_2
## %bb.1:                               ## %else
	leaq	L___unnamed_29(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp62:
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	_in_order_traversing
Ltmp63:
	movq	8(%rsp), %rax
	movslq	8(%rax), %r14
	movq	16(%rax), %r15
	leaq	L___unnamed_30(%rip), %rdx
	movq	%r15, %rdi
	movl	%r14d, %esi
	callq	_tig_check_array_bound
Ltmp64:
	movq	8(%r15), %r15
	leaq	L___unnamed_31(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp65:
	movl	(%rbx), %eax
	movl	%eax, (%r15,%r14,4)
	movq	8(%rsp), %rax
	incl	8(%rax)
	leaq	L___unnamed_32(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp66:
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	_in_order_traversing
Ltmp67:
LBB7_2:                                 ## %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_array_test      ## -- Begin function create_array_test
	.p2align	4, 0x90
_create_array_test:                     ## @create_array_test
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdi, (%rsp)
	movl	$20, %edi
	callq	_malloc
Ltmp68:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	LBB8_3
	.p2align	4, 0x90
LBB8_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	LBB8_2
LBB8_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp69:
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	leaq	L___unnamed_33(%rip), %r15
	cmpl	$4, %ebx
	jg	LBB8_6
	.p2align	4, 0x90
LBB8_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp70:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	LBB8_5
LBB8_6:                                 ## %end12
	movq	%r14, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_14:                         ## @0
	.asciz	"["

	.p2align	4               ## @1
L___unnamed_15:
	.asciz	"test/binary_sort.tig::6.67: Array out of bound"

L___unnamed_16:                         ## @2
	.space	1

L___unnamed_17:                         ## @3
	.asciz	"]"

	.p2align	4               ## @4
L___unnamed_18:
	.asciz	"test/binary_sort.tig::16.41: Array out of bound"

	.p2align	4               ## @5
L___unnamed_20:
	.asciz	"test/binary_sort.tig::35.47: Nil pointer exception!"

	.p2align	4               ## @6
L___unnamed_21:
	.asciz	"test/binary_sort.tig::35.79: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_22:
	.asciz	"test/binary_sort.tig::36.49: Nil pointer exception!"

	.p2align	4               ## @8
L___unnamed_23:
	.asciz	"test/binary_sort.tig::37.52: Nil pointer exception!"

	.p2align	4               ## @9
L___unnamed_24:
	.asciz	"test/binary_sort.tig::37.83: Nil pointer exception!"

	.p2align	4               ## @10
L___unnamed_25:
	.asciz	"test/binary_sort.tig::38.49: Nil pointer exception!"

	.p2align	4               ## @11
L___unnamed_26:
	.asciz	"test/binary_sort.tig::39.52: Nil pointer exception!"

	.p2align	4               ## @12
L___unnamed_27:
	.asciz	"test/binary_sort.tig::40.61: Nil pointer exception!"

	.p2align	4               ## @13
L___unnamed_28:
	.asciz	"test/binary_sort.tig::41.61: Nil pointer exception!"

	.p2align	4               ## @14
L___unnamed_19:
	.asciz	"test/binary_sort.tig::49.36: Array out of bound"

	.p2align	4               ## @15
L___unnamed_29:
	.asciz	"test/binary_sort.tig::57.48: Nil pointer exception!"

	.p2align	4               ## @16
L___unnamed_30:
	.asciz	"test/binary_sort.tig::58.23: Array out of bound"

	.p2align	4               ## @17
L___unnamed_31:
	.asciz	"test/binary_sort.tig::58.44: Nil pointer exception!"

	.p2align	4               ## @18
L___unnamed_32:
	.asciz	"test/binary_sort.tig::60.48: Nil pointer exception!"

	.p2align	4               ## @19
L___unnamed_33:
	.asciz	"test/binary_sort.tig::77.41: Array out of bound"

L___unnamed_1:                          ## @20
	.asciz	"Before sorting"

L___unnamed_2:                          ## @21
	.asciz	"=============="

L___unnamed_3:                          ## @22
	.asciz	"After sorting"

	.p2align	4               ## @23
L___unnamed_4:
	.asciz	"test/binary_sort.tig::90.23: Array out of bound"

	.p2align	4               ## @24
L___unnamed_5:
	.asciz	"test/binary_sort.tig::91.23: Array out of bound"

	.p2align	4               ## @25
L___unnamed_6:
	.asciz	"test/binary_sort.tig::92.23: Array out of bound"

	.p2align	4               ## @26
L___unnamed_7:
	.asciz	"test/binary_sort.tig::93.23: Array out of bound"

	.p2align	4               ## @27
L___unnamed_8:
	.asciz	"test/binary_sort.tig::94.23: Array out of bound"

	.p2align	4               ## @28
L___unnamed_9:
	.asciz	"test/binary_sort.tig::98.23: Array out of bound"

	.p2align	4               ## @29
L___unnamed_10:
	.asciz	"test/binary_sort.tig::99.23: Array out of bound"

	.p2align	4               ## @30
L___unnamed_11:
	.asciz	"test/binary_sort.tig::100.23: Array out of bound"

	.p2align	4               ## @31
L___unnamed_12:
	.asciz	"test/binary_sort.tig::101.23: Array out of bound"

	.p2align	4               ## @32
L___unnamed_13:
	.asciz	"test/binary_sort.tig::102.23: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/binary_sort__code_end"
"_camlLlvm_byte_code/test/binary_sort__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/binary_sort__data_end"
"_camlLlvm_byte_code/test/binary_sort__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/binary_sort__frametable"
"_camlLlvm_byte_code/test/binary_sort__frametable":
	.short	71
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp28
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for print_array
	.quad	Ltmp29
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp30
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp31
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp32
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp33
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp34
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp35
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_array
	.quad	Ltmp36
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp37
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp38
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp39
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for binary_sort
	.quad	Ltmp40
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp41
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for build_binary_tree
	.quad	Ltmp42
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp43
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp44
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp45
	.short	56
	.short	0
	.p2align	3
                                        ## live roots for add_node
	.quad	Ltmp46
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp47
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp48
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for insert_node
	.quad	Ltmp49
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp50
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp51
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp52
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp53
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp54
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp55
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp56
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp57
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp58
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp59
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp60
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for in_order_traversing
	.quad	Ltmp61
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp62
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp63
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp64
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp65
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp66
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp67
	.short	40
	.short	0
	.p2align	3
                                        ## live roots for create_array_test
	.quad	Ltmp68
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp69
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp70
	.short	40
	.short	0
	.p2align	3
.subsections_via_symbols
