	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/linked_list__code_begin"
"_camlLlvm_byte_code/test/linked_list__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/linked_list__data_begin"
"_camlLlvm_byte_code/test/linked_list__data_begin":
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movl	$16, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %r15
	movl	$3, (%rax)
	movq	$0, 8(%rax)
	movl	$16, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, %rbp
	movl	$2, (%rax)
	movq	$0, 8(%rax)
	movl	$16, %edi
	callq	_malloc
Ltmp2:
	movq	%rax, %rbx
	movl	$1, (%rax)
	movq	%rbp, 8(%rax)
	movl	$16, %edi
	callq	_malloc
Ltmp3:
	movq	%rax, %r14
	movl	$4, (%rax)
	movq	$0, 8(%rax)
	leaq	L___unnamed_1(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp4:
	movq	%r15, 8(%rbp)
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp5:
	movq	8(%rbx), %rbp
	leaq	L___unnamed_3(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp6:
	movq	8(%rbp), %rbp
	leaq	L___unnamed_4(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp7:
	movl	$5, (%rbp)
	leaq	L___unnamed_5(%rip), %rsi
	movq	%r15, %rdi
	callq	_tig_check_null_pointer
Ltmp8:
	movl	(%r15), %edi
	movl	$5, %esi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_6(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp10:
	movq	8(%rbx), %rbp
	leaq	L___unnamed_7(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp11:
	movq	8(%rbp), %rbp
	leaq	L___unnamed_8(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp12:
	movl	$3, (%rbp)
	leaq	L___unnamed_9(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp13:
	movq	8(%rbx), %rbp
	leaq	L___unnamed_10(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp14:
	movq	8(%rbp), %rbp
	leaq	L___unnamed_11(%rip), %rsi
	movq	%rbp, %rdi
	callq	_tig_check_null_pointer
Ltmp15:
	movq	%r14, 8(%rbp)
	movq	%rbx, %rdi
	callq	_tig_nillable
Ltmp16:
	movl	%eax, %edi
	callq	_tig_print_int
Ltmp17:
	movl	$1, %ebp
	leaq	L___unnamed_12(%rip), %r14
	leaq	L___unnamed_13(%rip), %r15
	leaq	L___unnamed_14(%rip), %r12
	jmp	LBB0_1
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ##   in Loop: Header=BB0_1 Depth=1
	movq	%rbx, %rdi
	movq	%r14, %rsi
	callq	_tig_check_null_pointer
Ltmp19:
	movl	(%rbx), %edi
	callq	_tig_print_int
Ltmp20:
	movq	%rbx, %rdi
	movq	%r15, %rsi
	callq	_tig_check_null_pointer
Ltmp21:
	movl	(%rbx), %edi
	movl	%ebp, %esi
	callq	_assert_equal_int
Ltmp22:
	movq	%rbx, %rdi
	movq	%r12, %rsi
	callq	_tig_check_null_pointer
Ltmp23:
	movq	8(%rbx), %rbx
	incl	%ebp
LBB0_1:                                 ## %test
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	_tig_nillable
Ltmp18:
	testl	%eax, %eax
	je	LBB0_2
## %bb.3:                               ## %end
	leaq	L___unnamed_15(%rip), %rdi
	callq	_tig_print
Ltmp24:
	movl	$5, %esi
	movl	%ebp, %edi
	callq	_assert_equal_int
Ltmp25:
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_1:
	.asciz	"test/linked_list.tig::12.5: Nil pointer exception!"

	.p2align	4               ## @1
L___unnamed_2:
	.asciz	"test/linked_list.tig::13.5: Nil pointer exception!"

	.p2align	4               ## @2
L___unnamed_3:
	.asciz	"test/linked_list.tig::13.10: Nil pointer exception!"

	.p2align	4               ## @3
L___unnamed_4:
	.asciz	"test/linked_list.tig::13.15: Nil pointer exception!"

	.p2align	4               ## @4
L___unnamed_5:
	.asciz	"test/linked_list.tig::14.16: Nil pointer exception!"

	.p2align	4               ## @5
L___unnamed_6:
	.asciz	"test/linked_list.tig::16.5: Nil pointer exception!"

	.p2align	4               ## @6
L___unnamed_7:
	.asciz	"test/linked_list.tig::16.10: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_8:
	.asciz	"test/linked_list.tig::16.15: Nil pointer exception!"

	.p2align	4               ## @8
L___unnamed_9:
	.asciz	"test/linked_list.tig::18.5: Nil pointer exception!"

	.p2align	4               ## @9
L___unnamed_10:
	.asciz	"test/linked_list.tig::18.10: Nil pointer exception!"

	.p2align	4               ## @10
L___unnamed_11:
	.asciz	"test/linked_list.tig::18.15: Nil pointer exception!"

	.p2align	4               ## @11
L___unnamed_12:
	.asciz	"test/linked_list.tig::24.33: Nil pointer exception!"

	.p2align	4               ## @12
L___unnamed_13:
	.asciz	"test/linked_list.tig::25.35: Nil pointer exception!"

	.p2align	4               ## @13
L___unnamed_14:
	.asciz	"test/linked_list.tig::26.40: Nil pointer exception!"

L___unnamed_15:                         ## @14
	.asciz	"end program"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/linked_list__code_end"
"_camlLlvm_byte_code/test/linked_list__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/linked_list__data_end"
"_camlLlvm_byte_code/test/linked_list__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/linked_list__frametable"
"_camlLlvm_byte_code/test/linked_list__frametable":
	.short	26
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
.subsections_via_symbols
