	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/record_nil_esc__code_begin"
"_camlLlvm_byte_code/test/record_nil_esc__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/record_nil_esc__data_begin"
"_camlLlvm_byte_code/test/record_nil_esc__data_begin":
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
	movq	$0, 8(%rsp)
	xorl	%edi, %edi
	callq	_tig_nillable
Ltmp0:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp1:
	movq	%rsp, %rdi
	callq	_f
Ltmp2:
	movq	8(%rsp), %rbx
	leaq	L___unnamed_1(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp3:
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	_assert_equal_int
Ltmp4:
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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rdi, 8(%rsp)
	movl	$16, %edi
	callq	_malloc
Ltmp5:
	movl	$5, (%rax)
	movq	$0, 8(%rax)
	movq	%rax, 8(%rbx)
	addq	$16, %rsp
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_1:
	.asciz	"test/record_nil_esc.tig::8.19: Nil pointer exception!"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/record_nil_esc__code_end"
"_camlLlvm_byte_code/test/record_nil_esc__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/record_nil_esc__data_end"
"_camlLlvm_byte_code/test/record_nil_esc__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/record_nil_esc__frametable"
"_camlLlvm_byte_code/test/record_nil_esc__frametable":
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
                                        ## live roots for f
	.quad	Ltmp5
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
