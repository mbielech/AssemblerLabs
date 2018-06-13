	.text
	.type przekatnaA, @function
	.global przekatnaA	

# %rdi - long** tab
# %rsi - int bok

przekatnaA:
	
	MOV		%rdi,	%r15	# tab**
	XOR		%r14,	%r14	# sum = 0
	
	XOR		%r13,	%r13	# i = 0
	MOV		%rsi,	%rcx	# count

next:
	
	MOV		$8,		%rax	# rax = 8
	MUL		%r13			# rax = i*8 bo long
	
	MOV		(%r15),	%r12	# wskaznik na i-ty wiersz
	ADD		%rax,	%r12	# wskaznik na ity element itego wiersza
	
	ADD		(%r12),	%r14	# sum += tab[i][i]
	
	ADD		$8,		%r15	# przesun wskaznik na kolejny wiersz
	
	INC		%r13			# i++
	LOOP	next
	
	MOV		%r14,	%rax	# return sum
	RET
