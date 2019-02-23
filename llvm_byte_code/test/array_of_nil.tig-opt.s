	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 14
	.globl	"_camlLlvm_byte_code/test/array_of_nil__code_begin"
"_camlLlvm_byte_code/test/array_of_nil__code_begin":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/array_of_nil__data_begin"
"_camlLlvm_byte_code/test/array_of_nil__data_begin":
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
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$16, %edi
	callq	_malloc
Ltmp0:
	movq	%rax, %r14
	movl	$1, (%rax)
	movq	$0, 8(%rax)
	movl	$40, %edi
	callq	_malloc
Ltmp1:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB0_3
	.p2align	4, 0x90
LBB0_2:                                 ## %loop
                                        ## =>This Inner Loop Header: Depth=1
	movq	$0, (%rbx,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB0_2
LBB0_3:                                 ## %end
	movl	$16, %edi
	callq	_malloc
Ltmp2:
	movq	%rax, %r15
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$40, %edi
	callq	_malloc
Ltmp3:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB0_6
	.p2align	4, 0x90
LBB0_5:                                 ## %loop12
                                        ## =>This Inner Loop Header: Depth=1
	movq	$0, (%rbx,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB0_5
LBB0_6:                                 ## %end13
	movl	$16, %edi
	callq	_malloc
Ltmp4:
	movq	%rax, %r12
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	movl	$40, %edi
	callq	_malloc
Ltmp5:
	movq	%rax, %rbx
	xorl	%eax, %eax
	cmpl	$4, %eax
	ja	LBB0_9
	.p2align	4, 0x90
LBB0_8:                                 ## %loop30
                                        ## =>This Inner Loop Header: Depth=1
	movq	$0, (%rbx,%rax,8)
	incq	%rax
	cmpl	$4, %eax
	jbe	LBB0_8
LBB0_9:                                 ## %end31
	movl	$16, %edi
	callq	_malloc
Ltmp6:
	movq	%rax, %r13
	movl	$5, (%rax)
	movq	%rbx, 8(%rax)
	leaq	L___unnamed_1(%rip), %rdx
	movl	$1, %esi
	movq	%r15, %rdi
	callq	_tig_check_array_bound
Ltmp7:
	movq	8(%r15), %rax
	movq	8(%rax), %rdi
	callq	_tig_nillable
Ltmp8:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp9:
	leaq	L___unnamed_2(%rip), %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	callq	_tig_check_array_bound
Ltmp10:
	movq	8(%r12), %rax
	movq	8(%rax), %rdi
	callq	_tig_nillable
Ltmp11:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp12:
	leaq	L___unnamed_3(%rip), %rdx
	movl	$1, %esi
	movq	%r13, %rdi
	callq	_tig_check_array_bound
Ltmp13:
	movq	8(%r13), %rax
	movq	8(%rax), %rdi
	callq	_tig_nillable
Ltmp14:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp15:
	xorl	%esi, %esi
	callq	_g
Ltmp16:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp17:
	movq	%r14, %rsi
	callq	_g
Ltmp18:
	movl	$1, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp19:
	leaq	L___unnamed_4(%rip), %rsi
	movq	%r14, %rdi
	callq	_tig_check_null_pointer
Ltmp20:
	movq	8(%r14), %rsi
	callq	_g
Ltmp21:
	xorl	%esi, %esi
	movl	%eax, %edi
	callq	_assert_equal_int
Ltmp22:
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_f                      ## -- Begin function f
	.p2align	4, 0x90
_f:                                     ## @f
## %bb.0:                               ## %entry
	xorl	%eax, %eax
	retq
                                        ## -- End function
	.globl	_g                      ## -- Begin function g
	.p2align	4, 0x90
_g:                                     ## @g
	.cfi_startproc
## %bb.0:                               ## %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rsi, %rbx
	movq	%rsi, %rdi
	callq	_tig_nillable
Ltmp23:
	movl	%eax, %ecx
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	LBB2_1
## %bb.2:                               ## %merge
	popq	%rbx
	retq
LBB2_1:                                 ## %else
	leaq	L___unnamed_5(%rip), %rsi
	movq	%rbx, %rdi
	callq	_tig_check_null_pointer
Ltmp24:
	movl	(%rbx), %eax
	popq	%rbx
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
	.p2align	4               ## @0
L___unnamed_5:
	.asciz	"test/array_of_nil.tig::10.17: Nil pointer exception!"

	.p2align	4               ## @1
L___unnamed_1:
	.asciz	"test/array_of_nil.tig::16.25: Array out of bound"

	.p2align	4               ## @2
L___unnamed_2:
	.asciz	"test/array_of_nil.tig::17.26: Array out of bound"

	.p2align	4               ## @3
L___unnamed_3:
	.asciz	"test/array_of_nil.tig::18.26: Array out of bound"

	.p2align	4               ## @4
L___unnamed_4:
	.asciz	"test/array_of_nil.tig::21.18: Nil pointer exception!"


	.section	__TEXT,__text,regular,pure_instructions
	.globl	"_camlLlvm_byte_code/test/array_of_nil__code_end"
"_camlLlvm_byte_code/test/array_of_nil__code_end":
	.section	__DATA,__data
	.globl	"_camlLlvm_byte_code/test/array_of_nil__data_end"
"_camlLlvm_byte_code/test/array_of_nil__data_end":
	.quad	0
	.globl	"_camlLlvm_byte_code/test/array_of_nil__frametable"
"_camlLlvm_byte_code/test/array_of_nil__frametable":
	.short	25
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
                                        ## live roots for f
                                        ## live roots for g
	.quad	Ltmp23
	.short	8
	.short	0
	.p2align	3
	.quad	Ltmp24
	.short	8
	.short	0
	.p2align	3
.subsections_via_symbols
