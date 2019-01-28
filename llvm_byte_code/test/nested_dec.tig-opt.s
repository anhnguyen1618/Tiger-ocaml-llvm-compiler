	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %merge
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$-8, %edi
	callq	tig_print_int
	movl	$-8, %edi
	movl	$-8, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
