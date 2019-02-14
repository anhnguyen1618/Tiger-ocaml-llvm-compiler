	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/static_func__code_begin"
"camlLlvm_byte_code/test/static_func__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/static_func__data_begin"
"camlLlvm_byte_code/test/static_func__data_begin":
	.text
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
.Ltmp0:
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
.Ltmp1:
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movq	%rax, 16(%rsp)
	movl	$16, %edi
	callq	malloc
.Ltmp2:
	movl	$0, (%rax)
	movq	$.L__unnamed_1, 8(%rax)
	movq	%rax, 24(%rsp)
	leaq	8(%rsp), %rdi
	movl	$1, %esi
	movl	$2, %edx
	movl	$3, %ecx
	movl	$4, %r8d
	callq	f
.Ltmp3:
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_2, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp4:
	movl	(%rbx), %edi
	callq	tig_print_int
.Ltmp5:
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_3, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp6:
	movq	8(%rbx), %rdi
	callq	tig_print
.Ltmp7:
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_4, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp8:
	movl	(%rbx), %edi
	movl	$28, %esi
	callq	assert_equal_int
.Ltmp9:
	movq	24(%rsp), %rbx
	movl	$.L__unnamed_5, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp10:
	movq	8(%rbx), %rdi
	movl	$.L__unnamed_6, %esi
	callq	assert_equal_string
.Ltmp11:
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
.Ltmp12:
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
.Ltmp13:
	movl	%ebx, %edi
	callq	tig_print_int
.Ltmp14:
	movq	8(%rsp), %rax
	movl	16(%rax), %edi
	callq	tig_print_int
.Ltmp15:
	movq	8(%rsp), %rax
	movl	20(%rax), %edi
	callq	tig_print_int
.Ltmp16:
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %r14
	movl	$.L__unnamed_7, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
.Ltmp17:
	movq	$.L__unnamed_6, 8(%r14)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	movq	16(%rax), %r14
	movl	$.L__unnamed_8, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
.Ltmp18:
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
.Ltmp19:
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


	.text
	.globl	"camlLlvm_byte_code/test/static_func__code_end"
"camlLlvm_byte_code/test/static_func__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/static_func__data_end"
"camlLlvm_byte_code/test/static_func__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/static_func__frametable"
"camlLlvm_byte_code/test/static_func__frametable":
	.short	20
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	40
	.short	0
	.p2align	3
                                        # live roots for f
	.quad	.Ltmp12
	.short	24
	.short	0
	.p2align	3
                                        # live roots for g
	.quad	.Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp19
	.short	40
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
