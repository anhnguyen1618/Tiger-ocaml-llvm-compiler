	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/mutable__code_begin"
"camlLlvm_byte_code/test/mutable__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/mutable__data_begin"
"camlLlvm_byte_code/test/mutable__data_begin":
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
	leaq	8(%rsp), %rbx
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	f
.Ltmp0:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp1:
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	f
.Ltmp2:
	movl	$20, %esi
	movl	%eax, %edi
	callq	assert_equal_int
.Ltmp3:
	xorl	%eax, %eax
	addq	$16, %rsp
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
                                        # kill: def %esi killed %esi def %rsi
	movq	%rdi, -8(%rsp)
	leal	10(%rsi), %eax
	retq
.Lfunc_end1:
	.size	f, .Lfunc_end1-f
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/mutable__code_end"
"camlLlvm_byte_code/test/mutable__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/mutable__data_end"
"camlLlvm_byte_code/test/mutable__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/mutable__frametable"
"camlLlvm_byte_code/test/mutable__frametable":
	.short	4
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
                                        # live roots for f
	.section	".note.GNU-stack","",@progbits
