	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	$.L__unnamed_1, 16(%rsp)
	movq	$.L__unnamed_2, 24(%rsp)
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	callq	tig_string_cmp
	movl	%eax, 8(%rsp)
	movl	%eax, %edi
	callq	tig_print_int
	cmpl	$1, 8(%rsp)
	jne	.LBB0_2
# %bb.1:                                # %then
	movl	$.L__unnamed_3, %edi
	callq	tig_print
	movl	$1, 12(%rsp)
	jmp	.LBB0_3
.LBB0_2:                                # %else
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	movl	$0, 12(%rsp)
.LBB0_3:                                # %merge
	xorl	%eax, %eax
	addq	$40, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"string1"
	.size	.L__unnamed_1, 8

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"string1"
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"true"
	.size	.L__unnamed_3, 5

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"false"
	.size	.L__unnamed_4, 6


	.section	".note.GNU-stack","",@progbits
