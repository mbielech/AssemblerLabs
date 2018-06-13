.text
        .type funa, @function
        .global funa
        
#rdi char* s
#rsi int c
#rdx int n
#rcx int inc

# gcc -o generateSTR generateSTR.c generateSTR.s
 
funa:
	
	MOV	%rdi,	%r12	# s
	MOV	%rsi,	%r11	# c
	MOV	%rdx,	%r10	# n
	MOV %rcx,	%r9		# inc
	
	XOR	%rsi,	%rsi	# iterator 0 .. n
	MOV %r10,	%rcx	# n do count

next:
	
	MOV %r11,	(%r12,%rsi,1)	# c wpisz do s
	
	CMP	$0,		%r9				# if inc
	JE	noinc
	
	INC %r11					# c++
	
noinc:
	
	INC		%rsi		# iterator++
	LOOP	next
	
	MOV %rdi,	%rax	# return s
	RET
