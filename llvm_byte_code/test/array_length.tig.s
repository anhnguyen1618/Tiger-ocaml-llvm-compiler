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
	movl	$400, %edi              # imm = 0x190
	callq	malloc
	movq	%rax, %rbx
	movl	$0, 12(%rsp)
	cmpl	$99, 12(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rax
	movl	$6, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 12(%rsp)
	cmpl	$99, 12(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	$100, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
