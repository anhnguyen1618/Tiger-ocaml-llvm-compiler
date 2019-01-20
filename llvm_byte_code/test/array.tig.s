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
	movl	$5, 20(%rsp)
	movl	$5, %ebp
	movl	$20, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$0, 4(%rsp)
	cmpl	%ebp, 4(%rsp)
	jge	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movslq	4(%rsp), %rax
	movl	$6, (%rbx,%rax,4)
	leal	1(%rax), %eax
	movl	%eax, 4(%rsp)
	cmpl	%ebp, 4(%rsp)
	jl	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	%ebp, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 8(%rsp)
	movq	8(%rax), %rax
	movl	$10, 8(%rax)
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movl	16(%rax), %edi
	callq	tig_print_int
	movq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	callq	f
	movq	8(%rsp), %rax
	movq	8(%rax), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	movq	8(%rsi), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	movl	$1, %eax
	addq	$24, %rsp
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
