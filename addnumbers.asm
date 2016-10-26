TITLE Masm Template

INCLUDE Irvine32.inc
.data

instructions		BYTE	"This is Kemar's program to accept two numbers and them displaying the result.", 0
authorName BYTE "Kemar Galloway", 0dh, 0ah, 0
prompt_1			BYTE	"First Number: ", 0
prompt_2			BYTE	"Second Number: ", 0
num1 DWORD ?
num2 DWORD ?


val3 DWORD 2000
total DWORD ?
sumMessage		BYTE	"The sum is = ", 0


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


	; Print out the registers
	; call dumpregs

	exit
main ENDP
END main
