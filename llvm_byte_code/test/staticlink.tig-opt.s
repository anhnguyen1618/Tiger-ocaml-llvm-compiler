	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/staticlink__code_begin"
"camlLlvm_byte_code/test/staticlink__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/staticlink__data_begin"
"camlLlvm_byte_code/test/staticlink__data_begin":
	.text
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
.Ltmp0:
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
.Ltmp1:
	movl	$7, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 8(%rsp)
	movq	%rsp, %rbx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	callq	nested_function
.Ltmp2:
	movl	$18, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp3:
	movl	$-5, %esi
	movq	%rbx, %rdi
	callq	nested_function
.Ltmp4:
	movl	$13, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp5:
	movl	$-18, %esi
	movq	%rbx, %rdi
	callq	nested_function
.Ltmp6:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp7:
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
	movl	$.L__unnamed_1, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp8:
	movq	8(%rbx), %rax
	movl	$7, 8(%rax)
	movq	%rsp, %rdi
	callq	f
.Ltmp9:
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	nested_function, .Lfunc_end1-nested_function
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
	movl	$.L__unnamed_2, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
.Ltmp10:
	movq	8(%r14), %rax
	addl	8(%rax), %ebx
	movq	(%rsp), %rax
	addl	12(%rax), %ebx
	movl	%ebx, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
.Lfunc_end2:
	.size	f, .Lfunc_end2-f
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_2:
	.asciz	"test/staticlink.tig::10.35: Array out of bound"
	.size	.L__unnamed_2, 47

	.type	.L__unnamed_1,@object   # @1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/staticlink.tig::12.6: Array out of bound"
	.size	.L__unnamed_1, 46


	.text
	.globl	"camlLlvm_byte_code/test/staticlink__code_end"
"camlLlvm_byte_code/test/staticlink__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/staticlink__data_end"
"camlLlvm_byte_code/test/staticlink__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/staticlink__frametable"
"camlLlvm_byte_code/test/staticlink__frametable":
	.short	11
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	24
	.short	0
	.p2align	3
                                        # live roots for nested_function
	.quad	.Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	24
	.short	0
	.p2align	3
                                        # live roots for f
	.quad	.Ltmp10
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
