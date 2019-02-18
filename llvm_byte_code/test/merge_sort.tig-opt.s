	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/merge_sort__code_begin"
"_camlLlvm_byte_code/test/merge_sort__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/merge_sort__data_begin"
"_camlLlvm_byte_code/test/merge_sort__data_begin":
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
	callq	_merge_sort
Ltmp5:
	movq	%rax, %r15
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
	callq	_merge_sort
Ltmp18:
	movq	%rax, %rbx
	leaq	L___unnamed_9(%rip), %rdx
	xorl	%esi, %esi
	movq	%rax, %rdi
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
	.globl	_merge_sort             ## -- Begin function merge_sort
	.p2align	4, 0x90
_merge_sort:                            ## @merge_sort
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
	movq	%rsi, %r14
	movq	%rdi, 8(%rsp)
	movq	%rsi, %rdi
	callq	_tig_array_length
Ltmp40:
	cmpl	$2, %eax
	jl	LBB3_2
## %bb.1:                               ## %else
	movl	%eax, %ebp
	movl	%eax, %ebx
	shrl	$31, %ebx
	addl	%eax, %ebx
	sarl	%ebx
	leal	-1(%rbx), %ecx
	leaq	8(%rsp), %r15
	xorl	%edx, %edx
	movq	%r15, %rdi
	movq	%r14, %rsi
	callq	_sub_arr
Ltmp41:
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	_merge_sort
Ltmp42:
	movq	%rax, %r12
	decl	%ebp
	movq	%r15, %rdi
	movq	%r14, %rsi
	movl	%ebx, %edx
	movl	%ebp, %ecx
	callq	_sub_arr
Ltmp43:
	movq	8(%rsp), %rdi
	movq	%rax, %rsi
	callq	_merge_sort
Ltmp44:
	movq	%r15, %rdi
	movq	%r12, %rsi
	movq	%rax, %rdx
	callq	_merge
Ltmp45:
	movq	%rax, %r14
LBB3_2:                                 ## %merge
	movq	%r14, %rax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_sub_arr                ## -- Begin function sub_arr
	.p2align	4, 0x90
_sub_arr:                               ## @sub_arr
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
                                        ## kill: def $ecx killed $ecx def $rcx
                                        ## kill: def $edx killed $edx def $rdx
	movq	%rsi, %r12
	movq	%rdi, 16(%rsp)
	movq	%rdx, (%rsp)            ## 8-byte Spill
	subl	%edx, %ecx
	leal	1(%rcx), %ebp
	movq	%rcx, 8(%rsp)           ## 8-byte Spill
	leal	4(,%rcx,4), %edi
	callq	_malloc
Ltmp46:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	%ebp, %eax
	jge	LBB4_3
	.p2align	4, 0x90
LBB4_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	movl	$0, (%rbx,%rcx,4)
	incl	%eax
	cmpl	%ebp, %eax
	jl	LBB4_2
LBB4_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp47:
	movq	%rax, %r13
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	xorl	%ebx, %ebx
	cmpl	%ebx, 8(%rsp)           ## 4-byte Folded Reload
	jl	LBB4_6
	.p2align	4, 0x90
