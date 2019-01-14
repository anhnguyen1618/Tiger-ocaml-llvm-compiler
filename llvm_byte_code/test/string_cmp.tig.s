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
	movq	$.L__unnamed_1, 8(%rsp)
	movq	$.L__unnamed_2, 24(%rsp)
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	callq	tig_string_cmp
	movl	%eax, 4(%rsp)
	movq	8(%rsp), %rdi
	movl	$.L__unnamed_3, %esi
	callq	tig_concat
	movq	%rax, 16(%rsp)
	movl	4(%rsp), %edi
	callq	tig_print_int
	movq	16(%rsp), %rdi
	callq	tig_print
	cmpl	$1, 4(%rsp)
	jne	.LBB0_2
# %bb.1:                                # %then
	movl	$.L__unnamed_4, %edi
	jmp	.LBB0_3
.LBB0_2:                                # %else
	movl	$.L__unnamed_5, %edi
.LBB0_3:                                # %merge
	callq	tig_print
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
	.asciz	"hello world"
	.size	.L__unnamed_3, 12

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"true"
	.size	.L__unnamed_4, 5

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"false"
	.size	.L__unnamed_5, 6


	.section	".note.GNU-stack","",@progbits
