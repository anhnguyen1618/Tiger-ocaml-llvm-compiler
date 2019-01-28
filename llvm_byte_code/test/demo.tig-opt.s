	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$5, (%rbx)
	movq	$.L__unnamed_1, 8(%rbx)
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbp
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, (%rbp,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$5, (%r14)
	movq	%rbp, 8(%r14)
	xorl	%esi, %esi
	movl	$.L__unnamed_2, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movq	(%rax), %rax
	movl	(%rax), %ebp
	leaq	8(%rsp), %r14
	testl	%ebp, %ebp
	jle	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                # %loop12
                                        # =>This Inner Loop Header: Depth=1
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	fib
	movl	%eax, %edi
	callq	tig_print_int
	movq	8(%rbx), %rdi
	callq	tig_print
	decl	%ebp
	testl	%ebp, %ebp
	jg	.LBB0_5
.LBB0_6:                                # %end13
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	fib                     # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebx
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.LBB1_3
# %bb.1:                                # %test2
	cmpl	$1, %ebx
	movl	$1, %eax
	je	.LBB1_3
# %bb.2:                                # %else4
	leal	-1(%rbx), %esi
	movq	(%rsp), %rdi
	callq	fib
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	callq	fib
	addl	%ebp, %eax
.LBB1_3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"Demo program"
	.size	.L__unnamed_1, 13

	.type	.L__unnamed_2,@object   # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_2:
	.asciz	"test/demo.tig::14.20: Array out of bound"
	.size	.L__unnamed_2, 41


	.section	".note.GNU-stack","",@progbits
