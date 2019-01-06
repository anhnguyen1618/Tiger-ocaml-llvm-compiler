	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$5, (%rsp)
	cmpl	$5, (%rsp)
	jne	.LBB0_2
# %bb.1:                                # %then
	movl	$6, 8(%rsp)
	movl	$6, 4(%rsp)
	jmp	.LBB0_3
.LBB0_2:                                # %else
	movl	$7, 12(%rsp)
	movl	$7, 4(%rsp)
.LBB0_3:                                # %merge
	movl	4(%rsp), %edi
	movl	%edi, (%rsp)
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
