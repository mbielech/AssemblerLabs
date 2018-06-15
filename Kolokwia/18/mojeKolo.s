# Bielech Maciej

# Efekty:
# Dziala / Czasami działa / Nie działa
# Czego brakuje? :

# Kompilacja
# gcc -o bielech bielech.c bielech.s

.text
        .type sum_expr, @function
        .global sum_expr
        
# rdi tabA
# rsi tabB
# rdx n
# rcx operation
 
sum_expr:
	
	XOR	%r15,	%r15	# licznik 0 do n
	XOR	%r14,	%r14	# miejsce na wynik
	MOV	%rdx,	%r12	# licznik2 n - 1 do 0
	DEC	%r12
	
next:

	CMP	$0,		%rcx	# operation = 0
	JNE	notoperation0
	
# ------------------ operation0 -------------------

	XOR	%rax,				%rax
	MOV	(%rdi,%r15,4),		%eax	# co chcemy mnozyc
	MOV	(%rsi,%r12,4),		%r8d	# przez co
	
	# negowanie aby przekonwertowac liczbe int na long int

		CMP	$0,		%eax
		JL	neguj11
		JMP nieneguj11
	neguj11:
		NEG	%eax
		NEG	%rax
	nieneguj11:
	
		CMP	$0,		%r8d
		JL	neguj21
		JMP nieneguj21
	neguj21:
		NEG	%r8d
		NEG	%r8
	nieneguj21:
		
	# END negowanie
	
	IMUL %r8, 				%rax	# mnozymy
	
	ADD	%rax,				%r14	# sumujemy do wyniku
	
# END--------------- operation0 -------------------

notoperation0:

	CMP	$1,		%rcx	# operation = 1
	JNE	notoperation1
	
# ------------------ operation1 -------------------

	XOR	%rax,				%rax
	MOV	(%rdi,%r15,4),		%eax	# co chcemy mnozyc
	MOV	(%rsi,%r15,4),		%r8d	# przez co
	
	# negowanie aby przekonwertowac liczbe int na long int

		CMP	$0,		%eax
		JL	neguj12
		JMP nieneguj12
	neguj12:
		NEG	%eax
		NEG	%rax
	nieneguj12:
	
		CMP	$0,		%r8d
		JL	neguj22
		JMP nieneguj22
	neguj22:
		NEG	%r8d
		NEG	%r8
	nieneguj22:
		
	# END negowanie
	
	IMUL %r8, 				%rax	# mnozymy
	
	ADD	%rax,				%r14	# sumujemy do wyniku

# END--------------- operation1 -------------------
notoperation1:

	CMP	$2,		%rcx	# operation = 2
	JNE	notoperation2
	
# ------------------ operation2 -------------------

	XOR	%rax,				%rax
	MOV	(%rdi,%r15,4),		%eax	# co chcemy odejmowac
	MOV	(%rsi,%r12,4),		%r8d	# przez co
	
	# negowanie aby przekonwertowac liczbe int na long int

		CMP	$0,		%eax
		JL	neguj13
		JMP nieneguj13
	neguj13:
		NEG	%eax
		NEG	%rax
	nieneguj13:
	
		CMP	$0,		%r8d
		JL	neguj23
		JMP nieneguj23
	neguj23:
		NEG	%r8d
		NEG	%r8
	nieneguj23:
		
	# END negowanie
	
	SUB %r8, 				%rax	# odejmujemy
	
	ADD	%rax,				%r14	# sumujemy do wyniku

# END--------------- operation2 -------------------
notoperation2:

	CMP	$3,		%rcx	# operation = 3
	JNE	notoperation3
	
# ------------------ operation3 -------------------

	XOR	%rax,				%rax
	MOV	(%rdi,%r15,4),		%eax	# co chcemy odejmowac
	MOV	(%rsi,%r15,4),		%r8d	# przez co
	
	# negowanie aby przekonwertowac liczbe int na long int

		CMP	$0,		%eax
		JL	neguj14
		JMP nieneguj14
	neguj14:
		NEG	%eax
		NEG	%rax
	nieneguj14:
	
		CMP	$0,		%r8d
		JL	neguj24
		JMP nieneguj24
	neguj24:
		NEG	%r8d
		NEG	%r8
	nieneguj24:
		
	# END negowanie
	
	SUB %r8, 				%rax	# odejmujemy
	
	ADD	%rax,				%r14	# sumujemy do wyniku

# END--------------- operation3 -------------------
notoperation3:

	DEC	%r12			# licznik2--
	INC	%r15			# licznik++
	CMP	%rdx,	%r15	# czy juz n? - koniec
	JNE	next
	

	
	MOV	%r14,	%rax	# zwracamy wynik
	RET
