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
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	callq	tig_concat
	movl	$.L__unnamed_3, %esi
	movq	%rax, %rdi
	callq	assert_equal_string
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
	.asciz	"test string"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"-hello world"
	.size	.L__unnamed_2, 13

	.type	.L__unnamed_3,@object   # @2
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"test string-hello world"
	.size	.L__unnamed_3, 24


	.section	".note.GNU-stack","",@progbits
