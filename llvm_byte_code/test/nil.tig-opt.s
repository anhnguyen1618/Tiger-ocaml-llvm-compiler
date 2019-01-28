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
	.cfi_offset %rbx, -16
	movl	$8, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$.L__unnamed_1, (%rbx)
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	(%rbx), %rdi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
	movq	%rbx, %rdi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	movq	%rbx, %rdi
	callq	tig_nillable
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	xorl	%edi, %edi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	xorl	%edi, %edi
	callq	tig_nillable
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	xorl	%eax, %eax
	popq	%rbx
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
