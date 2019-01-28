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
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	f
	movl	%eax, %edi
	callq	tig_print_int
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	f
	movl	$20, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
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
                                        # kill: def %esi killed %esi def %rsi
	movq	%rdi, -8(%rsp)
	leal	10(%rsi), %eax
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
