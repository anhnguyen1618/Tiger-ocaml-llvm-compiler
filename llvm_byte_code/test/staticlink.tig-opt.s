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
	movl	$5, 4(%rsp)
	movl	$28, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$6, %eax
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$4, (%rbx,%rax,4)
	incq	%rax
	cmpl	$6, %eax
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	$7, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 8(%rsp)
	movq	%rsp, %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	nested_function
	movl	$18, %edx
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	assert_int
	movl	$-5, %esi
	movq	%rbx, %rdi
	callq	nested_function
	movl	$13, %edx
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	assert_int
	movl	$-18, %esi
	movq	%rbx, %rdi
	callq	nested_function
	xorl	%edx, %edx
	movq	%rbx, %rdi
	movl	%eax, %esi
	callq	assert_int
	movl	$.L__unnamed_1, %edi
	callq	tig_print
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	nested_function         # -- Begin function nested_function
	.p2align	4, 0x90
	.type	nested_function,@function
nested_function:                        # @nested_function
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	movl	$6, 8(%rsp)
	movq	8(%rdi), %rbx
	movl	$2, %esi
	movl	$.L__unnamed_2, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
	movq	8(%rbx), %rax
	movl	$7, 8(%rax)
	movq	%rsp, %rdi
	callq	f
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	nested_function, .Lfunc_end1-nested_function
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
	movl	$.L__unnamed_3, %edi
	callq	assert_equal_int
	popq	%rax
	retq
.Lfunc_end2:
	.size	assert_int, .Lfunc_end2-assert_int
	.cfi_endproc
                                        # -- End function
	.globl	f                       # -- Begin function f
	.p2align	4, 0x90
	.type	f,@function
f:                                      # @f
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
	movq	(%rdi), %rax
	movl	4(%rax), %ebx
	addl	8(%rdi), %ebx
	movq	8(%rax), %r14
	movl	$2, %esi
	movl	$.L__unnamed_4, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
	movq	8(%r14), %rax
	addl	8(%rax), %ebx
	movq	(%rsp), %rax
	addl	12(%rax), %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end3:
	.size	f, .Lfunc_end3-f
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/staticlink.tig::10.35: Array out of bound"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_2,@object   # @1
	.p2align	4
.L__unnamed_2:
	.asciz	"test/staticlink.tig::12.6: Array out of bound"
	.size	.L__unnamed_2, 46

	.type	.L__unnamed_3,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_3:
	.asciz	"staticlink.tig"
	.size	.L__unnamed_3, 15

	.type	.L__unnamed_1,@object   # @3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"staticlink.tig: Passed!"
	.size	.L__unnamed_1, 24


	.section	".note.GNU-stack","",@progbits
