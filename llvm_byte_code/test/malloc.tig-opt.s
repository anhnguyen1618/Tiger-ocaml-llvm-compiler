	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/malloc__code_begin"
"_camlLlvm_byte_code/test/malloc__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/malloc__data_begin"
"_camlLlvm_byte_code/test/malloc__data_begin":
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
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$4, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %rbx
	movl	$5, (%rax)
	movl	$16, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, %r14
	xorl	%eax, %eax
	cmpl	$1, %eax
	ja	LBB0_3
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	%rbx, (%r14,%rax,8)
	incq	%rax
	cmpl	$1, %eax
	jbe	LBB0_2
LBB0_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp2:
	movq	%rax, %r15
	movl	$2, (%rax)
	movq	%r14, 8(%rax)
	movq	%rax, 8(%rsp)
	movq	%rsp, %rdi
	callq	_create_rec
Ltmp3:
	movq	%rax, %r14
	leaq	L___unnamed_1(%rip), %rdx
	xorl	%esi, %esi
	movq	%r15, %rdi
	callq	_tig_check_array_bound
Ltmp4:
	movq	8(%r15), %rax
	movq	(%rax), %rbx
	leaq	L___unnamed_2(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp5:
	movl	(%rbx), %edi
	callq	_tig_print_int
Ltmp6:
	leaq	L___unnamed_3(%rip), %rdx
	xorl	%esi, %esi
	movq	%r15, %rdi
	callq	_tig_check_array_bound
Ltmp7:
	movq	8(%r15), %rax
	movq	(%rax), %rbx
	leaq	L___unnamed_4(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp8:
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_5(%rip), %rdx
	movl	$1, %esi
	movq	%r14, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	leaq	L___unnamed_6(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp11:
	movl	(%rbx), %edi
	callq	_tig_print_int
Ltmp12:
	leaq	L___unnamed_7(%rip), %rdx
	movl	$1, %esi
	movq	%r14, %rdi
	callq	_tig_check_array_bound
Ltmp13:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	leaq	L___unnamed_8(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp14:
	movl	(%rbx), %edi
	movl	$6, %esi
	callq	_assert_equal_int
Ltmp15:
	leaq	L___unnamed_9(%rip), %rdx
	movl	$1, %esi
	movq	%r15, %rdi
	callq	_tig_check_array_bound
Ltmp16:
	movq	8(%r15), %rax
	movq	8(%rax), %rbx
	leaq	L___unnamed_10(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp17:
	movl	$5, (%rbx)
	leaq	L___unnamed_11(%rip), %rdx
	movl	$1, %esi
	movq	%r14, %rdi
	callq	_tig_check_array_bound
Ltmp18:
	movq	8(%r14), %rax
	movq	8(%rax), %rbx
	leaq	L___unnamed_12(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp19:
	movl	(%rbx), %edi
	movl	$5, %esi
	callq	_assert_equal_int
Ltmp20:
	xorl	%eax, %eax
	addq	$16, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_create_rec             ## -- Begin function create_rec
	.p2align	4, 0x90
_create_rec:                            ## @create_rec
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rdi, %r14
	movl	$4, %edi
	callq	_malloc
Ltmp21:
	movq	%rax, %r15
	movl	$6, (%rax)
	movq	8(%r14), %rbx
	leaq	L___unnamed_13(%rip), %rdx
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	_tig_check_array_bound
Ltmp22:
	movq	8(%rbx), %rax
	movq	%r15, 8(%rax)
	movq	8(%r14), %rax
	popq	%rbx
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_13:
	.asciz	"test/malloc.tig::11.6: Array out of bound"

	.p2align	4               ## @1
L___unnamed_1:
	.asciz	"test/malloc.tig::17.14: Array out of bound"

	.p2align	4               ## @2
L___unnamed_2:
	.asciz	"test/malloc.tig::17.17: Nil pointer exception!"

	.p2align	4               ## @3
L___unnamed_3:
	.asciz	"test/malloc.tig::18.15: Array out of bound"

	.p2align	4               ## @4
L___unnamed_4:
	.asciz	"test/malloc.tig::18.18: Nil pointer exception!"

	.p2align	4               ## @5
L___unnamed_5:
	.asciz	"test/malloc.tig::20.12: Array out of bound"

	.p2align	4               ## @6
L___unnamed_6:
	.asciz	"test/malloc.tig::20.15: Nil pointer exception!"

	.p2align	4               ## @7
L___unnamed_7:
	.asciz	"test/malloc.tig::21.13: Array out of bound"

	.p2align	4               ## @8
L___unnamed_8:
	.asciz	"test/malloc.tig::21.16: Nil pointer exception!"

	.p2align	4               ## @9
L___unnamed_9:
	.asciz	"test/malloc.tig::23.4: Array out of bound"

	.p2align	4               ## @10
L___unnamed_10:
	.asciz	"test/malloc.tig::23.7: Nil pointer exception!"

	.p2align	4               ## @11
L___unnamed_11:
	.asciz	"test/malloc.tig::24.13: Array out of bound"

	.p2align	4               ## @12
L___unnamed_12:
	.asciz	"test/malloc.tig::24.16: Nil pointer exception!"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/malloc__code_end"
"_camlLlvm_byte_code/test/malloc__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/malloc__data_end"
"_camlLlvm_byte_code/test/malloc__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/malloc__frametable"
"_camlLlvm_byte_code/test/malloc__frametable":
	.short	23
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
                                        ## live roots for create_rec
	.quad	Ltmp21
	.short	24
	.short	0
	.p2align	3
	.quad	Ltmp22
	.short	24
	.short	0
	.p2align	3
.subsections_via_symbols
