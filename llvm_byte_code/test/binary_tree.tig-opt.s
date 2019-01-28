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
	pushq	%rax
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r15
	movl	$5, (%r15)
	movq	$0, 8(%r15)
	movq	$0, 16(%r15)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$1, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$2, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r12
	movl	$3, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %r13
	movl	$6, (%r13)
	movq	$0, 8(%r13)
	movq	$0, 16(%r13)
	movl	$24, %edi
	callq	malloc
	movq	%rax, %rbp
	movl	$8, (%rbp)
	movq	$0, 8(%rbp)
	movq	$0, 16(%rbp)
	movl	$24, %edi
	callq	malloc
	movl	$9, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rbx, 8(%r15)
	movq	%rbp, 16(%r15)
	movq	%r14, 8(%rbx)
	movq	%r12, 16(%rbx)
	movq	%r13, 8(%rbp)
	movq	%rax, 16(%rbp)
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	eval_sum
	movl	%eax, %edi
	callq	tig_print_int
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	eval_sum
	movl	$.L__unnamed_1, %edi
	movl	$34, %edx
	movl	%eax, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	eval_sum                # -- Begin function eval_sum
	.p2align	4, 0x90
	.type	eval_sum,@function
eval_sum:                               # @eval_sum
	.cfi_startproc
# %bb.0:                                # %test
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
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rbx, %rdi
	callq	tig_nillable
	movl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$1, %ecx
	je	.LBB1_2
# %bb.1:                                # %else
	movl	(%rbx), %r14d
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
	movl	%eax, %ebp
	addl	%r14d, %ebp
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
	addl	%ebp, %eax
.LBB1_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end1:
	.size	eval_sum, .Lfunc_end1-eval_sum
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"binary_tree.tig"
	.size	.L__unnamed_1, 16


	.section	".note.GNU-stack","",@progbits
