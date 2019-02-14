	.text
	.file	"Tiger jit"
	.globl	"camlLlvm_byte_code/test/mutual_recursion__code_begin"
"camlLlvm_byte_code/test/mutual_recursion__code_begin":
	.data
	.globl	"camlLlvm_byte_code/test/mutual_recursion__data_begin"
"camlLlvm_byte_code/test/mutual_recursion__data_begin":
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	callq	a
.Ltmp0:
	movl	%eax, %edi
	callq	tig_print_int
.Ltmp1:
	movq	%rbx, %rdi
	callq	a
.Ltmp2:
	movl	%eax, %ebp
	movq	%rbx, %rdi
	callq	b
.Ltmp3:
	movl	%ebp, %edi
	movl	%eax, %esi
	callq	assert_equal_int
.Ltmp4:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	a                       # -- Begin function a
	.p2align	4, 0x90
	.type	a,@function
a:                                      # @a
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	b
.Ltmp5:
	popq	%rcx
	retq
.Lfunc_end1:
	.size	a, .Lfunc_end1-a
	.cfi_endproc
                                        # -- End function
	.globl	b                       # -- Begin function b
	.p2align	4, 0x90
	.type	b,@function
b:                                      # @b
	.cfi_startproc
# %bb.0:                                # %entry
	movq	%rdi, -8(%rsp)
	movl	$4, %eax
	retq
.Lfunc_end2:
	.size	b, .Lfunc_end2-b
	.cfi_endproc
                                        # -- End function

	.globl	"camlLlvm_byte_code/test/mutual_recursion__code_end"
"camlLlvm_byte_code/test/mutual_recursion__code_end":
	.data
	.globl	"camlLlvm_byte_code/test/mutual_recursion__data_end"
"camlLlvm_byte_code/test/mutual_recursion__data_end":
	.quad	0
	.globl	"camlLlvm_byte_code/test/mutual_recursion__frametable"
"camlLlvm_byte_code/test/mutual_recursion__frametable":
	.short	6
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
                                        # live roots for a
	.quad	.Ltmp5
	.short	8
	.short	0
	.p2align	3
                                        # live roots for b
	.section	".note.GNU-stack","",@progbits
