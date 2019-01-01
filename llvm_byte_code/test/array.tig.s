	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movl	$0, 16(%rsp)
	cmpl	$4, 16(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	16(%rsp), %rax
	movl	$6, 12(%rsp,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 16(%rsp)
	cmpl	$4, 16(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	leaq	12(%rsp), %rax
	movq	%rax, 24(%rsp)
	movl	12(%rsp), %ecx
	movl	%ecx, 20(%rsp)
	movq	%rax, 32(%rsp)
	movl	$10, 28(%rsp)
	movl	$4, 20(%rsp)
	movl	$4, %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
