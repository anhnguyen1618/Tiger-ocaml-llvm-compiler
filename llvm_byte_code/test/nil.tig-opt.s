	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/nil__code_begin"
"_camlLlvm_byte_code/test/nil__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/nil__data_begin"
"_camlLlvm_byte_code/test/nil__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	movl	$8, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %rbx
	leaq	L___unnamed_1(%rip), %r14
	movq	%r14, (%rax)
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rax, %rdi
	callq	_tig_check_null_pointer
Ltmp1:
	movq	(%rbx), %rdi
	callq	_tig_print
Ltmp2:
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp3:
	movq	(%rbx), %rdi
	movq	%r14, %rsi
	callq	_assert_equal_string
Ltmp4:
	movq	%rbx, %rdi
	callq	_tig_nillable
Ltmp5:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp6:
	movq	%rbx, %rdi
	callq	_tig_nillable
Ltmp7:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp8:
	xorl	%edi, %edi
	callq	_tig_nillable
Ltmp9:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp10:
	xorl	%edi, %edi
	callq	_tig_nillable
Ltmp11:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp12:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_2:
	.asciz	"test/nil.tig::6.8: Nil pointer exception!"

	.p2align	4               ## @1
L___unnamed_3:
	.asciz	"test/nil.tig::7.16: Nil pointer exception!"

L___unnamed_1:                          ## @2
	.asciz	"hello world"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/nil__code_end"
"_camlLlvm_byte_code/test/nil__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/nil__data_end"
"_camlLlvm_byte_code/test/nil__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/nil__frametable"
"_camlLlvm_byte_code/test/nil__frametable":
	.short	13
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
	.quad	Ltmp5
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
