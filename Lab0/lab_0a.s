#----------------------------------------------------------------
# Program lab_0a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0a.o lab_0a.s
#  To link:    ld -o lab_0a lab_0a.o
#  To run:     ./lab_0a
#
#----------------------------------------------------------------

	.data				# poczatek danych
	
dummy:					# etykieta dummy 
	.byte	0x00		# jakaś dana o wielkosci byte i wartosci 0x00

	.text				# poczatek programu
	.global _start		# punkt startowy programu
	
_start:					# etykieta _start
	JMP	_start			# skok do etykiety _start
