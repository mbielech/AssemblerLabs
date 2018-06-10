#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#
#----------------------------------------------------------------

	.equ	write_64,	1	# write data to file function (64bit)
	.equ	exit_64,	60	# exit program function (64bit)
	.equ	stdout,		1	# handle to stdout

	.data
	
starttxt:
	.ascii	"Start\n"
startlen:
	.quad 	(. - starttxt)		# quad, bo 64 bitowe funkcje
endtxt:
	.ascii	"\nFinish\n"
endlen:
	.quad 	(. - endtxt)
arg1:
	.byte	1
arg2:
	.word	2
arg3:
	.long	3
result:
	.long	0	
 
	.text
	.global _start
	
_start:
	MOVQ	$write_64,	%rax
	MOVQ	$stdout,	%rdi
	MOVQ	$starttxt,	%rsi
	MOVQ	startlen,	%rdx
	SYSCALL

	NOP
	
	XOR		%eax,	%eax
	XOR		%ebx,	%ebx
	XOR		%ecx,	%ecx
	
	MOVL	arg1,	%eax
	MOVL	arg2,	%ebx
	MOVL	arg3,	%ecx
	ADD		%ebx,	%eax
	SUB		%ecx,	%eax
	MOVL	%eax,	result
	
	NOP

	ADD		$48, 		%eax
	MOV		%eax, 		result
	
	MOVQ	$write_64,	%rax
	MOVQ	$stdout,	%rdi
	MOVQ	$result, 	%rsi
	MOVQ	$1,			%rdx
	SYSCALL

	NOP

	MOVQ	$write_64,	%rax
	MOVQ	$stdout,	%rdi
	MOVQ	$endtxt,	%rsi
	MOVQ	endlen,		%rdx
	SYSCALL

	NOP

theend:
	MOV		$exit_64,	%rax
	SYSCALL
		
