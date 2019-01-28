	.text
	.file	"Tiger jit"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	xorl	%ebx, %ebx
	cmpl	$5, %ebx
	jl	.LBB0_2
	jmp	.LBB0_4
	.p2align	4, 0x90
.LBB0_3:                                # %merge
                                        #   in Loop: Header=BB0_2 Depth=1
	incl	%ebx
	cmpl	$5, %ebx
	jge	.LBB0_4
.LBB0_2:                                # %test3
                                        # =>This Inner Loop Header: Depth=1
	movl	%ebx, %edi
	callq	tig_print_int
	cmpl	$3, %ebx
	jne	.LBB0_3
.LBB0_4:                                # %end
	leal	2(%rbx), %ebp
	leaq	8(%rsp), %r14
	movl	$3, %edx
	movq	%r14, %rdi
	movl	%ebx, %esi
	callq	assert_int
	movl	$5, %edx
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	assert_int
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
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
.Lfunc_end1:
	.size	assert_int, .Lfunc_end1-assert_int
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"whileloop.tig"
	.size	.L__unnamed_2, 14

	.type	.L__unnamed_1,@object   # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"whileloop.tig: Passed!"
	.size	.L__unnamed_1, 23


	.section	".note.GNU-stack","",@progbits
