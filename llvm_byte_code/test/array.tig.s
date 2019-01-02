	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movl	$0, 12(%rsp)
	cmpl	$4, 12(%rsp)
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	12(%rsp), %rax
	movl	$6, 24(%rsp,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 12(%rsp)
	cmpl	$4, 12(%rsp)
	jle	.LBB0_2
.LBB0_3:                                # %end
	leaq	24(%rsp), %rax
	movq	%rax, 48(%rsp)
	movl	24(%rsp), %ecx
	movl	%ecx, 44(%rsp)
	movq	%rax, 16(%rsp)
	movl	$10, 40(%rsp)
	movl	$4, 32(%rsp)
	movl	$4, %edi
	callq	tig_print_int
	movq	16(%rsp), %rdi
	callq	f
	xorl	%eax, %eax
	addq	$56, %rsp
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
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	12(%rdi), %edi
	callq	tig_print_int
	movl	$1, %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
