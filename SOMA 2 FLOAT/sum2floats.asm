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

x	dd	1.5
y	dd	2.5
z	dd	0
w       dd      0
temp	dq	-1.2445434
msg     db      "soma = %e",0x0a,0x00
	
	
        SECTION .text                   ; Code section.

        global	main		        ; "C" main program 
main:	
       push rbp  ; sem isso da problema
       mov  rbp,rsp
       
	fld	dword [x]	        ; st0<-x
	fld	dword [y]               ; st0<-y  st1<-x
	fadd                            ; st0 <- st0+st1
	fstp	dword [z]		; z <- st0


	fld	dword [z]     		; transform z in 64-bit word by pushing in stack
	fstp	qword [temp]            ; and popping it back as 64-bit quadword

		 

        mov  rdi, msg
        movq  xmm0, qword [temp]
        mov  rax,1
        call printf
        
        leave 
        mov rax,0
        ret