	.text
	.type check_tabA, @function
	.global check_tabA	

# int* tab	%rdi checkTab
# int n 	%rsi 
# int* max 	%rdx

check_tabA:

	XOR		%rax,	%rax		# sum = 0
	MOV		$1,		%r11		# maska
	
	XOR		%r9,	%r9			# i = 0 .. 64
	MOV		$64,	%rcx		# count = 64
	
next:							# for 64 razy

	XOR		%r12,	%r12		# licznik = 0
	XOR		%r10,	%r10		# j = 0 .. n

# inside loop ---------------------------------

	nextinside:
		
		CMP		(%rdi,%r10,4),	%r9d		# if(tab[j] == i)
		JNE		continueinside
		
		INC		%r12						# licznik++
		
		OR		%r11,	%rax				# sum ustawianie bitu
	
	continueinside:
	
		INC		%r10						# j++
		CMP		%r10,	%rsi				# j (=/>/<) n
		JNE		nextinside

# inside loop ---------------------------------

	CMP		(%rdx), 	%r12d	# max (</>/=) licznik
	JLE		continue
	
	MOV		%r12d,		(%rdx)	# max = licznik
	
continue:

	SHL		$1,			%r11	# przesun maske
	INC		%r9					# i++
	LOOP	next
	
	RET
