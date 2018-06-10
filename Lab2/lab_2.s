#----------------------------------------------------------------
# Program lab_2.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_2.o lab_2.s
#  To link:    ld -o lab_2 lab_2.o
#  To run:     ./lab_2
#
#----------------------------------------------------------------

	.equ	write_64, 	1	# write data to file function
	.equ	exit_64, 	60	# exit program function
	.equ	stdout, 	1 	# handle to stdout

	.data
	
arg1txt:
	.ascii	"Arg1 = "
arg2txt:
	.ascii	"Arg2 = "
sumtxt:
	.ascii	"Sum  = "
difftxt:
	.ascii	"Diff = "
ortxt:
	.ascii	"OR   = "
andtxt:
	.ascii	"AND  = "
xortxt:
	.ascii	"XOR  = "
arg1:
	.byte	0xA0
arg2:
	.byte	0x05
result:
	.byte	0
tmp:
	.byte	0
restxt:
	.ascii	"  \n"
txtlen:
	.quad	7
reslen:
	.quad	3
 
	.text
	.global _start
	
_start:
	NOP

	MOVB	arg1,		%al
	MOV		$arg1txt,	%rsi
	CALL	disp_line

	NOP

	MOVB	arg2,		%al
	MOV		$arg2txt,	%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,		%al
	ADDB	arg2,		%al
	MOVB	%al,		result
	MOV		$sumtxt,	%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,		%al
	SUBB	arg2,		%al
	MOVB	%al,		result
	MOV		$difftxt,	%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,		%al
	ORB		arg2,		%al
	MOVB	%al,		result
	MOV		$ortxt,		%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,		%al
	ANDB	arg2,		%al
	MOVB	%al,		result
	MOV		$andtxt,	%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,		%al
	XORB	arg2,		%al
	MOVB	%al,		result
	MOV		$xortxt,	%rsi
	CALL	disp_line

	NOP

	MOV		$exit_64,	%rax
	XOR		%rdi,		%rdi 
	SYSCALL

#----------------------------------------------------------------
# disp_line - displays line of text (prompt + hexadecimal number)
#----------------------------------------------------------------

	.type disp_line,@function

disp_line:
	MOVB	%al,		tmp		# zapamietanie przekazanej liczby w tmp

	MOV		$write_64,	%rax	# wypisanie tekstu z %rsi
	MOV		$stdout,	%rdi
	MOV		txtlen,		%rdx
	SYSCALL

	MOVB	tmp,		%al		# przywrocenie z tmp
	ANDB	$0x0F,		%al		# wyciagniecie mniej znaczacych bitów
	CMPB	$10,		%al		# porownanie z 10
	JB		digit1				# jesli mniejsze od 10 to
	ADDB	$('A'-0x0A),%al		# (dla > 10) dodaj odpowiednia wartosc aby zamienic na A..F
	JMP		insert1				# przeskocz obsluge < 10
digit1:
	ADDB	$'0',		%al		# (dla < 10) dodaj '0' aby zamienic na znak
insert1:
	MOV		%al,		%ah		# zapisz wartosc %al w %ah

	MOVB	tmp,		%al		# przywroc liczbe z tmp
	SHR		$4,			%al		# przesun w prawo o cztery bity
	CMPB	$10,		%al		# porownaj z 10
	JB		digit2				
	ADDB	$('A'-0x0A),%al
	JMP		insert2
digit2:
	ADDB	$'0',		%al
insert2:
	MOVW	%ax,		restxt	# zapisz wartosc calego rejestru ax w restxt (ax sklada sie z ah, gdzie jest mniej znaczacy znak i al gdzie jest bardziej znaczacy znak)
	
	MOV		$write_64,	%rax	# wypisz restxt
	MOV		$stdout,	%rdi
	MOV		$restxt,	%rsi
	MOV		reslen,		%rdx
	SYSCALL

	RET
	
