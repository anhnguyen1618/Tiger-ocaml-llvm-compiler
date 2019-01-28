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
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	(%rbx), %edi
	callq	tig_print_int
	movl	(%rbx), %edi
	movl	%ebp, %esi
	callq	assert_equal_int
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
	movl	$4, %esi
	movl	%ebp, %edi
	callq	assert_equal_int
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"end program"
	.size	.L__unnamed_1, 12


	.section	".note.GNU-stack","",@progbits
