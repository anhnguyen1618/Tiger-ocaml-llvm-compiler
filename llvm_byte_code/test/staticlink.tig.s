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
	movl	$7, -8(%rbp)
	movl	-8(%rbp), %eax
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
	movl	$4, (%rcx,%rdx,4)
	leal	1(%rdx), %edx
	movl	%edx, -4(%rbp)
	cmpl	%eax, -4(%rbp)
	jl	.LBB0_2
.LBB0_3:                                # %end
	movq	%rcx, -16(%rbp)
	leaq	-24(%rbp), %rdi
	callq	x
	xorl	%eax, %eax
	movq	%rbp, %rsp
	popq	%rbp
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movl	$6, 16(%rsp)
	movq	8(%rdi), %rax
	movl	$7, 8(%rax)
	leaq	8(%rsp), %rdi
	callq	f
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	x, .Lfunc_end1-x
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
	movq	(%rdi), %rcx
	movl	4(%rcx), %eax
	addl	8(%rdi), %eax
	movq	8(%rcx), %rcx
	addl	8(%rcx), %eax
	movl	%eax, %edi
	callq	tig_print_int
	movl	$4, %eax
	popq	%rcx
	retq
.Lfunc_end2:
	.size	f, .Lfunc_end2-f
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
