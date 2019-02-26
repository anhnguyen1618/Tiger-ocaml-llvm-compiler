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
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$20, %edi
	callq	_tig_print_int
Ltmp0:
	movl	$20, %edi
	movl	$20, %esi
	callq	_assert_equal_int
Ltmp1:
	xorl	%eax, %eax
	popq	%rcx
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
## %bb.0:                               ## %entry
                                        ## kill: def $esi killed $esi def $rsi
	leal	10(%rsi), %eax
	retq
                                        ## -- End function

	.globl	"_camlLlvm_byte_code/test/mutable__code_end"
"_camlLlvm_byte_code/test/mutable__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/mutable__data_end"
"_camlLlvm_byte_code/test/mutable__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/mutable__frametable"
"_camlLlvm_byte_code/test/mutable__frametable":
	.short	2
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	8
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	8
	.short	0
	.p2align	3
                                        ## live roots for f
.subsections_via_symbols
