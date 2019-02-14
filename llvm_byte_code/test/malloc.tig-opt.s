	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/malloc__code_begin"
"camlLlvm_byte_code/test/malloc__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/malloc__data_begin"
"camlLlvm_byte_code/test/malloc__data_begin":
	.text
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
.Ltmp0:
	movq	%rax, %rbx
	movl	$5, (%rbx)
	movl	$16, %edi
	callq	malloc
.Ltmp1:
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
.Ltmp2:
	movl	$2, (%rax)
	movq	%r14, 8(%rax)
	movq	%rax, 16(%rsp)
	leaq	8(%rsp), %rdi
	callq	create_rec
.Ltmp3:
	movq	%rax, %r14
	movq	16(%rsp), %rbx
	xorl	%esi, %esi
	movl	$.L__unnamed_1, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp4:
	movq	8(%rbx), %rax
	movq	(%rax), %rbx
	movl	$.L__unnamed_2, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp5:
	movl	(%rbx), %edi
	callq	tig_print_int
.Ltmp6:
	movq	16(%rsp), %rbx
	xorl	%esi, %esi
	movl	$.L__unnamed_3, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp7:
	movq	8(%rbx), %rax
	movq	(%rax), %rbx
	movl	$.L__unnamed_4, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp8:
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	assert_equal_int
.Ltmp9:
	movl	$1, %esi
	movl	$.L__unnamed_5, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
.Ltmp10:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_6, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp11:
	movl	(%rbx), %edi
	callq	tig_print_int
.Ltmp12:
	movl	$1, %esi
	movl	$.L__unnamed_7, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
.Ltmp13:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_8, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp14:
	movl	(%rbx), %edi
	movl	$6, %esi
	callq	assert_equal_int
.Ltmp15:
	movq	16(%rsp), %rbx
	movl	$1, %esi
	movl	$.L__unnamed_9, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp16:
	movq	8(%rbx), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_10, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp17:
	movl	$5, (%rbx)
	movl	$1, %esi
	movl	$.L__unnamed_11, %edx
	movq	%r14, %rdi
	callq	tig_check_array_bound
.Ltmp18:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	movl	$.L__unnamed_12, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp19:
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	assert_equal_int
.Ltmp20:
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
.Ltmp21:
	movq	%rax, %r14
	movl	$6, (%r14)
	movq	(%rsp), %rax
	movq	8(%rax), %rbx
	movl	$1, %esi
	movl	$.L__unnamed_13, %edx
	movq	%rbx, %rdi
	callq	tig_check_array_bound
.Ltmp22:
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
	.type	.L__unnamed_13,@object  # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_13:
	.asciz	"test/malloc.tig::11.6: Array out of bound"
	.size	.L__unnamed_13, 42

	.type	.L__unnamed_1,@object   # @1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/malloc.tig::17.14: Array out of bound"
	.size	.L__unnamed_1, 43

	.type	.L__unnamed_2,@object   # @2
	.p2align	4
.L__unnamed_2:
	.asciz	"test/malloc.tig::17.17: Nil pointer exception!"
	.size	.L__unnamed_2, 47

	.type	.L__unnamed_3,@object   # @3
	.p2align	4
.L__unnamed_3:
	.asciz	"test/malloc.tig::18.15: Array out of bound"
	.size	.L__unnamed_3, 43

	.type	.L__unnamed_4,@object   # @4
	.p2align	4
.L__unnamed_4:
	.asciz	"test/malloc.tig::18.18: Nil pointer exception!"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_5,@object   # @5
	.p2align	4
.L__unnamed_5:
	.asciz	"test/malloc.tig::20.12: Array out of bound"
	.size	.L__unnamed_5, 43

	.type	.L__unnamed_6,@object   # @6
	.p2align	4
.L__unnamed_6:
	.asciz	"test/malloc.tig::20.15: Nil pointer exception!"
	.size	.L__unnamed_6, 47

	.type	.L__unnamed_7,@object   # @7
	.p2align	4
.L__unnamed_7:
	.asciz	"test/malloc.tig::21.13: Array out of bound"
	.size	.L__unnamed_7, 43

	.type	.L__unnamed_8,@object   # @8
	.p2align	4
.L__unnamed_8:
	.asciz	"test/malloc.tig::21.16: Nil pointer exception!"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @9
	.p2align	4
.L__unnamed_9:
	.asciz	"test/malloc.tig::23.4: Array out of bound"
	.size	.L__unnamed_9, 42

	.type	.L__unnamed_10,@object  # @10
	.p2align	4
.L__unnamed_10:
	.asciz	"test/malloc.tig::23.7: Nil pointer exception!"
	.size	.L__unnamed_10, 46

	.type	.L__unnamed_11,@object  # @11
	.p2align	4
.L__unnamed_11:
	.asciz	"test/malloc.tig::24.13: Array out of bound"
	.size	.L__unnamed_11, 43

	.type	.L__unnamed_12,@object  # @12
	.p2align	4
.L__unnamed_12:
	.asciz	"test/malloc.tig::24.16: Nil pointer exception!"
	.size	.L__unnamed_12, 47


	.text
	.globl	"camlLlvm_byte_code/test/malloc__code_end"
"camlLlvm_byte_code/test/malloc__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/malloc__data_end"
"camlLlvm_byte_code/test/malloc__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/malloc__frametable"
"camlLlvm_byte_code/test/malloc__frametable":
	.short	23
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
	.quad	.Ltmp12
	.short	40
	.short	0
	.p2align	3
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
	.quad	.Ltmp20
	.short	40
	.short	0
	.p2align	3
                                        # live roots for create_rec
	.quad	.Ltmp21
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
