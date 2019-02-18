	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/mutable__code_begin"
"_camlLlvm_byte_code/test/mutable__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/mutable__data_begin"
"_camlLlvm_byte_code/test/mutable__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	_f
Ltmp0:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp1:
	movl	$10, %esi
	movq	%rbx, %rdi
	callq	_f
Ltmp2:
	movl	$20, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp3:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
	.cfi_startproc
## %bb.0:                               ## %entry
                                        ## kill: def $esi killed $esi def $rsi
	movq	%rdi, -8(%rsp)
	leal	10(%rsi), %eax
	retq
	.cfi_endproc
                                        ## -- End function

	.globl	"_camlLlvm_byte_code/test/mutable__code_end"
"_camlLlvm_byte_code/test/mutable__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/mutable__data_end"
"_camlLlvm_byte_code/test/mutable__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/mutable__frametable"
"_camlLlvm_byte_code/test/mutable__frametable":
	.short	4
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
                                        ## live roots for f
.subsections_via_symbols
