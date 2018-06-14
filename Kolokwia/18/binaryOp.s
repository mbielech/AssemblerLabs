	.text
	.type binA, @function
	.global binA	

# %rdi - char* result
# %rsi - char* arg1
# %rdx - char* arg2
# %rcx - int operation

binA:
	
# -------------- dlugosc arg1 --------------------------------

	XOR	%r15,	%r15	# licznik

next1:	

	MOV	(%rsi,%r15,1),	%r9b	# arg1[i]
	CMP	$0,				%r9b	# if( == NULL)
	JE 	end1
	
	INC	%r15
	JMP	next1
	
end1:

	MOV	%r15,	%r14	# lenght of arg1
	
# END----------- dlugosc arg1 --------------------------------
	
	MOV	%r14,	%r10	# dlugosc arg1

# -------------- utworzenie binarnej liczby z arg1 -----------

	XOR	%r12,	%r12	# miejsce na liczbe binarna
	MOV	$1,		%r13	# maska
	DEC	%r14			# wskaznik na ostatni element
	
nextChar1:
	
	MOV	(%rsi,%r14,1),	%r15b	# znak
	
	CMP	$'1',			%r15b	# czy znak to 1
	JNE	not11
	
	OR	%r13,	%r12	# ustaw dany bit
	
not11:

	SHL	$1,		%r13	# przesun maske
	DEC	%r14			# wskaznik na poprzedni char
	CMP	$0,		%r14	# czy juz koniec?
	JGE	nextChar1	

# END----------- utworzenie binarnej liczby z arg1 -----------
	
	MOV	%r12,	%r8		# arg1 binarnie

# -------------- dlugosc arg2 --------------------------------

	XOR	%r15,	%r15	# licznik

next2:	

	MOV	(%rdx,%r15,1),	%r9b	# arg2[i]
	CMP	$0,				%r9b	# if( == NULL)
	JE 	end2
	
	INC	%r15
	JMP	next2
	
end2:

	MOV	%r15,	%r14	# lenght of arg2
	
# END----------- dlugosc arg2 --------------------------------
	
	MOV	%r14,	%r11	# dlugosc arg1

# -------------- utworzenie binarnej liczby z arg2 -----------

	XOR	%r12,	%r12	# miejsce na liczbe binarna
	MOV	$1,		%r13	# maska
	DEC	%r14			# wskaznik na ostatni element
	
nextChar2:
	
	MOV	(%rdx,%r14,1),	%r15b	# znak
	
	CMP	$'1',			%r15b	# czy znak to 1
	JNE	not12
	
	OR	%r13,	%r12	# ustaw dany bit
	
not12:

	SHL	$1,		%r13	# przesun maske
	DEC	%r14			# wskaznik na poprzedni char
	CMP	$0,		%r14	# czy juz koniec?
	JGE	nextChar2	

# END----------- utworzenie binarnej liczby z arg2 -----------

	MOV	%r12,	%r9		# arg2 binarnie
	
# -------------- znalezienie wiekszej dlugosci ---------------

	CMP	%r10,	%r11
	JL	r10wieksze
	
	MOV	%r11,	%r10
	
r10wieksze:
	
	
# END----------- znalezienie wiekszej dlugosci ---------------
	
# r8 - arg1
# r9 - arg2	
# r10 - dlugosc dluzszego napisu

	

# -------------- operacja 0 - dodawanie ----------------------
	
	CMP	$0,		%rcx
	JNE	notADD
	
	ADD	%r8,	%r9

notADD:

# END----------- operacja 0 - dodawanie ----------------------

# -------------- operacja 1 - and ----------------------
	
	CMP	$1,		%rcx
	JNE	notAND
	
	AND	%r8,	%r9

notAND:

# END----------- operacja 1 - and ----------------------

# -------------- operacja 2 - or ----------------------
	
	CMP	$2,		%rcx
	JNE	notOR
	
	OR	%r8,	%r9

notOR:

# END----------- operacja 2 - or ----------------------

# -------------- operacja 3 - xor ----------------------
	
	CMP	$3,		%rcx
	JNE	notXOR
	
	XOR	%r8,	%r9

notXOR:

# END----------- operacja 3 - xor ----------------------

# %rdi - char* result
# r9 wynik operacji
# r10 - dlugosc dluzszego napisu

	
	
	MOVB $0,	(%rdi,%r10,1)	# '\0' na koniec napisu	

# -------------- tworzenie napisu result ---------------------
	
	DEC	%r10			# wskaznik na ostatni element
	MOV	$1,		%r13	# maska
	MOV	$'0',	%r8b	# char '0'
	MOV	$'1',	%r11b	# char '1'
	
nextResult:
	
	MOV	%r9,	%r15	# kopia wyniku
	AND	%r13,	%r15	# operacja and
	CMP	%r13,	%r15	# czy w wyniku byl ustawiony ten bit?
	JNE zeroResult
	
	MOV	%r11b,	(%rdi,%r10,1)	# wstaw 1
	JMP	nieWstaw0
	
zeroResult:
	
	MOV	%r8b,	(%rdi,%r10,1)	# wstaw 0

nieWstaw0:
	
	SHL	$1,		%r13
	DEC	%r10
	CMP	$0,		%r10	# czy juz koniec?
	JGE	nextResult

# END----------- tworzenie napisu result ---------------------

	MOV	%rdi,	%rax
	RET

