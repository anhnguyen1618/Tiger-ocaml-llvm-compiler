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
	movl	$30, %esi
	movq	%rbx, %rdi
	callq	fib
	movl	%eax, %edi
	callq	tig_print_int
	movq	%rbx, %rdi
	callq	a
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	fib                     # -- Begin function fib
	.p2align	4, 0x90
	.type	fib,@function
fib:                                    # @fib
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movl	%esi, %ebx
	movq	%rdi, (%rsp)
	xorl	%eax, %eax
	testl	%ebx, %ebx
	je	.LBB1_3
# %bb.1:                                # %test2
	cmpl	$1, %ebx
	movl	$1, %eax
	je	.LBB1_3
# %bb.2:                                # %else4
	leal	-1(%rbx), %esi
	movq	(%rsp), %rdi
	callq	fib
	movl	%eax, %ebp
	addl	$-2, %ebx
	movq	(%rsp), %rdi
	movl	%ebx, %esi
	callq	fib
	addl	%ebp, %eax
.LBB1_3:                                # %merge
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function
	.globl	a                       # -- Begin function a
	.p2align	4, 0x90
	.type	a,@function
a:                                      # @a
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	retq
.Lfunc_end2:
	.size	a, .Lfunc_end2-a
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
