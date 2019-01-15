	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movl	$24, %edi
	callq	malloc
	movl	$5, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 8(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$1, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 40(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$2, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 16(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$3, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 48(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$6, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 56(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$8, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 24(%rsp)
	movl	$24, %edi
	callq	malloc
	movl	$9, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movq	%rax, 64(%rsp)
	movq	8(%rsp), %rax
	movq	16(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	8(%rsp), %rax
	movq	24(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	16(%rsp), %rax
	movq	40(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	16(%rsp), %rax
	movq	48(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	24(%rsp), %rax
	movq	56(%rsp), %rcx
	movq	%rcx, 8(%rax)
	movq	24(%rsp), %rax
	movq	64(%rsp), %rcx
	movq	%rcx, 16(%rax)
	movq	8(%rsp), %rsi
	leaq	32(%rsp), %rdi
	callq	eval_sum
	movl	%eax, %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$72, %rsp
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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rsi, %rdi
	callq	tig_nillable
	cmpl	$1, %eax
	jne	.LBB1_2
# %bb.1:                                # %then
	movl	$0, 4(%rsp)
	jmp	.LBB1_3
.LBB1_2:                                # %else
	movq	16(%rsp), %rax
	movl	(%rax), %ebp
	movq	8(%rax), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
	movl	%eax, %ebx
	addl	%ebp, %ebx
	movq	16(%rsp), %rax
	movq	16(%rax), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
	addl	%ebx, %eax
	movl	%eax, 4(%rsp)
.LBB1_3:                                # %merge
	movl	4(%rsp), %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	eval_sum, .Lfunc_end1-eval_sum
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
