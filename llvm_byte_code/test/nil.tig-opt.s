	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/nil__code_begin"
"camlLlvm_byte_code/test/nil__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/nil__data_begin"
"camlLlvm_byte_code/test/nil__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$8, %edi
	callq	malloc
.Ltmp0:
	movq	%rax, %rbx
	movq	$.L__unnamed_1, (%rbx)
	movl	$.L__unnamed_2, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp1:
	movq	(%rbx), %rdi
	callq	tig_print
.Ltmp2:
	movl	$.L__unnamed_3, %esi
	movq	%rbx, %rdi
	callq	tig_check_null_pointer
.Ltmp3:
	movq	(%rbx), %rdi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
.Ltmp4:
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp5:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp6:
	movq	%rbx, %rdi
	callq	tig_nillable
.Ltmp7:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp8:
	xorl	%edi, %edi
	callq	tig_nillable
.Ltmp9:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp10:
	xorl	%edi, %edi
	callq	tig_nillable
.Ltmp11:
	movl	$1, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp12:
	xorl	%eax, %eax
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_2,@object   # @0
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_2:
	.asciz	"test/nil.tig::6.8: Nil pointer exception!"
	.size	.L__unnamed_2, 42

	.type	.L__unnamed_3,@object   # @1
	.p2align	4
.L__unnamed_3:
	.asciz	"test/nil.tig::7.16: Nil pointer exception!"
	.size	.L__unnamed_3, 43

	.type	.L__unnamed_1,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"hello world"
	.size	.L__unnamed_1, 12


	.text
	.globl	"camlLlvm_byte_code/test/nil__code_end"
"camlLlvm_byte_code/test/nil__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/nil__data_end"
"camlLlvm_byte_code/test/nil__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/nil__frametable"
"camlLlvm_byte_code/test/nil__frametable":
	.short	13
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp1
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp2
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp3
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp4
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp5
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp6
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp7
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp8
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp9
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp10
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp11
	.short	8
	.short	0
	.p2align	3
	.quad	.Ltmp12
	.short	8
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
