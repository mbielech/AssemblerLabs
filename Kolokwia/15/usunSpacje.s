	.text
	.type usunSpacjeA, @function
	.global usunSpacjeA	

# %rdi - char* string
# %rsi - int zamiana

usunSpacjeA:
	
	MOV		%rdi,	%r14	# string*

next:
	
	MOV		(%r14),	%r13b
	CMP		$0,		%r13b	# if(string[i] != 0)
	JE		end
	
# --------- WHILE LOOP --------------------------

	# --------- ZAMIANA -----------------------------
	
	CMP		$0,		%rsi	# if(zamiana)
	JE		notZamiana
	
	MOV		(%r14),	%r13b
	CMP		$'z',	%r13b	# if(string[i] <= 'z')
	JA		notZamiana
	
	CMP		$'a',	%r13b	# if(string[i] >= 'a')
	JB		notZamiana
	
	MOV		$32,	%dl		# 'a' - 'A'
	MOV		(%r14),	%r13b	# string[i]
	SUB		%dl,	%r13b	# string[i] -= ('a'-'A')
	MOV		%r13b,	(%r14)
	
notZamiana:

	# END------ ZAMIANA -----------------------------
	
	# --------- USUWANIE SPACJI -----------------------------
	
	MOV		(%r14),	%r13b
	CMP		$' ',	%r13b	# if(string[i] == ' ')
	JNE		notUsuwanieSpacji	
	
	INC		%r14			# string[i+1]
	MOV		(%r14),	%r13b
	DEC		%r14			# cofnij zmiane
	
	CMP		$' ',	%r13b	# if(string[i+1] == ' ')
	JNE		notUsuwanieSpacji	
	
	MOV		%r14,	%r12	# r12 = string[i]*

	# --------- WHILE INSIDE -----------------------------	
	
	nextInside:	

		MOV		(%r12),	%r13b
		CMP		$0,		%r13b	# if(string[j] != 0)
		JE		endInside
		
		MOV		%r12,	%r11
		INC		%r11			# string[j+1]
		
		MOV		(%r11),	%r13b
		MOV		%r13b,	(%r12)	# string[j] = string[j+1]
		
		INC		%r12			# j++
		JMP nextInside
		
	endInside:
	
	# --------- WHILE INSIDE -----------------------------
	
		DEC		%r14			# i--
		
notUsuwanieSpacji:
	
	# END------ USUWANIE SPACJI -----------------------------
	
	INC		%r14			# string* = (string+1)*
	JMP		next
	
# END------ WHILE LOOP --------------------------	
	
end:
	
	MOV		%rdi,	%rax
	RET
