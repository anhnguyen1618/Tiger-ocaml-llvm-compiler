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
	movl	$5, %edi
	callq	fib
	xorl	%eax, %eax
	popq	%rcx
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
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	testq	%rdi, %rdi
	jne	.LBB1_2
# %bb.1:
	xorl	%eax, %eax
	jmp	.LBB1_4
.LBB1_2:                                # %else
	cmpq	$1, 8(%rsp)
	jne	.LBB1_5
# %bb.3:
	movl	$1, %eax
	jmp	.LBB1_4
.LBB1_5:                                # %else3
	movq	8(%rsp), %rdi
	decq	%rdi
	callq	fib
	movq	%rax, %rbx
	movq	8(%rsp), %rdi
	addq	$-2, %rdi
	callq	fib
	addq	%rbx, %rax
.LBB1_4:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
