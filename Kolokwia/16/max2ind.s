.text
        .type maxindA, @function
        .global maxindA
        
#rdi int a
#rsi int b
#rdx int c
#rcx int d
 
maxindA:
	MOV	%rdi,	%r15 	#max
	MOV	$1,		%rax 	#returning
	
	MOV	%rdi,	%r12 	#a
	MOV	%rsi,	%r11	#b
	MOV	%rdx,	%r10	#c
	MOV	%rcx,	%r9		#d
	
	CMP	%r11,	%r15
	JNE dalej1
	MOV $0,		%rax
	
dalej1:
	CMP %r15,	%r11
	JLE	dalej2
	MOV %r11,	%r15
	MOV	$2,		%rax
		
dalej2:
	CMP	%r10,	%r15
	JNE dalej3
	MOV $0,		%rax
	
dalej3:
	CMP %r15,	%r10
	JLE	dalej4
	MOV %r10,	%r15
	MOV	$3,		%rax
		
dalej4:
	CMP	%r9,	%r15
	JNE dalej5
	MOV $0,		%rax
	
dalej5:
	CMP %r15,	%r9
	JLE	dalej6
	MOV %r9,	%r15
	MOV	$4,		%rax
		
dalej6:
		RET
	


	RET
