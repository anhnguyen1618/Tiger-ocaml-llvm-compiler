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
	movl	$8, %edi
	callq	malloc
	movq	%rax, %rbx
	movq	$.L__unnamed_1, (%rbx)
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	movq	(%rbx), %rsi
	movq	%rsp, %r14
	movl	$.L__unnamed_1, %edx
	movq	%r14, %rdi
	callq	assert_string
	movq	%rbx, %rdi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	movq	%rbx, %rdi
	callq	tig_nillable
	xorl	%edx, %edx
	movq	%r14, %rdi
	movl	%eax, %esi
	callq	assert_int
	xorl	%edi, %edi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	xorl	%edi, %edi
	callq	tig_nillable
	movl	$1, %edx
	movq	%r14, %rdi
	movl	%eax, %esi
	callq	assert_int
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
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
	movl	$.L__unnamed_2, %edi
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
	movl	$.L__unnamed_2, %edi
	callq	assert_equal_int
	popq	%rax
	retq
.Lfunc_end2:
	.size	assert_int, .Lfunc_end2-assert_int
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"nil.tig"
	.size	.L__unnamed_2, 8

	.type	.L__unnamed_1,@object   # @1
.L__unnamed_1:
	.asciz	"hello world"
	.size	.L__unnamed_1, 12


	.section	".note.GNU-stack","",@progbits
