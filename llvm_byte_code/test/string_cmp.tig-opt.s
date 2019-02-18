	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/string_cmp__code_begin"
"_camlLlvm_byte_code/test/string_cmp__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/string_cmp__data_begin"
"_camlLlvm_byte_code/test/string_cmp__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	leaq	L___unnamed_1(%rip), %rbx
	movq	%rbx, %rdi
	movq	%rbx, %rsi
	callq	_assert_equal_string
Ltmp0:
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_concat
Ltmp1:
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rax, %rdi
	callq	_assert_equal_string
Ltmp2:
	xorl	%eax, %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:                          ## @0
	.asciz	"test string"

L___unnamed_2:                          ## @1
	.asciz	"-hello world"

	.p2align	4               ## @2
L___unnamed_3:
	.asciz	"test string-hello world"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/string_cmp__code_end"
"_camlLlvm_byte_code/test/string_cmp__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/string_cmp__data_end"
"_camlLlvm_byte_code/test/string_cmp__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/string_cmp__frametable"
"_camlLlvm_byte_code/test/string_cmp__frametable":
	.short	3
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
	.quad	Ltmp2
	.short	8
	.short	0
	.p2align	3
.subsections_via_symbols
