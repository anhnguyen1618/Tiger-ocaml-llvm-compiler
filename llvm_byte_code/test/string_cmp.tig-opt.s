	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/string_cmp__code_begin"
"camlLlvm_byte_code/test/string_cmp__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/string_cmp__data_begin"
"camlLlvm_byte_code/test/string_cmp__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_1, %esi
	callq	assert_equal_string
.Ltmp0:
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	callq	tig_concat
.Ltmp1:
	movl	$.L__unnamed_3, %esi
	movq	%rax, %rdi
	callq	assert_equal_string
.Ltmp2:
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"test string"
	.size	.L__unnamed_1, 12

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"-hello world"
	.size	.L__unnamed_2, 13

	.type	.L__unnamed_3,@object   # @2
	.section	.rodata.str1.16,"aMS",@progbits,1
	.p2align	4
.L__unnamed_3:
	.asciz	"test string-hello world"
	.size	.L__unnamed_3, 24


	.text
	.globl	"camlLlvm_byte_code/test/string_cmp__code_end"
"camlLlvm_byte_code/test/string_cmp__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/string_cmp__data_end"
"camlLlvm_byte_code/test/string_cmp__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/string_cmp__frametable"
"camlLlvm_byte_code/test/string_cmp__frametable":
	.short	3
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
	.section	".note.GNU-stack","",@progbits
