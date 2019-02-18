	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/record__code_begin"
"_camlLlvm_byte_code/test/record__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/record__data_begin"
"_camlLlvm_byte_code/test/record__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	pushq	%rax
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$16, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %r14
	leaq	L___unnamed_1(%rip), %r15
	movq	%r15, (%rax)
	movl	$10, 8(%rax)
	movl	$16, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, %rbx
	leaq	L___unnamed_2(%rip), %r12
	movq	%r12, (%rax)
	movq	%r14, 8(%rax)
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rax, %rdi
	callq	_tig_check_null_pointer
Ltmp2:
	movq	(%rbx), %rdi
	callq	_tig_print
Ltmp3:
	leaq	L___unnamed_4(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp4:
	movq	(%rbx), %rdi
	movq	%r12, %rsi
	callq	_assert_equal_string
Ltmp5:
	leaq	L___unnamed_5(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp6:
	movq	8(%rbx), %r12
	leaq	L___unnamed_6(%rip), %rsi
	movq	%r12, %rdi
	callq	_tig_check_null_pointer
Ltmp7:
	movl	8(%r12), %edi
	callq	_tig_print_int
Ltmp8:
	leaq	L___unnamed_7(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp9:
	movq	8(%rbx), %r12
	leaq	L___unnamed_8(%rip), %rsi
	movq	%r12, %rdi
	callq	_tig_check_null_pointer
Ltmp10:
	movl	8(%r12), %edi
	movl	$10, %esi
	callq	_assert_equal_int
Ltmp11:
	leaq	L___unnamed_9(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp12:
	movq	8(%rbx), %r12
	leaq	L___unnamed_10(%rip), %rsi
	movq	%r12, %rdi
	callq	_tig_check_null_pointer
Ltmp13:
	movl	$100, 8(%r12)
	leaq	L___unnamed_11(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp14:
	movl	8(%r14), %edi
	movl	$100, %esi
	callq	_assert_equal_int
Ltmp15:
	leaq	L___unnamed_12(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp16:
	movq	8(%rbx), %r12
	leaq	L___unnamed_13(%rip), %rsi
	movq	%r12, %rdi
	callq	_tig_check_null_pointer
Ltmp17:
	movq	(%r12), %rdi
	callq	_tig_print
Ltmp18:
	leaq	L___unnamed_14(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp19:
	movq	8(%rbx), %r12
	leaq	L___unnamed_15(%rip), %rsi
	movq	%r12, %rdi
	callq	_tig_check_null_pointer
Ltmp20:
	movq	(%r12), %rdi
	movq	%r15, %rsi
	callq	_assert_equal_string
Ltmp21:
	leaq	L___unnamed_16(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp22:
	leaq	L___unnamed_17(%rip), %r15
	movq	%r15, (%r14)
	leaq	L___unnamed_18(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp23:
	movq	8(%rbx), %r14
	leaq	L___unnamed_19(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp24:
	movq	(%r14), %rdi
	callq	_tig_print
Ltmp25:
	leaq	L___unnamed_20(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp26:
	movq	8(%rbx), %rbx
	leaq	L___unnamed_21(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp27:
	movq	(%rbx), %rdi
	movq	%r15, %rsi
	callq	_assert_equal_string
Ltmp28:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_3:
	.asciz	"test/record.tig::18.14: Nil pointer exception!"

	.p2align	4               ## @1
L___unnamed_4:
	.asciz	"test/record.tig::19.22: Nil pointer exception!"

L___unnamed_2:                          ## @2
	.asciz	"world"

	.p2align	4               ## @3
L___unnamed_5:
	.asciz	"test/record.tig::21.17: Nil pointer exception!"

	.p2align	4               ## @4
L___unnamed_6:
	.asciz	"test/record.tig::21.23: Nil pointer exception!"

	.p2align	4               ## @5
L___unnamed_7:
	.asciz	"test/record.tig::22.19: Nil pointer exception!"

	.p2align	4               ## @6
L___unnamed_8:
	.asciz	"test/record.tig::22.25: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_9:
	.asciz	"test/record.tig::24.8: Nil pointer exception!"

	.p2align	4               ## @8
L___unnamed_10:
	.asciz	"test/record.tig::24.14: Nil pointer exception!"

	.p2align	4               ## @9
L___unnamed_11:
	.asciz	"test/record.tig::25.17: Nil pointer exception!"

	.p2align	4               ## @10
L___unnamed_12:
	.asciz	"test/record.tig::27.14: Nil pointer exception!"

	.p2align	4               ## @11
L___unnamed_13:
	.asciz	"test/record.tig::27.20: Nil pointer exception!"

	.p2align	4               ## @12
L___unnamed_14:
	.asciz	"test/record.tig::28.22: Nil pointer exception!"

	.p2align	4               ## @13
L___unnamed_15:
	.asciz	"test/record.tig::28.28: Nil pointer exception!"

L___unnamed_1:                          ## @14
	.asciz	"hello"

	.p2align	4               ## @15
L___unnamed_16:
	.asciz	"test/record.tig::30.6: Nil pointer exception!"

	.p2align	4               ## @16
L___unnamed_18:
	.asciz	"test/record.tig::31.14: Nil pointer exception!"

	.p2align	4               ## @17
L___unnamed_19:
	.asciz	"test/record.tig::31.20: Nil pointer exception!"

	.p2align	4               ## @18
L___unnamed_20:
	.asciz	"test/record.tig::32.22: Nil pointer exception!"

	.p2align	4               ## @19
L___unnamed_21:
	.asciz	"test/record.tig::32.28: Nil pointer exception!"

L___unnamed_17:                         ## @20
	.asciz	"lol"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/record__code_end"
"_camlLlvm_byte_code/test/record__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/record__data_end"
"_camlLlvm_byte_code/test/record__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/record__frametable"
"_camlLlvm_byte_code/test/record__frametable":
	.short	29
	.p2align	3
                                        ## live roots for main
	.quad	Ltmp0
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp1
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp2
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp3
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp4
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp5
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp6
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp7
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp8
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp9
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp10
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp11
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp12
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp13
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp14
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp15
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp16
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp17
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp18
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp19
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp20
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp21
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp23
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp25
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp26
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp27
	.short	40
	.short	0
	.p2align	3
	.quad	Ltmp28
	.short	40
	.short	0
	.p2align	3
.subsections_via_symbols
