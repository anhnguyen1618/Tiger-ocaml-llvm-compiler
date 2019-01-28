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
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$3, (%r14)
	movq	$0, 8(%r14)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbp
	movl	$2, (%rbp)
	movq	$0, 8(%rbp)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$1, (%rbx)
	movq	%rbp, 8(%rbx)
	movq	%r14, 8(%rbp)
	movq	%rbx, %rdi
	callq	tig_nillable
	movl	%eax, %edi
	callq	tig_print_int
	movl	$1, %ebp
	leaq	8(%rsp), %r14
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	(%rbx), %edi
	callq	tig_print_int
	movl	(%rbx), %esi
	movq	%r14, %rdi
	movl	%ebp, %edx
	callq	assert_int
	movq	8(%rbx), %rbx
	incl	%ebp
.LBB0_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	tig_nillable
	testl	%eax, %eax
	je	.LBB0_2
# %bb.3:                                # %end
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	leaq	8(%rsp), %rdi
	movl	$4, %edx
	movl	%ebp, %esi
	callq	assert_int
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
	.asciz	"linked_list.tig"
	.size	.L__unnamed_2, 16

	.type	.L__unnamed_1,@object   # @1
.L__unnamed_1:
	.asciz	"end program"
	.size	.L__unnamed_1, 12


	.section	".note.GNU-stack","",@progbits
