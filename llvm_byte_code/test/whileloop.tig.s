	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$0, 4(%rsp)
	movl	$2, 8(%rsp)
	cmpl	$4, 4(%rsp)
	jle	.LBB0_2
	jmp	.LBB0_3
	.p2align	4, 0x90
.LBB0_4:                                # %merge
                                        #   in Loop: Header=BB0_2 Depth=1
	movl	$0, 12(%rsp)
	incl	8(%rsp)
	incl	4(%rsp)
	cmpl	$4, 4(%rsp)
	jg	.LBB0_3
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	4(%rsp), %edi
	callq	tig_print_int
	cmpl	$3, 4(%rsp)
	jl	.LBB0_4
.LBB0_3:                                # %end
	movl	8(%rsp), %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.section	".note.GNU-stack","",@progbits
