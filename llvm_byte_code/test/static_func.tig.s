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
	movl	$0, 4(%rsp)
	cmpl	$4, 4(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	movl	$9, 52(%rsp,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 4(%rsp)
	cmpl	$4, 4(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	leaq	52(%rsp), %rax
	movq	%rax, 16(%rsp)
	movl	$0, 32(%rsp)
	movq	$.L__unnamed_1, 40(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 24(%rsp)
	leaq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$2, %edx
	movl	$3, %ecx
	movl	$4, %r8d
	callq	f
	movq	24(%rsp), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	movq	24(%rsp), %rax
	movq	8(%rax), %rdi
	callq	tig_print
	xorl	%eax, %eax
	addq	$72, %rsp
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
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdi, 8(%rsp)
	movl	%esi, 20(%rsp)
	movl	%edx, 36(%rsp)
	movl	%ecx, 24(%rsp)
	movl	%r8d, 28(%rsp)
	movl	$7, 16(%rsp)
	leaq	8(%rsp), %rdi
	movl	$4, %esi
	callq	g
	addq	$40, %rsp
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function
	.globl	g                       # -- Begin function g
	.p2align	4, 0x90
	.type	g,@function
g:                                      # @g
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 16(%rsp)
	movl	%esi, 12(%rsp)
	movl	12(%rdi), %edi
	callq	tig_print_int
	movl	12(%rsp), %edi
	callq	tig_print_int
	movq	16(%rsp), %rax
	movl	16(%rax), %edi
	callq	tig_print_int
	movq	16(%rsp), %rax
	movl	20(%rax), %edi
	callq	tig_print_int
	movq	16(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %rax
	movq	$.L__unnamed_2, 8(%rax)
	movq	16(%rsp), %rax
	movq	(%rax), %rcx
	movq	8(%rcx), %rdx
	movq	16(%rcx), %rcx
	movl	12(%rax), %esi
	addl	12(%rsp), %esi
	addl	16(%rax), %esi
	addl	20(%rax), %esi
	addl	8(%rax), %esi
	addl	16(%rdx), %esi
	movl	%esi, (%rcx)
	addq	$24, %rsp
	retq
.Lfunc_end2:
	.size	g, .Lfunc_end2-g
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello world"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"nha ba thin"
	.size	.L__unnamed_2, 12


	.section	".note.GNU-stack","",@progbits
