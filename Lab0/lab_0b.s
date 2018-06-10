#----------------------------------------------------------------
# Program lab_0b.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0b.o lab_0b.s
#  To link:    ld -o lab_0b lab_0b.o
#  To run:     ./lab_0b
#
#----------------------------------------------------------------

	.data				# poczatek danych
	
dummy:					# etykieta dummy 
	.byte	0x00		# jakaś dana o wielkosci byte i wartosci 0x00

	.text				# poczatek programu
	.global _start		# punkt startowy programu
	
_start:					# etykieta _start
	MOV	$1, %eax		# wpisanie 1 do rejestru eax (exit function)
	INT	$0x80			# system interrupt, co z jedynka w eax da funkcje exit
