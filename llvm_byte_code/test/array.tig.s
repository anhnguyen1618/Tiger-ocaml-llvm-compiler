	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$5, -20(%rbp)
	movl	-20(%rbp), %eax
	leaq	15(,%rax,4), %rcx
	movabsq	$34359738352, %rdx      # imm = 0x7FFFFFFF0
	andq	%rcx, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rsp
	movl	$0, -4(%rbp)
	cmpl	%eax, -4(%rbp)
	jge	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	-4(%rbp), %rdx
	movl	$6, (%rcx,%rdx,4)
	leal	1(%rdx), %edx
	movl	%edx, -4(%rbp)
	cmpl	%eax, -4(%rbp)
	jl	.LBB0_2
.LBB0_3:                                # %end
	movq	%rcx, -16(%rbp)
	movl	$10, 8(%rcx)
	movq	-16(%rbp), %rax
	movl	16(%rax), %edi
	callq	tig_print_int
	movq	-16(%rbp), %rdi
	callq	f
	movq	-16(%rbp), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	movq	%rbp, %rsp
	popq	%rbp
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
	movl	8(%rdi), %edi
	callq	tig_print_int
	movl	$1, %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
