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
	movabsq	$25769803782, %rax      # imm = 0x600000006
	movq	%rax, (%rsp)
	movl	$6, 8(%rsp)
	movq	%rsp, %rax
	movq	%rax, 8(%rsp)
	movl	$6, 4(%rsp)
	movq	%rax, 16(%rsp)
	movl	$10, 16(%rsp)
	movabsq	$25769803780, %rax      # imm = 0x600000004
	movq	%rax, 8(%rsp)
	movl	$4, %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
