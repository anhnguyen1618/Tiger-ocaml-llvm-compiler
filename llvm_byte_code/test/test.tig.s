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
	movl	$30, %esi
	callq	fib
	movl	%eax, %edi
	callq	tig_print_int
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
# %bb.0:                                # %test
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 24(%rsp)
	movl	%esi, 12(%rsp)
	testl	%esi, %esi
	jne	.LBB1_3
# %bb.1:                                # %then
	movl	$0, 20(%rsp)
	jmp	.LBB1_2
.LBB1_3:                                # %test2
	cmpl	$1, 12(%rsp)
	jne	.LBB1_5
# %bb.4:                                # %then3
	movl	$1, 16(%rsp)
	jmp	.LBB1_6
.LBB1_5:                                # %else4
	movl	12(%rsp), %esi
	decl	%esi
	movq	24(%rsp), %rdi
	callq	fib
	movl	%eax, %ebx
	movl	12(%rsp), %esi
	addl	$-2, %esi
	movq	24(%rsp), %rdi
	callq	fib
	addl	%ebx, %eax
	movl	%eax, 16(%rsp)
.LBB1_6:                                # %merge5
	movl	16(%rsp), %eax
	movl	%eax, 20(%rsp)
.LBB1_2:                                # %merge
	movl	20(%rsp), %eax
	addq	$32, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	fib, .Lfunc_end1-fib
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
