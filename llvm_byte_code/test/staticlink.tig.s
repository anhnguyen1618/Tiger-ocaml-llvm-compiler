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
	movl	$5, 4(%rsp)
	movq	%rsp, %rdi
	callq	x
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	x                       # -- Begin function x
	.p2align	4, 0x90
	.type	x,@function
x:                                      # @x
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	4(%rdi), %edi
	callq	tig_print_int
	movl	$5, %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	x, .Lfunc_end1-x
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