LBB4_5:                                 ## %loop17
                                        ## =>This Inner Loop Header: Depth=1
	movq	(%rsp), %rax            ## 8-byte Reload
	leal	(%rax,%rbx), %ebp
	movq	%r13, %rdi
	movl	%ebx, %esi
	leaq	L___unnamed_19(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp48:
	movq	8(%r13), %r14
	movslq	%ebx, %r15
	movq	%r12, %rdi
	movl	%ebp, %esi
	leaq	L___unnamed_20(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp49:
	movq	8(%r12), %rax
	movslq	%ebp, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%r14,%r15,4)
	incl	%ebx
	cmpl	%ebx, 8(%rsp)           ## 4-byte Folded Reload
	jge	LBB4_5
LBB4_6:                                 ## %end18
	movq	%r13, %rax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_merge                  ## -- Begin function merge
	.p2align	4, 0x90
_merge:                                 ## @merge
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, %rbx
	movq	%rsi, %r12
	movq	%rdi, 64(%rsp)
	movq	%rsi, %rdi
	callq	_tig_array_length
Ltmp50:
	movl	%eax, %ebp
	movq	%rbx, %rdi
	callq	_tig_array_length
Ltmp51:
                                        ## kill: def $eax killed $eax def $rax
	movq	%rax, 32(%rsp)          ## 8-byte Spill
	movq	%rbp, 40(%rsp)          ## 8-byte Spill
	leal	(%rbp,%rax), %r14d
	leal	(,%r14,4), %edi
	callq	_malloc
Ltmp52:
	movq	%rax, %rbp
	xorl	%eax, %eax
	cmpl	%r14d, %eax
	jge	LBB5_3
	.p2align	4, 0x90
LBB5_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movslq	%eax, %rcx
	movl	$0, (%rbp,%rcx,4)
	incl	%eax
	cmpl	%r14d, %eax
	jl	LBB5_2
LBB5_3:                                 ## %end
	movq	%rbx, 24(%rsp)          ## 8-byte Spill
	movl	$16, %edi
	callq	_malloc
Ltmp53:
	movq	%rax, %r15
	movl	%r14d, (%rax)
	movq	%rbp, 8(%rax)
	xorl	%r13d, %r13d
	movl	$0, 4(%rsp)             ## 4-byte Folded Spill
	xorl	%r14d, %r14d
	movq	%rax, 16(%rsp)          ## 8-byte Spill
	movq	%r12, 48(%rsp)          ## 8-byte Spill
	jmp	LBB5_4
	.p2align	4, 0x90
LBB5_10:                                ## %then26
                                        ##   in Loop: Header=BB5_4 Depth=1
	movq	16(%rsp), %r15          ## 8-byte Reload
	movq	%rcx, %r12
	movq	%r15, %rdi
	movl	%r14d, %esi
	leaq	L___unnamed_21(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp56:
	movq	8(%r15), %rbx
	movslq	%r14d, %r14
	movq	%r12, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_22(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp57:
	movq	8(%r12), %rax
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%rbx,%r14,4)
	incl	%r13d
	incl	%r14d
LBB5_4:                                 ## %test11
                                        ## =>This Inner Loop Header: Depth=1
	cmpl	40(%rsp), %r13d         ## 4-byte Folded Reload
	movl	$0, %eax
	jge	LBB5_6
## %bb.5:                               ## %then
                                        ##   in Loop: Header=BB5_4 Depth=1
	xorl	%eax, %eax
	movl	4(%rsp), %ecx           ## 4-byte Reload
	cmpl	32(%rsp), %ecx          ## 4-byte Folded Reload
	setl	%al
LBB5_6:                                 ## %merge
                                        ##   in Loop: Header=BB5_4 Depth=1
	testl	%eax, %eax
	je	LBB5_7
## %bb.11:                              ## %loop12
                                        ##   in Loop: Header=BB5_4 Depth=1
	movq	%r12, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_23(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp58:
	movq	8(%r12), %rax
	movslq	%r13d, %rcx
	movq	%rcx, 8(%rsp)           ## 8-byte Spill
	movl	(%rax,%rcx,4), %ebx
	movq	24(%rsp), %r15          ## 8-byte Reload
	movq	%r15, %rdi
	movl	4(%rsp), %ebp           ## 4-byte Reload
	movl	%ebp, %esi
	leaq	L___unnamed_24(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp59:
	movq	8(%r15), %rax
	movq	%r12, %rcx
	movslq	%ebp, %r12
	cmpl	(%rax,%r12,4), %ebx
	jl	LBB5_10
## %bb.12:                              ## %else27
                                        ##   in Loop: Header=BB5_4 Depth=1
	movq	16(%rsp), %rbx          ## 8-byte Reload
	movq	%rbx, %rdi
	movl	%r14d, %esi
	leaq	L___unnamed_25(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp60:
	movq	8(%rbx), %rax
	movq	%rax, 8(%rsp)           ## 8-byte Spill
	movslq	%r14d, %rax
	movq	%rax, 56(%rsp)          ## 8-byte Spill
	movq	%r15, %rdi
	movl	%ebp, %esi
	leaq	L___unnamed_26(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp61:
	movq	8(%r15), %rax
	movq	%rbx, %r15
	movl	(%rax,%r12,4), %eax
	movq	8(%rsp), %rcx           ## 8-byte Reload
	movq	56(%rsp), %rdx          ## 8-byte Reload
	movl	%eax, (%rcx,%rdx,4)
	incl	%ebp
	movl	%ebp, 4(%rsp)           ## 4-byte Spill
	incl	%r14d
	movq	48(%rsp), %r12          ## 8-byte Reload
	jmp	LBB5_4
LBB5_7:
	movq	24(%rsp), %rbp          ## 8-byte Reload
	cmpl	40(%rsp), %r13d         ## 4-byte Folded Reload
	jge	LBB5_13
	.p2align	4, 0x90
LBB5_9:                                 ## %loop69
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movl	%r14d, %esi
	leaq	L___unnamed_27(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp54:
	movq	8(%r15), %rbx
	movslq	%r14d, %r14
	movq	%r12, %rdi
	movl	%r13d, %esi
	leaq	L___unnamed_28(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp55:
	movq	8(%r12), %rax
	movslq	%r13d, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%rbx,%r14,4)
	incl	%r13d
	incl	%r14d
	cmpl	40(%rsp), %r13d         ## 4-byte Folded Reload
	jl	LBB5_9
LBB5_13:                                ## %end70
	leaq	L___unnamed_29(%rip), %r13
	movl	4(%rsp), %r12d          ## 4-byte Reload
	cmpl	32(%rsp), %r12d         ## 4-byte Folded Reload
	jge	LBB5_16
	.p2align	4, 0x90
LBB5_15:                                ## %loop92
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r15, %rdi
	movl	%r14d, %esi
	leaq	L___unnamed_30(%rip), %rdx
	callq	_tig_check_array_bound
Ltmp62:
	movq	8(%r15), %rbx
	movslq	%r14d, %r14
	movq	%rbp, %rdi
	movl	%r12d, %esi
	movq	%r13, %rdx
	callq	_tig_check_array_bound
Ltmp63:
	movq	8(%rbp), %rax
	movslq	%r12d, %rcx
	movl	(%rax,%rcx,4), %eax
	movl	%eax, (%rbx,%r14,4)
	incl	%r12d
	incl	%r14d
	cmpl	32(%rsp), %r12d         ## 4-byte Folded Reload
	jl	LBB5_15
LBB5_16:                                ## %end93
	movq	%r15, %rax
	addq	$72, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
Ltmp64:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	LBB6_3
	.p2align	4, 0x90
LBB6_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movl	$1, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	LBB6_2
LBB6_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp65:
	movq	%rax, %r14
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$4, %ebp
	xorl	%ebx, %ebx
	leaq	L___unnamed_31(%rip), %r15
	cmpl	$4, %ebx
	jg	LBB6_6
	.p2align	4, 0x90
LBB6_5:                                 ## %loop11
                                        ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebx, %esi
	movq	%r15, %rdx
	callq	_tig_check_array_bound
Ltmp66:
	movq	8(%r14), %rax
	movl	%ebp, (%rax,%rbx,4)
	decl	%ebp
	incq	%rbx
	cmpl	$4, %ebx
	jle	LBB6_5
LBB6_6:                                 ## %end12
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
	.asciz	"test/merge_sort.tig::6.67: Array out of bound"

L___unnamed_16:                         ## @2
	.space	1

L___unnamed_17:                         ## @3
	.asciz	"]"

	.p2align	4               ## @4
L___unnamed_18:
	.asciz	"test/merge_sort.tig::16.41: Array out of bound"

	.p2align	4               ## @5
L___unnamed_19:
	.asciz	"test/merge_sort.tig::29.35: Array out of bound"

	.p2align	4               ## @6
L___unnamed_20:
	.asciz	"test/merge_sort.tig::29.45: Array out of bound"

	.p2align	4               ## @7
L___unnamed_23:
	.asciz	"test/merge_sort.tig::45.35: Array out of bound"

	.p2align	4               ## @8
L___unnamed_24:
	.asciz	"test/merge_sort.tig::45.50: Array out of bound"

	.p2align	4               ## @9
L___unnamed_21:
	.asciz	"test/merge_sort.tig::47.38: Array out of bound"

	.p2align	4               ## @10
L___unnamed_22:
	.asciz	"test/merge_sort.tig::47.66: Array out of bound"

	.p2align	4               ## @11
L___unnamed_25:
	.asciz	"test/merge_sort.tig::52.38: Array out of bound"

	.p2align	4               ## @12
L___unnamed_26:
	.asciz	"test/merge_sort.tig::52.67: Array out of bound"

	.p2align	4               ## @13
L___unnamed_27:
	.asciz	"test/merge_sort.tig::58.34: Array out of bound"

	.p2align	4               ## @14
L___unnamed_28:
	.asciz	"test/merge_sort.tig::58.62: Array out of bound"

	.p2align	4               ## @15
L___unnamed_30:
	.asciz	"test/merge_sort.tig::64.34: Array out of bound"

	.p2align	4               ## @16
L___unnamed_29:
	.asciz	"test/merge_sort.tig::64.63: Array out of bound"

	.p2align	4               ## @17
L___unnamed_31:
	.asciz	"test/merge_sort.tig::89.41: Array out of bound"

L___unnamed_1:                          ## @18
	.asciz	"Before sorting"

L___unnamed_2:                          ## @19
	.asciz	"=============="

L___unnamed_3:                          ## @20
	.asciz	"After sorting"

	.p2align	4               ## @21
L___unnamed_4:
	.asciz	"test/merge_sort.tig::103.23: Array out of bound"

	.p2align	4               ## @22
L___unnamed_5:
	.asciz	"test/merge_sort.tig::104.23: Array out of bound"

	.p2align	4               ## @23
L___unnamed_6:
	.asciz	"test/merge_sort.tig::105.23: Array out of bound"

	.p2align	4               ## @24
L___unnamed_7:
	.asciz	"test/merge_sort.tig::106.23: Array out of bound"

	.p2align	4               ## @25
L___unnamed_8:
	.asciz	"test/merge_sort.tig::107.23: Array out of bound"

	.p2align	4               ## @26
L___unnamed_9:
	.asciz	"test/merge_sort.tig::111.23: Array out of bound"

	.p2align	4               ## @27
L___unnamed_10:
	.asciz	"test/merge_sort.tig::112.23: Array out of bound"

	.p2align	4               ## @28
L___unnamed_11:
	.asciz	"test/merge_sort.tig::113.23: Array out of bound"

	.p2align	4               ## @29
L___unnamed_12:
	.asciz	"test/merge_sort.tig::114.23: Array out of bound"

	.p2align	4               ## @30
L___unnamed_13:
	.asciz	"test/merge_sort.tig::115.23: Array out of bound"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/merge_sort__code_end"
"_camlLlvm_byte_code/test/merge_sort__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/merge_sort__data_end"
"_camlLlvm_byte_code/test/merge_sort__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/merge_sort__frametable"
"_camlLlvm_byte_code/test/merge_sort__frametable":
	.short	67
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
                                        ## live roots for merge_sort
	.quad	Ltmp40
	.short	56
	.short	0
	.p2align	3
	.quad	Ltmp41
	.short	56
	.short	0
	.p2align	3
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
                                        ## live roots for sub_arr
	.quad	Ltmp46
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp47
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp48
	.short	72
	.short	0
	.p2align	3
	.quad	Ltmp49
	.short	72
	.short	0
	.p2align	3
                                        ## live roots for merge
	.quad	Ltmp50
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp51
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp52
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp53
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp54
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp55
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp56
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp57
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp58
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp59
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp60
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp61
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp62
	.short	120
	.short	0
	.p2align	3
	.quad	Ltmp63
	.short	120
	.short	0
	.p2align	3
                                        ## live roots for create_array_test
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
.subsections_via_symbols
