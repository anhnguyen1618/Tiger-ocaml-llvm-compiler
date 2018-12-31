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
	movl	$1, %edi
	movl	$5, %esi
	callq	tig_init_array
	movq	%rax, 8(%rsp)
	movl	(%rax), %ecx
	movl	%ecx, 20(%rsp)
	movl	$10, (%rax)
	movq	8(%rsp), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
