; printf3.asm  uso do printf em char, string, int, long int, float, double
; 
; Assemble:	nasm -f elf64 -l printf3.lst  printf3.asm
; Link:		gcc -m64 -o printf3  printf3.o
; Run:		./printf3 
; 
; Programa em C equivalente
;   char      char1='a';            /* caracter */
;   char      str1[]="mystring";    /* string */
;   int       len=9;                /* string */
;   int       inta1=12345678;       /* integer 32-bit */
;   long int  inta2=12345678900;    /* long integer 64-bit */
;   long int  hex1=0x123456789ABCD; /* hexadecimal 64-bit*/
;   float     flt1=5.327e-30;       /* float 32-bit */
;   double    flt2=-123.4e300;      /* double 64-bit*/
;
; #include <stdio.h>
; int main()
; {
;   flttmp=flt1;
;   printf("printf2_64: flt2=%e\n", flt2);
;   printf("char1=%c, srt1=%s, len=%d\n", char1, str1, len);
;   printf("char1=%c, srt1=%s, len=%d, inta1=%d, inta2=%ld\n",
;          char1, str1, len, inta1, inta2);
;   printf("hex1=%lX, flt1=%e, flt2=%e\n", hex1, flt1, flt2);
;   return 0;
; }
        extern printf                   

        SECTION .data                  

fmt2:   db "printf2: flt2=%e", 10, 0
fmt3:	db "char1=%c, str1=%s, len=%d", 10, 0
fmt4:	db "char1=%c, str1=%s, len=%d, inta1=%d, inta2=%ld", 10, 0
fmt5:	db "hex1=%lX, flt1=%e, flt2=%e", 10, 0
	
char1:	db	'a'			 
str1:	db	"mystring",0	        
len:	equ	$-str1			 
inta1:	dd	12345678		 
inta2:	dq	12345678900		 
hex1:	dq	0x123456789ABCD	         
flt1:	dd	5.327e-30		 
flt2:	dq	-123.456789e300	         

	SECTION .bss
		
flttmp:	resq 1			        
	
        SECTION .text                  

        global	main		        
main:				        
	push    rbp			
	
	fld	dword [flt1]	        ; é preciso converter o float para 64 bits
	fstp	qword [flttmp]          ; floating load (80 bits)
	                                ; flttmp=flt1
	mov	rdi,fmt2
	movq	xmm0, qword [flt2]
	mov	rax, 1			; 1 registrador xmm
	call	printf

	mov	rdi, fmt3		
	mov	rsi, [char1]		
	mov	rdx, str1		
	mov	rcx, len		
	mov	rax, 0			; nenhum registrador xmm
	call	printf

	mov	rdi, fmt4		
	mov	rsi, [char1]		
	mov	rdx, str1		
	mov	rcx, len		
	mov	r8, [inta1]		
	mov	r9, [inta2]		
	mov	rax, 0			; nenhum registrador xmm
	call	printf

	mov	rdi, fmt5		
	mov	rsi, [hex1]		
	movq	xmm0, qword [flttmp]    
	movq	xmm1, qword [flt2]	
	mov	rax, 2			; 2 registradores xmm
	call	printf
	
	pop	rbp			; restaura a pilha
        mov     rax, 0			; exit code, 0=normal
        ret	
