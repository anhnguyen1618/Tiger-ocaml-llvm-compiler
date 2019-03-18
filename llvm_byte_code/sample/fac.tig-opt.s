	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/fac__code_begin"
"camlLlvm_byte_code/test/fac__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/fac__data_begin"
"camlLlvm_byte_code/test/fac__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rsp, %rdi
	movl	$4, %esi
	callq	factorial
.Ltmp0:
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	factorial               # -- Begin function factorial
	.p2align	4, 0x90
	.type	factorial,@function
factorial:                              # @factorial
	.cfi_startproc
# %bb.0:                                # %test
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	%esi, %ebx
	movq	%rdi, 8(%rsp)
	cmpl	$1, %ebx
	movl	$1, %eax
	je	.LBB1_2
# %bb.1:                                # %else
	leal	-1(%rbx), %esi
	movq	8(%rsp), %rdi
	callq	factorial
.Ltmp1:
	imull	%eax, %ebx
	movl	%ebx, %eax
.LBB1_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end1:
	.size	factorial, .Lfunc_end1-factorial
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/fac__code_end"
"camlLlvm_byte_code/test/fac__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/fac__data_end"
"camlLlvm_byte_code/test/fac__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/fac__frametable"
"camlLlvm_byte_code/test/fac__frametable":
	.short	2
	.p2align	3
                                        # live roots for main
	.quad	.Ltmp0
	.short	8
	.short	0
	.p2align	3
                                        # live roots for factorial
	.quad	.Ltmp1
	.short	24
	.short	0
	.p2align	3
	.section	".note.GNU-stack","",@progbits
