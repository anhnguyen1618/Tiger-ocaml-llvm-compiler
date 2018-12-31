	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$2, %edi
	callq	tig_init_record
	movabsq	$42949672965, %rcx      # imm = 0xA00000005
	movq	%rcx, (%rax)
	movq	%rax, (%rsp)
	movl	4(%rax), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
