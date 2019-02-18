	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/mutual_recursion__code_begin"
"_camlLlvm_byte_code/test/mutual_recursion__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/mutual_recursion__data_begin"
"_camlLlvm_byte_code/test/mutual_recursion__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
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
	callq	_a
Ltmp0:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp1:
	movq	%rbx, %rdi
	callq	_a
Ltmp2:
	movl	%eax, %ebp
	movq	%rbx, %rdi
	callq	_b
Ltmp3:
	movl	%ebp, %edi
	movl	%eax, %esi
	callq	_assert_equal_int
Ltmp4:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_a                      ## -- Begin function a
	.p2align	4, 0x90
_a:                                     ## @a
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	_b
Ltmp5:
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_b                      ## -- Begin function b
	.p2align	4, 0x90
_b:                                     ## @b
	.cfi_startproc
## %bb.0:                               ## %entry
	movq	%rdi, -8(%rsp)
	movl	$4, %eax
	retq
	.cfi_endproc
                                        ## -- End function

	.globl	"_camlLlvm_byte_code/test/mutual_recursion__code_end"
"_camlLlvm_byte_code/test/mutual_recursion__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/mutual_recursion__data_end"
"_camlLlvm_byte_code/test/mutual_recursion__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/mutual_recursion__frametable"
"_camlLlvm_byte_code/test/mutual_recursion__frametable":
	.short	6
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	24
	.short	0
	.p2align	3
                                        ## live roots for a
	.quad	Ltmp5
	.short	8
	.short	0
	.p2align	3
                                        ## live roots for b
.subsections_via_symbols
