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
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r14
	movl	$1, (%r14)
	movq	$0, 8(%r14)
	leaq	8(%rsp), %rdi
	callq	f
	movq	%rax, %rbx
	movl	$40, %edi
	callq	malloc
	movq	%rax, %r12
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, (%r12,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r15
	movl	$5, (%r15)
	movq	%r12, 8(%r15)
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB0_6
	.p2align	4, 0x90
.LBB0_5:                                # %loop12
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rbx,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB0_5
.LBB0_6:                                # %end13
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r12
	movl	$5, (%r12)
	movq	%rbx, 8(%r12)
	movl	$40, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB0_9
	.p2align	4, 0x90
.LBB0_8:                                # %loop30
                                        # =>This Inner Loop Header: Depth=1
	movq	$0, (%rbx,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB0_8
.LBB0_9:                                # %end31
	movl	$16, %edi
	callq	malloc
	movq	%rax, %r13
	movl	$5, (%r13)
	movq	%rbx, 8(%r13)
	movl	$1, %esi
	movl	$.L__unnamed_1, %edx
	movq	%r15, %rdi
	callq	tig_check_array_bound
	movq	8(%r15), %rax
	movq	8(%rax), %rdi
	callq	tig_nillable
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_2, %edx
	movq	%r12, %rdi
	callq	tig_check_array_bound
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	callq	tig_nillable
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	movl	$1, %esi
	movl	$.L__unnamed_3, %edx
	movq	%r13, %rdi
	callq	tig_check_array_bound
	movq	8(%r13), %rax
	movq	8(%rax), %rdi
	callq	tig_nillable
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	leaq	8(%rsp), %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	g
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	g
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	movl	$.L__unnamed_4, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
	movq	8(%r14), %rsi
	movq	%rbx, %rdi
	callq	g
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	f                       # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	xorl	%eax, %eax
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function
	.globl	g                       # -- Begin function g
	.p2align	4, 0x90
	.type	g,@function
g:                                      # @g
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rbx, %rdi
	callq	tig_nillable
	movl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$1, %ecx
	je	.LBB2_2
# %bb.1:                                # %else
	movl	$.L__unnamed_5, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %eax
.LBB2_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end2:
	.size	g, .Lfunc_end2-g
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_5,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_5:
	.asciz	"test/array_of_nil.tig::10.17: Nil pointer exception!"
	.size	.L__unnamed_5, 53

	.type	.L__unnamed_1,@object   # @1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/array_of_nil.tig::16.25: Array out of bound"
	.size	.L__unnamed_1, 49

	.type	.L__unnamed_2,@object   # @2
	.p2align	4
.L__unnamed_2:
	.asciz	"test/array_of_nil.tig::17.26: Array out of bound"
	.size	.L__unnamed_2, 49

	.type	.L__unnamed_3,@object   # @3
	.p2align	4
.L__unnamed_3:
	.asciz	"test/array_of_nil.tig::18.26: Array out of bound"
	.size	.L__unnamed_3, 49

	.type	.L__unnamed_4,@object   # @4
	.p2align	4
.L__unnamed_4:
	.asciz	"test/array_of_nil.tig::21.18: Nil pointer exception!"
	.size	.L__unnamed_4, 53


	.section	".note.GNU-stack","",@progbits
