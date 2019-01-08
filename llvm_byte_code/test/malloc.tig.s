	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movl	$4, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$5, (%rbx)
	movq	%rbx, 40(%rsp)
	movl	$16, %edi
	callq	malloc
	movl	$0, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rcx
	movq	%rbx, (%rax,%rcx,8)
	leal	1(%rcx), %ecx
	movl	%ecx, 12(%rsp)
	cmpl	$1, 12(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	movq	%rax, 32(%rsp)
	leaq	24(%rsp), %rdi
	callq	add
	movq	%rax, 16(%rsp)
	movq	32(%rsp), %rax
	movq	(%rax), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	movq	16(%rsp), %rax
	movq	8(%rax), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$48, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	add                     # -- Begin function add
	.p2align	4, 0x90
	.type	add,@function
add:                                    # @add
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$4, %edi
	callq	malloc
	movl	$6, (%rax)
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rcx
	movq	8(%rcx), %rcx
	movq	%rax, 8(%rcx)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	add, .Lfunc_end1-add
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
