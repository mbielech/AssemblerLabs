.text
        .type maxA, @function
        .global maxA
        
#rdi long long *tab
#rsi long long n
#rdx long long *even
#rcx long long *neg
 
maxA:
	MOV	%rdi,	%r10	# tab*
	MOV	%rdx,	%r8		# even
	
	MOV	$0,		%r12	# just 0
	MOV	%r12,	(%r8)	# even = 0
	MOV	%r12,	(%rcx)	# neg = 0
	XOR	%r9,	%r9		# max
	XOR	%r11,	%r11	# i
	
next:
	MOV	$2,		%rbx	# just 2 do diva (bedziemy robic rax div 2)
	MOV	(%r10),	%rax	# rax=tab[i]
	XOR	%rdx,	%rdx	# RDX = 0
	DIV	%rbx			# RDX:RAX div RBX
	
	CMP	$0,		%rdx	# if(tab[i] % 2 == 0)
	JNE	noteven
	ADD	$1,		(%r8)	# even++
	
noteven:
	CMP	$0,		(%r10)	# if(tab[i] < 0)
	JGE	notneg
	ADD $1,		(%rcx)	# neg++
	
notneg:	

#  wisienkanatorcie ----------------------------

#	XOR	%rax,	%rax
	MOV	$1,		%r15	# maska
	XOR	%r14,	%r14	# j
	XOR	%r12,	%r12	# licznik 1 w postaci bin
	
wisienka:
	MOV %r15,	%r13	# kopia maski
	XOR	(%r10),	%r13	# XOR tab[i] i maski
	CMP	%r13,	%r15	# jesli tab[i] ma maskowana jedynke w reprezentacji bitowej
	JNE	zero
	INC	%r12			# licznik++
	
zero:
	SHL	$1,		%r13	# przesun maske
	INC	%r14			# j++
	CMP	$64,	%r14	# if(j==64)
	JNE	wisienka
	
	CMP	%r9,	%r12	# if(licznik > max)
	JLE	notmax
	MOV	%r12,	%r9		# max = licznik
	MOV	%r11,	%rbx	# przechowaj w rbx wartosc zwracana czyli index maxa

notmax:
#  endOF wisienkanatorcie ----------------------	
		
	INC %r11			# i++
	ADD	$8,		%r10	# kolejny element tab*
	CMP	%r11,	%rsi	# if(i==n)
	JNE	next
	MOV	%rbx,	%rax	# return index max
	RET
