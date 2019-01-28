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
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	xorl	%ebx, %ebx
	cmpl	$5, %ebx
	jl	.LBB0_2
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                # %merge
                                        #   in Loop: Header=BB0_2 Depth=1
	incl	%ebx
	cmpl	$5, %ebx
	jge	.LBB0_4
.LBB0_2:                                # %test3
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	tig_print_int
	cmpl	$3, %ebx
	jne	.LBB0_3
.LBB0_4:                                # %end
	leal	2(%rbx), %ebp
	movl	$3, %esi
	movl	%ebx, %edi
	callq	assert_equal_int
	movl	$5, %esi
	movl	%ebp, %edi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
