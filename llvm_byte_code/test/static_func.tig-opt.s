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
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movl	$20, %edi
	callq	malloc
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	jg	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        # =>This Inner Loop Header: Depth=1
	movl	$9, (%rbx,%rax,4)
	incq	%rax
	cmpl	$4, %eax
	jle	.LBB0_2
.LBB0_3:                                # %end
	movl	$16, %edi
	callq	malloc
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	movl	$16, %edi
	callq	malloc
	movl	$0, (%rax)
	movq	$.L__unnamed_1, 8(%rax)
	movq	%rax, 24(%rsp)
	leaq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$2, %edx
	movl	$3, %ecx
	movl	$4, %r8d
	callq	f
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_2, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %edi
	callq	tig_print_int
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_3, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rdi
	callq	tig_print
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_4, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movl	(%rbx), %edi
	movl	$28, %esi
	callq	assert_equal_int
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_5, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
	movq	8(%rbx), %rdi
	movl	$.L__unnamed_6, %esi
	callq	assert_equal_string
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	movl	%esi, 12(%rsp)
	movl	%ecx, 16(%rsp)
	movl	%r8d, 20(%rsp)
	movl	$7, 8(%rsp)
	movq	%rsp, %rdi
	movl	$4, %esi
	callq	g
	addq	$24, %rsp
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
	movl	%esi, %ebx
	movq	%rdi, 8(%rsp)
	movl	12(%rdi), %edi
	callq	tig_print_int
	movl	%ebx, %edi
	callq	tig_print_int
	movq	8(%rsp), %rax
	movl	16(%rax), %edi
	callq	tig_print_int
	movq	8(%rsp), %rax
	movl	20(%rax), %edi
	callq	tig_print_int
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %r14
	movl	$.L__unnamed_7, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
	movq	$.L__unnamed_6, 8(%r14)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %r14
	movl	$.L__unnamed_8, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
	movq	8(%rsp), %rax
	addl	12(%rax), %ebx
	addl	16(%rax), %ebx
	addl	20(%rax), %ebx
	addl	8(%rax), %ebx
	movq	(%rax), %rax
	movq	8(%rax), %r15
	movl	$4, %esi
	movl	$.L__unnamed_9, %edx
	movq	%r15, %rdi
	callq	tig_check_array_bound
	movq	8(%r15), %rax
	addl	16(%rax), %ebx
	movl	%ebx, (%r14)
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end2:
	.size	g, .Lfunc_end2-g
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello world"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_7,@object   # @1
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_7:
	.asciz	"test/static_func.tig::15.8: Nil pointer exception!"
	.size	.L__unnamed_7, 51

	.type	.L__unnamed_8,@object   # @2
	.p2align	4
.L__unnamed_8:
	.asciz	"test/static_func.tig::16.8: Nil pointer exception!"
	.size	.L__unnamed_8, 51

	.type	.L__unnamed_9,@object   # @3
	.p2align	4
.L__unnamed_9:
	.asciz	"test/static_func.tig::16.43: Array out of bound"
	.size	.L__unnamed_9, 48

	.type	.L__unnamed_2,@object   # @4
	.p2align	4
.L__unnamed_2:
	.asciz	"test/static_func.tig::23.13: Nil pointer exception!"
	.size	.L__unnamed_2, 52

	.type	.L__unnamed_3,@object   # @5
	.p2align	4
.L__unnamed_3:
	.asciz	"test/static_func.tig::24.10: Nil pointer exception!"
	.size	.L__unnamed_3, 52

	.type	.L__unnamed_4,@object   # @6
	.p2align	4
.L__unnamed_4:
	.asciz	"test/static_func.tig::26.15: Nil pointer exception!"
	.size	.L__unnamed_4, 52

	.type	.L__unnamed_5,@object   # @7
	.p2align	4
.L__unnamed_5:
	.asciz	"test/static_func.tig::27.18: Nil pointer exception!"
	.size	.L__unnamed_5, 52

	.type	.L__unnamed_6,@object   # @8
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_6:
	.asciz	"foo bar"
	.size	.L__unnamed_6, 8


	.section	".note.GNU-stack","",@progbits
