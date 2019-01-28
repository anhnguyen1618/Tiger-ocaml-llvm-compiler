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
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movl	$.L__unnamed_1, %esi
	movl	$.L__unnamed_1, %edx
	movq	%rbx, %rdi
	callq	assert_string
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	callq	tig_concat
	movl	$.L__unnamed_3, %edx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	assert_string
	movl	$.L__unnamed_4, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
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
	movl	$.L__unnamed_5, %edi
	callq	assert_equal_string
	popq	%rax
	retq
.Lfunc_end1:
	.size	assert_string, .Lfunc_end1-assert_string
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"test string"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_5,@object   # @1
.L__unnamed_5:
	.asciz	"string_cmp.tig"
	.size	.L__unnamed_5, 15

	.type	.L__unnamed_2,@object   # @2
.L__unnamed_2:
	.asciz	"-hello world"
	.size	.L__unnamed_2, 13

	.type	.L__unnamed_3,@object   # @3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"test string-hello world"
	.size	.L__unnamed_3, 24

	.type	.L__unnamed_4,@object   # @4
	.p2align	4
.L__unnamed_4:
	.asciz	"string_cmp.tig: Passed!"
	.size	.L__unnamed_4, 24


	.section	".note.GNU-stack","",@progbits
