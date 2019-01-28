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
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$4, %edi
	callq	malloc
	movq	%rax, %rbx
	movl	$5, (%rbx)
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	xorl	%eax, %eax
	cmpl	$1, %eax
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, (%r14,%rax,8)
	incq	%rax
	cmpl	$1, %eax
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	$2, (%rax)
	movq	%r14, 8(%rax)
	movq	%rax, 16(%rsp)
	leaq	8(%rsp), %rdi
	callq	create_rec
	movq	%rax, %r14
	movq	16(%rsp), %rbx
	xorl	%esi, %esi
	movl	$.L__unnamed_1, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movq	(%rax), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	movq	16(%rsp), %rbx
	xorl	%esi, %esi
	movl	$.L__unnamed_2, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movq	(%rax), %rax
	movl	(%rax), %edi
	movl	$5, %esi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_3, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movq	8(%rax), %rax
	movl	(%rax), %edi
	callq	tig_print_int
	movl	$1, %esi
	movl	$.L__unnamed_4, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movq	8(%rax), %rax
	movl	(%rax), %edi
	movl	$6, %esi
	callq	assert_equal_int
	movq	16(%rsp), %rbx
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movq	8(%rax), %rax
	movl	$5, (%rax)
	movl	$1, %esi
	movl	$.L__unnamed_6, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	movq	8(%rax), %rax
	movl	(%rax), %edi
	movl	$5, %esi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	create_rec              # -- Begin function create_rec
	.p2align	4, 0x90
	.type	create_rec,@function
create_rec:                             # @create_rec
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
	movq	%rdi, (%rsp)
	movl	$4, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$6, (%r14)
	movq	(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$1, %esi
	movl	$.L__unnamed_7, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movq	%r14, 8(%rax)
	movq	(%rsp), %rax
	movq	8(%rax), %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end1:
	.size	create_rec, .Lfunc_end1-create_rec
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_7,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_7:
	.asciz	"test/malloc.tig::11.6: Array out of bound"
	.size	.L__unnamed_7, 42

	.type	.L__unnamed_1,@object   # @1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/malloc.tig::17.14: Array out of bound"
	.size	.L__unnamed_1, 43

	.type	.L__unnamed_2,@object   # @2
	.p2align	4
.L__unnamed_2:
	.asciz	"test/malloc.tig::18.15: Array out of bound"
	.size	.L__unnamed_2, 43

	.type	.L__unnamed_3,@object   # @3
	.p2align	4
.L__unnamed_3:
	.asciz	"test/malloc.tig::20.12: Array out of bound"
	.size	.L__unnamed_3, 43

	.type	.L__unnamed_4,@object   # @4
	.p2align	4
.L__unnamed_4:
	.asciz	"test/malloc.tig::21.13: Array out of bound"
	.size	.L__unnamed_4, 43

	.type	.L__unnamed_5,@object   # @5
	.p2align	4
.L__unnamed_5:
	.asciz	"test/malloc.tig::23.4: Array out of bound"
	.size	.L__unnamed_5, 42

	.type	.L__unnamed_6,@object   # @6
	.p2align	4
.L__unnamed_6:
	.asciz	"test/malloc.tig::24.13: Array out of bound"
	.size	.L__unnamed_6, 43


	.section	".note.GNU-stack","",@progbits
