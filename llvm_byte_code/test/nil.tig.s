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
	movq	$0, 8(%rsp)
	movl	$8, %edi
	callq	malloc
	movq	$.L__unnamed_1, (%rax)
	movq	%rax, (%rsp)
	movq	(%rax), %rdi
	callq	tig_print
	movq	(%rsp), %rdi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	movq	$0, (%rsp)
	xorl	%edi, %edi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	xorl	%eax, %eax
	addq	$24, %rsp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello world"
	.size	.L__unnamed_1, 12


	.section	".note.GNU-stack","",@progbits
