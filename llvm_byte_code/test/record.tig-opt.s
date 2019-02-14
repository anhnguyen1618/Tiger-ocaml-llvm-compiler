	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/record__code_begin"
"camlLlvm_byte_code/test/record__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/record__data_begin"
"camlLlvm_byte_code/test/record__data_begin":
	.text
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$16, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %r14
	movq	$.L__unnamed_1, (%r14)
	movl	$10, 8(%r14)
	movl	$16, %edi
	callq	malloc
.Ltmp1:
	movq	%rax, %rbx
	movq	$.L__unnamed_2, (%rbx)
	movq	%r14, 8(%rbx)
	movl	$.L__unnamed_3, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp2:
	movq	(%rbx), %rdi
	callq	tig_print
.Ltmp3:
	movl	$.L__unnamed_4, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp4:
	movq	(%rbx), %rdi
	movl	$.L__unnamed_2, %esi
	callq	assert_equal_string
.Ltmp5:
	movl	$.L__unnamed_5, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp6:
	movq	8(%rbx), %r15
	movl	$.L__unnamed_6, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp7:
	movl	8(%r15), %edi
	callq	tig_print_int
.Ltmp8:
	movl	$.L__unnamed_7, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp9:
	movq	8(%rbx), %r15
	movl	$.L__unnamed_8, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp10:
	movl	8(%r15), %edi
	movl	$10, %esi
	callq	assert_equal_int
.Ltmp11:
	movl	$.L__unnamed_9, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp12:
	movq	8(%rbx), %r15
	movl	$.L__unnamed_10, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp13:
	movl	$100, 8(%r15)
	movl	$.L__unnamed_11, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
.Ltmp14:
	movl	8(%r14), %edi
	movl	$100, %esi
	callq	assert_equal_int
.Ltmp15:
	movl	$.L__unnamed_12, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp16:
	movq	8(%rbx), %r15
	movl	$.L__unnamed_13, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp17:
	movq	(%r15), %rdi
	callq	tig_print
.Ltmp18:
	movl	$.L__unnamed_14, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp19:
	movq	8(%rbx), %r15
	movl	$.L__unnamed_15, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp20:
	movq	(%r15), %rdi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
.Ltmp21:
	movl	$.L__unnamed_16, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
.Ltmp22:
	movq	$.L__unnamed_17, (%r14)
	movl	$.L__unnamed_18, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp23:
	movq	8(%rbx), %r14
	movl	$.L__unnamed_19, %esi
	movq	%r14, %rdi
	callq	tig_check_null_pointer
.Ltmp24:
	movq	(%r14), %rdi
	callq	tig_print
.Ltmp25:
	movl	$.L__unnamed_20, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp26:
	movq	8(%rbx), %rbx
	movl	$.L__unnamed_21, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp27:
	movq	(%rbx), %rdi
	movl	$.L__unnamed_17, %esi
	callq	assert_equal_string
.Ltmp28:
	xorl	%eax, %eax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_3,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"test/record.tig::18.14: Nil pointer exception!"
	.size	.L__unnamed_3, 47

	.type	.L__unnamed_4,@object   # @1
	.p2align	4
.L__unnamed_4:
	.asciz	"test/record.tig::19.22: Nil pointer exception!"
	.size	.L__unnamed_4, 47

	.type	.L__unnamed_2,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"world"
	.size	.L__unnamed_2, 6

	.type	.L__unnamed_5,@object   # @3
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_5:
	.asciz	"test/record.tig::21.17: Nil pointer exception!"
	.size	.L__unnamed_5, 47

	.type	.L__unnamed_6,@object   # @4
	.p2align	4
.L__unnamed_6:
	.asciz	"test/record.tig::21.23: Nil pointer exception!"
	.size	.L__unnamed_6, 47

	.type	.L__unnamed_7,@object   # @5
	.p2align	4
.L__unnamed_7:
	.asciz	"test/record.tig::22.19: Nil pointer exception!"
	.size	.L__unnamed_7, 47

	.type	.L__unnamed_8,@object   # @6
	.p2align	4
.L__unnamed_8:
	.asciz	"test/record.tig::22.25: Nil pointer exception!"
	.size	.L__unnamed_8, 47

	.type	.L__unnamed_9,@object   # @7
	.p2align	4
.L__unnamed_9:
	.asciz	"test/record.tig::24.8: Nil pointer exception!"
	.size	.L__unnamed_9, 46

	.type	.L__unnamed_10,@object  # @8
	.p2align	4
.L__unnamed_10:
	.asciz	"test/record.tig::24.14: Nil pointer exception!"
	.size	.L__unnamed_10, 47

	.type	.L__unnamed_11,@object  # @9
	.p2align	4
.L__unnamed_11:
	.asciz	"test/record.tig::25.17: Nil pointer exception!"
	.size	.L__unnamed_11, 47

	.type	.L__unnamed_12,@object  # @10
	.p2align	4
.L__unnamed_12:
	.asciz	"test/record.tig::27.14: Nil pointer exception!"
	.size	.L__unnamed_12, 47

	.type	.L__unnamed_13,@object  # @11
	.p2align	4
.L__unnamed_13:
	.asciz	"test/record.tig::27.20: Nil pointer exception!"
	.size	.L__unnamed_13, 47

	.type	.L__unnamed_14,@object  # @12
	.p2align	4
.L__unnamed_14:
	.asciz	"test/record.tig::28.22: Nil pointer exception!"
	.size	.L__unnamed_14, 47

	.type	.L__unnamed_15,@object  # @13
	.p2align	4
.L__unnamed_15:
	.asciz	"test/record.tig::28.28: Nil pointer exception!"
	.size	.L__unnamed_15, 47

	.type	.L__unnamed_1,@object   # @14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello"
	.size	.L__unnamed_1, 6

	.type	.L__unnamed_16,@object  # @15
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_16:
	.asciz	"test/record.tig::30.6: Nil pointer exception!"
	.size	.L__unnamed_16, 46

	.type	.L__unnamed_18,@object  # @16
	.p2align	4
.L__unnamed_18:
	.asciz	"test/record.tig::31.14: Nil pointer exception!"
	.size	.L__unnamed_18, 47

	.type	.L__unnamed_19,@object  # @17
	.p2align	4
.L__unnamed_19:
	.asciz	"test/record.tig::31.20: Nil pointer exception!"
	.size	.L__unnamed_19, 47

	.type	.L__unnamed_20,@object  # @18
	.p2align	4
.L__unnamed_20:
	.asciz	"test/record.tig::32.22: Nil pointer exception!"
	.size	.L__unnamed_20, 47

	.type	.L__unnamed_21,@object  # @19
	.p2align	4
.L__unnamed_21:
	.asciz	"test/record.tig::32.28: Nil pointer exception!"
	.size	.L__unnamed_21, 47

	.type	.L__unnamed_17,@object  # @20
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_17:
	.asciz	"lol"
	.size	.L__unnamed_17, 4


	.text
	.globl	"camlLlvm_byte_code/test/record__code_end"
"camlLlvm_byte_code/test/record__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/record__data_end"
"camlLlvm_byte_code/test/record__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/record__frametable"
"camlLlvm_byte_code/test/record__frametable":
	.short	29
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
	.quad	.Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp13
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp14
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp15
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp16
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp17
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp18
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp19
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp20
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp21
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp23
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp24
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp25
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp26
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp27
	.short	24
	.short	0
	.p2align	3
	.quad	.Ltmp28
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
