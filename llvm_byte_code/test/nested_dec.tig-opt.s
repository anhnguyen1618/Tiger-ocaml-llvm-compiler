	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/nested_dec__code_begin"
"camlLlvm_byte_code/test/nested_dec__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/nested_dec__data_begin"
"camlLlvm_byte_code/test/nested_dec__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %merge
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$-8, %edi
	callq	tig_print_int
.Ltmp0:
	movl	$-8, %edi
	movl	$-8, %esi
	callq	assert_equal_int
.Ltmp1:
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/nested_dec__code_end"
"camlLlvm_byte_code/test/nested_dec__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/nested_dec__data_end"
"camlLlvm_byte_code/test/nested_dec__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/nested_dec__frametable"
"camlLlvm_byte_code/test/nested_dec__frametable":
	.short	2
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
	.section	".note.GNU-stack","",@progbits
