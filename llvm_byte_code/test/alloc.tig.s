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
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	$8, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$.L__unnamed_1, (%rbx)
	movq	%rbx, 24(%rsp)
	movl	$40, %edi
	callq	malloc
	movl	$0, 4(%rsp)
	cmpl	$4, 4(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rcx
	movq	%rbx, (%rax,%rcx,8)
	leal	1(%rcx), %ecx
	movl	%ecx, 4(%rsp)
	cmpl	$4, 4(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	movq	%rax, 16(%rsp)
	leaq	8(%rsp), %rdi
	callq	f
	movl	$5, %edi
	callq	tig_print_int
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	callq	tig_print
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	f                       # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$8, %edi
	callq	malloc
	movq	$.L__unnamed_2, (%rax)
	movq	%rax, 16(%rsp)
	movq	8(%rsp), %rcx
	movq	8(%rcx), %rcx
	movq	%rax, (%rcx)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movq	(%rax), %rax
	movq	(%rax), %rdi
	callq	tig_print
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello"
	.size	.L__unnamed_1, 6

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"all"
	.size	.L__unnamed_2, 4


	.section	".note.GNU-stack","",@progbits
