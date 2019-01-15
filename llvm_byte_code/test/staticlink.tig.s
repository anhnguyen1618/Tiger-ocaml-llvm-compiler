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
	pushq	%rbx
	.cfi_def_cfa_offset 24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	$5, 12(%rsp)
	movl	$7, 4(%rsp)
	movl	$7, %ebp
	movl	$28, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$0, (%rsp)
	cmpl	%ebp, (%rsp)
	jge	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	(%rsp), %rax
	movl	$4, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, (%rsp)
	cmpl	%ebp, (%rsp)
	jl	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	leaq	8(%rsp), %rdi
	callq	x
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
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
	movq	8(%rax), %rax
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
