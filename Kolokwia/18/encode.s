.text
        .type encode, @function
        .global encode
#rdi str
#rsi charset
#rdx case
 
encode:
	XOR	%r15,	%r15	# licznik
	XOR	%r14,	%r14	# just 0 do porownywania z '\0'
	
next:
	CMP	%r14b,	(%rdi,%r15,1)	# czy juz koniec	
	JE	end
	
	MOV	(%rdi,%r15,1), %r13b	# wczytujemy znak
	
	
	CMP	$0,		%rsi			# charset 0
	JNE	not0
	JMP	charset0
not0:	
	CMP	$2,		%rsi			# charset 2
	JNE not2
	
# ------------ charset 0 -----------------------
charset0:
	CMP	$'A',	%r13b			# czy wieksze lub rowne duze A
	JL	notcharset0duze
	
	CMP	$'Z',	%r13b			# czy mniejsze lub rowne od Z
	JG	notcharset0duze
	
	SUB	$'A',	%r13b			# przeskalujemy na od 0 do 25
	
	MOV	$25,	%r12b
	SUB	%r13b,	%r12b			# zamiana 25 - 0 ... 0 - 25
	
	ADD	$'A',	%r12b
	
	MOV	%r12b,	(%rdi,%r15,1)	# wsadzenie zamienionej
	
notcharset0duze:

	CMP	$'a',	%r13b			# czy wieksze lub rowne duze A
	JL	notcharset0male
	
	CMP	$'z',	%r13b			# czy mniejsze lub rowne od Z
	JG	notcharset0male
	
	SUB	$'a',	%r13b			# przeskalujemy na od 0 do 25
	
	MOV	$25,	%r12b
	SUB	%r13b,	%r12b			# zamiana 25 - 0 ... 0 - 25
	
	ADD	$'a',	%r12b
	
	MOV	%r12b,	(%rdi,%r15,1)	# wsadzenie zamienionej
	
notcharset0male:

# END--------- charset 0 -----------------------

not2:
	
	CMP	$1,		%rsi		# moze charset = 1
	JNE not1
	JMP charset1
not1:
	CMP	$2,		%rsi		# moze charset = 2
	JNE	not22

# ------------ charset 1 -----------------------

charset1:

	CMP	$'0',	%r13b			# czy wieksze lub rowne duze A
	JL	notcharset1
	
	CMP	$'9',	%r13b			# czy mniejsze lub rowne od Z
	JG	notcharset1
	
	SUB	$'0',	%r13b			# przeskalujemy na od 0 do 9
	
	MOV	$9,		%r12b
	SUB	%r13b,	%r12b			# zamiana 9 - 0 ... 0 - 9
	
	ADD	$'0',	%r12b
	
	MOV	%r12b,	(%rdi,%r15,1)	# wsadzenie zamienionej
	
notcharset1:

# END--------- charset 1 -----------------------

not22:

	MOV	(%rdi,%r15,1), %r13b	# wczytujemy znak
	
	CMP	$0,		%rdx	# case 0
	JE doNothing
	CMP	$1,		%rdx	# case 1
	JE malenaduze
	CMP	$2,		%rdx	# case 2
	JE duzenamale
	JMP doNothing
	
# ------------ case 1 ----------------------------
malenaduze:

	CMP	$'a',	%r13b			# czy wieksze lub rowne a
	JL	doNothing
	
	CMP	$'z',	%r13b			# czy mniejsze lub rowne od z
	JG	doNothing
	
	SUB	$32,	%r13b			# zamiana male na duze
	
	MOV	%r13b,	(%rdi,%r15,1)	# wsadzenie zamienionej

JMP	doNothing

# END--------- case 1 ----------------------------

# ------------ case 2 ----------------------------
duzenamale:

	CMP	$'A',	%r13b			# czy wieksze lub rowne a
	JL	doNothing
	
	CMP	$'Z',	%r13b			# czy mniejsze lub rowne od z
	JG	doNothing
	
	ADD	$32,	%r13b			# zamiana duze na male
	
	MOV	%r13b,	(%rdi,%r15,1)	# wsadzenie zamienionej

JMP	doNothing

# END--------- case 2 ----------------------------

doNothing:
	
	INC	%r15			# licznik++
	JMP next
end:	
	
	MOV	%rdi,	%rax
	RET
