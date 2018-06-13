.text
        .type maxindA, @function
        .global maxindA
        
#rdi int a
#rsi int b
#rdx int c
#rcx int d
 
maxindA:
	MOV	$1,		%r15	# ind = 1
	MOV	$0,		%r14	# powt = 0
	MOV	%rdi,	%r13	# max = a
	
	MOV	%rsi,	%r12	# b
	MOV	$2,		%r11	# index = 2
	CALL max
	
	MOV	%rdx,	%r12	# c
	MOV	$3,		%r11	# index = 3
	CALL max
	
	MOV	%rcx,	%r12	# d
	MOV	$4,		%r11	# index = 4
	CALL max
	
	CMP	$1,		%r14	# if(powt  = 1)
	JNE	ind
	XOR	%r15,	%r15	# ind = 0
	
ind:
	
	MOV	%r15,	%rax	# return ind
	RET
	
	.type max, @function
	.global max
#r12 - liczba 
#r13 - max
#r14 - powt
#r11 - index
max:
	
	CMP	%r12,	%r13	# if(liczba >= max)
	JG	liczbanotmax	# jesli liczba nie jest maxem
	JNE	maxnotpowt		# jesli max sie nie powtorzyl
	
# max sie powtorzyl
	
	MOV	$1,		%r14	# powt = 1
	
maxnotpowt:

	MOV	%r12,	%r13	# max = b
	MOV	%r11,	%r15	# ind = index
	
liczbanotmax:

	RET
