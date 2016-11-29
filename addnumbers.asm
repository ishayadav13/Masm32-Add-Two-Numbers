TITLE Masm Template

INCLUDE Irvine32.inc
.data



instructions		BYTE	"This is Kemar's program to accept two numbers and them displaying the result.", 0
authorName			BYTE "Kemar Galloway", 0dh, 0ah, 0

userNameInstructions   BYTE	"Please enter your name", 0
userName				       BYTE   21 DUP(0)
userNameByteCount		   DWORD ?
greeting				       BYTE	"Hi, ", 0

prompt_1			BYTE	"First Number: ", 0
prompt_2			BYTE	"Second Number: ", 0
num1 DWORD ?
num2 DWORD ?

abigVar QWORD ?


total DWORD ?
difference DWORD ?

sumMessage		BYTE	"The sum is = ", 0
subMessage      BYTE    "The value after subtraction is: ",0

numberOfLoopCycles BYTE 10
bitsreamMessage		BYTE	"Please enter a 1 or 0",0

sumTheNumberOfOnesMessage  BYTE		"The number of 1s = ",0
sumTheNumberOfZerosMessage	BYTE	"The number of 0s = ",0
sumTotal DWORD ?
zeroTotal DWORD ?

.code
main PROC

	; print out instructions
	mov		edx, OFFSET instructions
	call	WriteString
	call	CrLf

	; print out author name
	mov edx, OFFSET authorName
	call WriteString

	; print out a decimal number in the eax register

	; prompts for first number
	mov		edx, OFFSET prompt_1
	call	WriteString
	call	ReadInt
	mov		num1, eax


	; prompts for second number
	mov		edx, OFFSET prompt_2
	call	WriteString
	call	ReadInt
	mov		num2, eax

	; perform addition 
	mov eax, num1
	add eax, num2
	
	
	mov		edx, OFFSET sumMessage
	call	WriteString
	mov total, eax
	call	WriteDec
	call	CrLf

	mov eax, num1
	sub eax, num2

	mov		edx, OFFSET subMessage
	call	WriteString
	mov difference, eax
	call	WriteDec
	call	CrLf

	; get user name
	mov		edx, OFFSET userNameInstructions
	call	WriteString
	call	CrLf
	mov		edx, OFFSET userName
	mov		ecx, SIZEOF userName
	call	ReadString
	mov		userNameByteCount, eax

	; add greeting message
	mov		edx, OFFSET greeting
	call	WriteString
	mov		edx, OFFSET userName
	call	WriteString
	call	CrLF



	; looping done here

	xor eax, eax					; clear eax register
	movzx ecx, numberOfLoopCycles	; track how many times to loop
	Loop1 :
		cmp ecx, 0					; check if done looping
		je EndLoop1					; jump outside of loop if done
		
		mov		edx, OFFSET bitsreamMessage
		call	WriteString
		call	ReadInt
			.if eax == 1
				add eax, sumTotal
				mov sumTotal, eax
			    call    WriteDec
			.elseif eax == 0
				add eax, zeroTotal
				mov zeroTotal, eax
				call    WriteDec
			.endif
			
		dec ecx						; [Loop1] decrement counter
		jmp Loop1					; jump to beginning of loop
	EndLoop1 :

	mov		edx, OFFSET sumTheNumberOfOnesMessage
	call	WriteString
	mov sumTotal, eax
	call	WriteDec
	call	CrLf



	mov eax, 10
	sub eax, sumTotal

	mov		edx, OFFSET sumTheNumberOfZerosMessage
	call	WriteString
	mov zeroTotal, eax
	call	WriteDec
	call	CrLf


	call DumpRegs




	; Print out the registers
	; call dumpregs

	exit
main ENDP
END main
