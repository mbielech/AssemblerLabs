#----------------------------------------------------------------
# Program lab_0c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0c.o lab_0c.s
#  To link:    ld -o lab_0c lab_0c.o
#  To run:     ./lab_0c
#
#----------------------------------------------------------------

	.equ	kernel,0x80		#Linux system functions entry
	.equ	write,0x04		#write data to file function
	.equ	exit,0x01		#exit program function
	.equ	stdout,1		#file handle STDOUT

	.data
	
starttxt:					#first message
	.ascii	"Start\n"
starttxtlen:
	.long	(. - starttxt)
endtxt:						#last message
	.ascii	"Finish\n"
endtxtlen:
	.long	(. - endtxt)
gurutxt:					#other message
	.ascii	"A jem assembler guru\n"
gurutxtlen:
	.long	(. - gurutxt)
	
	.text
	.global _start
	
_start:
	MOVL	$write,%eax		#write first message
	MOVL	$stdout,%ebx
	MOVL	$starttxt,%ecx
	MOVL	starttxtlen,%edx
	INT	$kernel

	NOP

	MOVL	$write,%eax		#write other message
	MOVL	$stdout,%ebx
	MOVL	$gurutxt,%ecx
	MOVL	gurutxtlen,%edx
	INT	$kernel

	NOP

	MOVL	$write,%eax		#write last message
	MOVL	$stdout,%ebx
	MOVL	$endtxt,%ecx
	MOVL	endtxtlen,%edx
	INT	$kernel

	NOP

theend:
	MOVL	$exit,%eax		#exit program
	INT	$kernel
