; 
; Assemble:	nasm -f elf float1.asm
; Link:		gcc -m32 -o float1 float1.o
; Run:		./float1
; Compute z = (x-1) * (y+3.5), where x is 1.5 and y is 2.5
; This program uses the external printf C  function which requires
; a format string defining what to print, and a variable number of
; variables to print.
%include "dumpRegs.asm"

        extern printf                   ; the C function to be called

        SECTION .data                   ; Data section

msg     db      "sum = %e",0x0a,0x00
x	dd	1.5
y	dd	2.5
z	dd	0
temp	dq	0
	
	
        SECTION .text                   ; Code section.

        global	main		        ; "C" main program 
main:				        ; label, start of main program

;;; compute x-1
	fld	dword [x]	        ; st0 <- x
	fld1				; st0 <- 1 st1 <- x
	fsub				; st0 <- x-1

;;; keep (x-1) in stack and compute y+3.5

	fld	dword [y]		; st0 <- y st1 <- x-1
	push	__float32__( 3.5 )	; put 32-bit float 3.5 in memory (actually in stack)
	fld	dword [esp]		; st0 <- 3.5 st1 <- y st2 <- x-1
	add	esp, 4			; undo push
	fadd				; st0 <- y+3.5 st1 <- x-1
	
	fadd				; st0 <- x-1 + y+3.5
	fst	dword [z]		; store sum in z


	fld	dword [z]     		; transform z in 64-bit word
	fstp	qword [temp]            ; store in 64-bit temp and pop stack top

		 
	push	dword [temp+4] 		; push temp as 2 32-bit words
	push	dword [temp]
        push    dword msg		; address of format string
        call    printf			; Call C function
        add     esp, 12			; pop stack 3*4 bytes

        mov     eax, 1			; exit code, 0=normal
	mov	ebx, 0
        int	0x80			;