	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/binary_tree__code_begin"
"camlLlvm_byte_code/test/binary_tree__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/binary_tree__data_begin"
"camlLlvm_byte_code/test/binary_tree__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$24, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %r15
	movl	$5, (%r15)
	movq	$0, 8(%r15)
	movq	$0, 16(%r15)
	movl	$24, %edi
	callq	malloc
.Ltmp1:
	movq	%rax, 8(%rsp)           # 8-byte Spill
	movl	$1, (%rax)
	movq	$0, 8(%rax)
	movq	$0, 16(%rax)
	movl	$24, %edi
	callq	malloc
.Ltmp2:
	movq	%rax, %rbx
	movl	$2, (%rbx)
	movq	$0, 8(%rbx)
	movq	$0, 16(%rbx)
	movl	$24, %edi
	callq	malloc
.Ltmp3:
	movq	%rax, %r12
	movl	$3, (%r12)
	movq	$0, 8(%r12)
	movq	$0, 16(%r12)
	movl	$24, %edi
	callq	malloc
.Ltmp4:
	movq	%rax, %r13
	movl	$6, (%r13)
	movq	$0, 8(%r13)
	movq	$0, 16(%r13)
	movl	$24, %edi
	callq	malloc
.Ltmp5:
	movq	%rax, %rbp
	movl	$8, (%rbp)
	movq	$0, 8(%rbp)
	movq	$0, 16(%rbp)
	movl	$24, %edi
	callq	malloc
.Ltmp6:
	movq	%rax, %r14
	movl	$9, (%r14)
	movq	$0, 8(%r14)
	movq	$0, 16(%r14)
	movl	$.L__unnamed_1, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp7:
	movq	%rbx, 8(%r15)
	movl	$.L__unnamed_2, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp8:
	movq	%rbp, 16(%r15)
	movl	$.L__unnamed_3, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp9:
	movq	8(%rsp), %rax           # 8-byte Reload
	movq	%rax, 8(%rbx)
	movl	$.L__unnamed_4, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp10:
	movq	%r12, 16(%rbx)
	movl	$.L__unnamed_5, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp11:
	movq	%r13, 8(%rbp)
	movl	$.L__unnamed_6, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp12:
	movq	%r14, 16(%rbp)
	leaq	16(%rsp), %rbx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	eval_sum
.Ltmp13:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp14:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	eval_sum
.Ltmp15:
	movl	$34, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp16:
	xorl	%eax, %eax
	addq	$24, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	eval_sum                # -- Begin function eval_sum
	.p2align	4, 0x90
	.type	eval_sum,@function
eval_sum:                               # @eval_sum
	.cfi_startproc
# %bb.0:                                # %test
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
	movq	%rsi, %rbx
	movq	%rdi, 8(%rsp)
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp17:
	movl	%eax, %ecx
	xorl	%eax, %eax
	cmpl	$1, %ecx
	je	.LBB1_2
# %bb.1:                                # %else
	movl	$.L__unnamed_7, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp18:
	movl	(%rbx), %r14d
	movl	$.L__unnamed_8, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp19:
	movq	8(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
.Ltmp20:
	movl	%eax, %ebp
	addl	%r14d, %ebp
	movl	$.L__unnamed_9, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp21:
	movq	16(%rbx), %rsi
	movq	8(%rsp), %rdi
	callq	eval_sum
.Ltmp22:
	addl	%ebp, %eax
.LBB1_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
.Lfunc_end1:
	.size	eval_sum, .Lfunc_end1-eval_sum
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_7,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_7:
	.asciz	"test/binary_tree.tig::7.17: Nil pointer exception!"
	.size	.L__unnamed_7, 51

	.type	.L__unnamed_8,@object   # @1
	.p2align	4
.L__unnamed_8:
	.asciz	"test/binary_tree.tig::7.38: Nil pointer exception!"
	.size	.L__unnamed_8, 51

	.type	.L__unnamed_9,@object   # @2
	.p2align	4
.L__unnamed_9:
	.asciz	"test/binary_tree.tig::7.60: Nil pointer exception!"
	.size	.L__unnamed_9, 51

	.type	.L__unnamed_1,@object   # @3
	.p2align	4
.L__unnamed_1:
	.asciz	"test/binary_tree.tig::17.8: Nil pointer exception!"
	.size	.L__unnamed_1, 51

	.type	.L__unnamed_2,@object   # @4
	.p2align	4
.L__unnamed_2:
	.asciz	"test/binary_tree.tig::18.8: Nil pointer exception!"
	.size	.L__unnamed_2, 51

	.type	.L__unnamed_3,@object   # @5
	.p2align	4
.L__unnamed_3:
	.asciz	"test/binary_tree.tig::19.5: Nil pointer exception!"
	.size	.L__unnamed_3, 51

	.type	.L__unnamed_4,@object   # @6
	.p2align	4
.L__unnamed_4:
	.asciz	"test/binary_tree.tig::20.5: Nil pointer exception!"
	.size	.L__unnamed_4, 51

	.type	.L__unnamed_5,@object   # @7
	.p2align	4
.L__unnamed_5:
	.asciz	"test/binary_tree.tig::21.5: Nil pointer exception!"
	.size	.L__unnamed_5, 51

	.type	.L__unnamed_6,@object   # @8
	.p2align	4
.L__unnamed_6:
	.asciz	"test/binary_tree.tig::22.5: Nil pointer exception!"
	.size	.L__unnamed_6, 51


	.text
	.globl	"camlLlvm_byte_code/test/binary_tree__code_end"
"camlLlvm_byte_code/test/binary_tree__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/binary_tree__data_end"
"camlLlvm_byte_code/test/binary_tree__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/binary_tree__frametable"
"camlLlvm_byte_code/test/binary_tree__frametable":
	.short	23
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	72
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	72
	.short	0
	.p2align	3
                                        # live roots for eval_sum
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
	.quad	.Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	40
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
