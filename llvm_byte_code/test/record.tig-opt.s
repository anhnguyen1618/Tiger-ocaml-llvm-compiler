	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
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
	movq	(%rbx), %rsi
	leaq	8(%rsp), %r15
	movl	$.L__unnamed_2, %edx
	movq	%r15, %rdi
	callq	assert_string
	movq	8(%rbx), %rax
	movl	8(%rax), %edi
	callq	tig_print_int
	movq	8(%rbx), %rax
	movl	8(%rax), %esi
	movl	$10, %edx
	movq	%r15, %rdi
	callq	assert_int
	movq	8(%rbx), %rax
	movl	$100, 8(%rax)
	movl	8(%r14), %esi
	movl	$10, %edx
	movq	%r15, %rdi
	callq	assert_int
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	callq	tig_print
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
	movl	$.L__unnamed_1, %edx
	movq	%r15, %rdi
	callq	assert_string
	movq	$.L__unnamed_3, (%r14)
	movq	8(%rbx), %rax
	movq	(%rax), %rdi
	callq	tig_print
	movq	8(%rbx), %rax
	movq	(%rax), %rsi
	movl	$.L__unnamed_3, %edx
	movq	%r15, %rdi
	callq	assert_string
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	assert_string           # -- Begin function assert_string
	.p2align	4, 0x90
	.type	assert_string,@function
assert_string:                          # @assert_string
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	$.L__unnamed_4, %edi
	callq	assert_equal_string
	popq	%rax
	retq
.Lfunc_end1:
	.size	assert_string, .Lfunc_end1-assert_string
	.cfi_endproc
                                        # -- End function
	.globl	assert_int              # -- Begin function assert_int
	.p2align	4, 0x90
	.type	assert_int,@function
assert_int:                             # @assert_int
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	$.L__unnamed_4, %edi
	callq	assert_equal_int
	popq	%rax
	retq
.Lfunc_end2:
	.size	assert_int, .Lfunc_end2-assert_int
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	"static_func.tig"
	.size	.L__unnamed_4, 16

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"world"
	.size	.L__unnamed_2, 6

	.type	.L__unnamed_1,@object   # @2
.L__unnamed_1:
	.asciz	"hello"
	.size	.L__unnamed_1, 6

	.type	.L__unnamed_3,@object   # @3
.L__unnamed_3:
	.asciz	"lol"
	.size	.L__unnamed_3, 4


	.section	".note.GNU-stack","",@progbits
