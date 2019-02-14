	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/linked_list__code_begin"
"camlLlvm_byte_code/test/linked_list__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/linked_list__data_begin"
"camlLlvm_byte_code/test/linked_list__data_begin":
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
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %r15
	movl	$3, (%r15)
	movq	$0, 8(%r15)
	movl	$16, %edi
	callq	malloc
.Ltmp1:
	movq	%rax, %rbp
	movl	$2, (%rbp)
	movq	$0, 8(%rbp)
	movl	$16, %edi
	callq	malloc
.Ltmp2:
	movq	%rax, %rbx
	movl	$1, (%rbx)
	movq	%rbp, 8(%rbx)
	movl	$16, %edi
	callq	malloc
.Ltmp3:
	movq	%rax, %r14
	movl	$4, (%r14)
	movq	$0, 8(%r14)
	movl	$.L__unnamed_1, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp4:
	movq	%r15, 8(%rbp)
	movl	$.L__unnamed_2, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp5:
	movq	8(%rbx), %rbp
	movl	$.L__unnamed_3, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp6:
	movq	8(%rbp), %rbp
	movl	$.L__unnamed_4, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp7:
	movl	$5, (%rbp)
	movl	$.L__unnamed_5, %esi
	movq	%r15, %rdi
	callq	tig_check_null_pointer
.Ltmp8:
	movl	(%r15), %edi
	movl	$5, %esi
	callq	assert_equal_int
.Ltmp9:
	movl	$.L__unnamed_6, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp10:
	movq	8(%rbx), %rbp
	movl	$.L__unnamed_7, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp11:
	movq	8(%rbp), %rbp
	movl	$.L__unnamed_8, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp12:
	movl	$3, (%rbp)
	movl	$.L__unnamed_9, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp13:
	movq	8(%rbx), %rbp
	movl	$.L__unnamed_10, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp14:
	movq	8(%rbp), %rbp
	movl	$.L__unnamed_11, %esi
	movq	%rbp, %rdi
	callq	tig_check_null_pointer
.Ltmp15:
	movq	%r14, 8(%rbp)
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp16:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp17:
	movl	$1, %ebp
	jmp	.LBB0_1
	.p2align	4, 0x90
.LBB0_2:                                # %loop
                                        #   in Loop: Header=BB0_1 Depth=1
	movl	$.L__unnamed_12, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp19:
	movl	(%rbx), %edi
	callq	tig_print_int
.Ltmp20:
	movl	$.L__unnamed_13, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp21:
	movl	(%rbx), %edi
	movl	%ebp, %esi
	callq	assert_equal_int
.Ltmp22:
	movl	$.L__unnamed_14, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp23:
	movq	8(%rbx), %rbx
	incl	%ebp
.LBB0_1:                                # %test
                                        # =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp18:
	testl	%eax, %eax
	je	.LBB0_2
# %bb.3:                                # %end
	movl	$.L__unnamed_15, %edi
	callq	tig_print
.Ltmp24:
	movl	$5, %esi
	movl	%ebp, %edi
	callq	assert_equal_int
.Ltmp25:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_1:
	.asciz	"test/linked_list.tig::12.5: Nil pointer exception!"
	.size	.L__unnamed_1, 51

	.type	.L__unnamed_2,@object   # @1
	.p2align	4
.L__unnamed_2:
	.asciz	"test/linked_list.tig::13.5: Nil pointer exception!"
	.size	.L__unnamed_2, 51

	.type	.L__unnamed_3,@object   # @2
	.p2align	4
.L__unnamed_3:
	.asciz	"test/linked_list.tig::13.10: Nil pointer exception!"
	.size	.L__unnamed_3, 52

	.type	.L__unnamed_4,@object   # @3
	.p2align	4
.L__unnamed_4:
	.asciz	"test/linked_list.tig::13.15: Nil pointer exception!"
	.size	.L__unnamed_4, 52

	.type	.L__unnamed_5,@object   # @4
	.p2align	4
.L__unnamed_5:
	.asciz	"test/linked_list.tig::14.16: Nil pointer exception!"
	.size	.L__unnamed_5, 52

	.type	.L__unnamed_6,@object   # @5
	.p2align	4
.L__unnamed_6:
	.asciz	"test/linked_list.tig::16.5: Nil pointer exception!"
	.size	.L__unnamed_6, 51

	.type	.L__unnamed_7,@object   # @6
	.p2align	4
.L__unnamed_7:
	.asciz	"test/linked_list.tig::16.10: Nil pointer exception!"
	.size	.L__unnamed_7, 52

	.type	.L__unnamed_8,@object   # @7
	.p2align	4
.L__unnamed_8:
	.asciz	"test/linked_list.tig::16.15: Nil pointer exception!"
	.size	.L__unnamed_8, 52

	.type	.L__unnamed_9,@object   # @8
	.p2align	4
.L__unnamed_9:
	.asciz	"test/linked_list.tig::18.5: Nil pointer exception!"
	.size	.L__unnamed_9, 51

	.type	.L__unnamed_10,@object  # @9
	.p2align	4
.L__unnamed_10:
	.asciz	"test/linked_list.tig::18.10: Nil pointer exception!"
	.size	.L__unnamed_10, 52

	.type	.L__unnamed_11,@object  # @10
	.p2align	4
.L__unnamed_11:
	.asciz	"test/linked_list.tig::18.15: Nil pointer exception!"
	.size	.L__unnamed_11, 52

	.type	.L__unnamed_12,@object  # @11
	.p2align	4
.L__unnamed_12:
	.asciz	"test/linked_list.tig::24.33: Nil pointer exception!"
	.size	.L__unnamed_12, 52

	.type	.L__unnamed_13,@object  # @12
	.p2align	4
.L__unnamed_13:
	.asciz	"test/linked_list.tig::25.35: Nil pointer exception!"
	.size	.L__unnamed_13, 52

	.type	.L__unnamed_14,@object  # @13
	.p2align	4
.L__unnamed_14:
	.asciz	"test/linked_list.tig::26.40: Nil pointer exception!"
	.size	.L__unnamed_14, 52

	.type	.L__unnamed_15,@object  # @14
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_15:
	.asciz	"end program"
	.size	.L__unnamed_15, 12


	.text
	.globl	"camlLlvm_byte_code/test/linked_list__code_end"
"camlLlvm_byte_code/test/linked_list__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/linked_list__data_end"
"camlLlvm_byte_code/test/linked_list__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/linked_list__frametable"
"camlLlvm_byte_code/test/linked_list__frametable":
	.short	26
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
	.quad	.Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	.Ltmp25
	.short	40
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
