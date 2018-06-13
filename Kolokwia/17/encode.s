	.text
	.type encodeA, @function
	.global encodeA	

# char* 		buf			%rdi 
# unsigned int 	mask 		%rsi 
# int 			operation	%rdx
# int 			character	%rcx

encodeA:
	
	XOR		%r15,	%r15	# licznik 0 .. 9
	MOV		$1,		%r14	# nasza maska
	MOV		$10,	%rbx	# count
	XOR		%r11,	%r11	# just 0, do porownan z \0 na koncu stringa
	
# ---------- MAIN LOOP ------------------------------------------------
	
next:
	
	MOV 	%r14,	%r8		# kopia naszej maski
	AND		%rsi,	%r8		# operacja AND maska podana i nasza
	CMP		%r14,	%r8		# jesli to samo co w naszej masce
	JNE		doNothing

# ---------- OPERACJA 3 ------------------------------------------------
	
	CMP		$3,		%rdx	# if(op == 3)
	JNE		not3
	
	MOVB	%cl,	(%rdi,%r15,1)		# podmieniamy znakiem przekazanym w character
	
not3:

# END------- OPERACJA 3 ------------------------------------------------

# ---------- OPERACJA 2 ------------------------------------------------
	
	CMP		$2,		%rdx	# if(op == 2)
	JNE		not2
	
	MOV		(%rdi,%r15,1),	%r13b			# znak jaki tam siedzial
	SUB		$'0',			%r13b			# na dziesietny
	MOV		$9,				%r12b			# wkladamy 9
	SUB		%r13b,			%r12b			# 9 - liczba
	ADD		$'0',			%r12b			# powrot na char
	MOV		%r12b,			(%rdi,%r15,1)	# przywracamy
	
not2:

# END------- OPERACJA 2 ------------------------------------------------

# ---------- OPERACJA 1 ------------------------------------------------

	CMP		$1,		%rdx	# if(op == 1)
	JNE		doNothing
	
	# usuwanie znaku ----------------------------
		
		MOV		%r15,	%r13	# index i
		MOV		%r15,	%r12	# index j
		INC		%r12			# j = i + 1
		
	nextusuwanie:
	
		MOV		(%rdi,%r12,1), 	%r9b			# wez znak nastepnego
		MOV		%r9b,			(%rdi,%r13,1)	# wloz znak nastepnego do tego
		
		INC		%r12							# j++
		INC		%r13							# i++
		
		CMP		%r11b,			(%rdi,%r13,1)	# sprawdz czy koniec napisu
		JNE		nextusuwanie
		
		DEC		%r15							# naprawa licznika po przesunieciu stringa
		DEC		%rbx							# trzeba dojsc do o 1 mniej

	# endOF usuwanie znaku ----------------------
		
# END------- OPERACJA 1 ------------------------------------------------
	
doNothing:
	
	SHL		$1,		%r14	# przesun nasza maske
	
	INC		%r15			# licznik++
	CMP		%rbx,	%r15	# if(licznik < 9 )
	JL		next

# END------- MAIN LOOP ------------------------------------------------

	MOV		%rdi,	%rax
	RET
