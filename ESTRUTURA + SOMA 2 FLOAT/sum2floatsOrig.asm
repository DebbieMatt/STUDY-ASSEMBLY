; sumFloat.asm   use "C" printf on float
; 
; Assemble:	nasm -f elf sumFloat.asm
; Link:		gcc -m32 -o sumFloat sumFloat.o
; Run:		./sumFloat
; prints a single precision floating point number on the screen
; This program uses the external printf C  function which requires
; a format string defining what to print, and a variable number of
; variables to print.



        extern printf                   ; the C function to be called

        SECTION .data                   ; Data section

msg     db      "soma = %e",0x0a,0x00
x	dd	1.5
y	dd	2.5
z	dd	0
temp	dq	0
	
	
        SECTION .text                   ; Code section.

        global	main		        ; "C" main program 
main:				        ; label, start of main program
	
	fld	dword [x]	        ; st0<-x
	fld	dword [y]               ; st0<-y  st1<-x
	fadd                            ; st0 <- st0+st1
	fstp	dword [z]		; z <- st0


	fld	dword [z]     		; transform z in 64-bit word by pushing in stack
	fstp	qword [temp]            ; and popping it back as 64-bit quadword

		 
	;push	dword [temp+4] 		; push temp as 2 32-bit words
	;push	dword [temp]
        ;push    dword msg		; address of format string
        ;call    printf			; Call C function
        ;add     esp, 12			; pop stack 3*4 bytes

        mov  rdi, msg
        mov  xmm0,qword [temp]
        mov  rax,1
        call printf
        
        
        mov     eax, 1			; exit code, 0=normal
	mov	ebx, 0
        int	0x80			;
