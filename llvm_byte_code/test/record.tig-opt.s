	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movq	$.L__unnamed_1, (%r14)
	movl	$10, 8(%r14)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$.L__unnamed_2, (%rbx)
	movq	%r14, 8(%rbx)
	movl	$.L__unnamed_2, %edi
	callq	tig_print
	movq	(%rbx), %rdi
	movl	$.L__unnamed_2, %esi
	callq	assert_equal_string
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	movl	$10, %esi
	callq	assert_equal_int
	movq	8(%rbx), %rax
	movl	$100, 8(%rax)
	movl	8(%r14), %edi
	movl	$100, %esi
	callq	assert_equal_int
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	callq	tig_print
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
	movq	$.L__unnamed_3, (%r14)
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	callq	tig_print
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	movl	$.L__unnamed_3, %esi
	callq	assert_equal_string
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"world"
	.size	.L__unnamed_2, 6

	.type	.L__unnamed_1,@object   # @1
.L__unnamed_1:
	.asciz	"hello"
	.size	.L__unnamed_1, 6

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"lol"
	.size	.L__unnamed_3, 4


	.section	".note.GNU-stack","",@progbits
