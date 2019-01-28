	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %merge
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$-8, %edi
	callq	tig_print_int
	movl	$.L__unnamed_1, %edi
	movl	$-8, %esi
	movl	$-8, %edx
	callq	assert_equal_int
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"nested_dec.tig"
	.size	.L__unnamed_1, 15


	.section	".note.GNU-stack","",@progbits
