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
	movq	%rsp, %rdi
	callq	a
	movl	%eax, %edi
	callq	tig_print_int
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	a                       # -- Begin function a
	.p2align	4, 0x90
	.type	a,@function
a:                                      # @a
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	b
	popq	%rcx
	retq
.Lfunc_end1:
	.size	a, .Lfunc_end1-a
	.cfi_endproc
                                        # -- End function
	.globl	b                       # -- Begin function b
	.p2align	4, 0x90
	.type	b,@function
b:                                      # @b
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	$4, %eax
	retq
.Lfunc_end2:
	.size	b, .Lfunc_end2-b
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
