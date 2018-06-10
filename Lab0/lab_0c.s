#----------------------------------------------------------------
# Program lab_0c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0c.o lab_0c.s
#  To link:    ld -o lab_0c lab_0c.o
#  To run:     ./lab_0c
#
#----------------------------------------------------------------

	.equ	kernel,	0x80		# do funkcji systemowych Linuxa
	.equ	write,	0x04		# funkcja write
	.equ	exit,	0x01		# funkcja exit
	.equ	stdout,	1			# deskryptor stdout

	.data						# dane
	
starttxt:						# etykieta starttxt
	.ascii	"Start\n"			# napis
starttxtlen:
	.long	(. - starttxt)		# kropka to adres bierzacy minus poczatek napisu da nam dlugosc
endtxt:
	.ascii	"Finish\n"
endtxtlen:
	.long	(. - endtxt)
gurutxt:
	.ascii	"A jem assembler guru\n"
gurutxtlen:
	.long	(. - gurutxt)

	.text						# poczatek programu
	.global _start
	
_start:
	MOVL	$write,		%eax	# numer funkcji do eax (write)
	MOVL	$stdout,	%ebx	# deskryptor, gdzie pisac do ebx (stdout)
	MOVL	$starttxt,	%ecx	# wskaznik na poczatek tekstu do ecx
	MOVL	starttxtlen,%edx	# dlugosc tekstu do edx (bez $ bo przekazujemy wartosc, a nie adres)
	INT		$kernel				# interruption aby wykonac funkcje systemowa

	NOP							# No OPeration

	MOVL	$write,		%eax	# write other message
	MOVL	$stdout,	%ebx
	MOVL	$gurutxt,	%ecx
	MOVL	gurutxtlen,	%edx
	INT		$kernel

	NOP

	MOVL	$write,		%eax	#write last message
	MOVL	$stdout,	%ebx
	MOVL	$endtxt,	%ecx
	MOVL	endtxtlen,	%edx
	INT		$kernel

	NOP

theend:
	MOVL	$exit,		%eax	# exit program
	INT		$kernel
