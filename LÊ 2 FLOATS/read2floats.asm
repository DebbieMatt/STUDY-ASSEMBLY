; 
; Assemble:	nasm -f elf64   read2floats.asm
; Link:		gcc -m64 -o read2floats  read2floats.o
; Run:		./read2floats 
; 
; Programa em C equivalente
;
; #include <stdio.h>
; int main()
; {
;   return 0;
; }
        extern printf                   
        extern scanf 
        
        SECTION .data                  

fmt:   db "%f",  0
msg1:	db "Entre com um float:", 0
msg2:	db "A soma dos dois floats eh: %f", 13,10,0
	
a:	dq	0
b:	dq	0
c:      dq      0

	SECTION .bss
		
flttmp:	resq 1			        
	
        SECTION .text                  

        global	main		        
main:				        
	push    rbp			
	mov     rbp,rsp
	
	
	mov   rdi, msg1
	mov   rax,0
	call  printf
	
	
	mov	rdi,fmt
	mov     rsi,a
	mov	rax, 0			
	call	scanf

	mov   rdi, msg1
	mov   rax,0
	call  printf

	
        mov	rdi,fmt
	mov     rsi,b
	mov	rax, 0			
	call	scanf
    

	fld    dword [a]
	fld    dword [b]
	fadd
	fstp   dword [c]
	
	
	mov     rdi,msg2
	movq     xmm0,qword [c]
	cvtss2sd  xmm0,xmm0
	mov     rax,1
	call    printf
	
	
	leave 
        mov     rax, 0			; exit code, 0=normal
        ret	
