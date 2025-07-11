; Assemble:	nasm -f elf64 printInts.asm
; Link:		gcc -o printInts  printInts.o
; Run:		./printInts
; Output:	a=5, rax=7

; Código C equivalente
; #include <stdio.h>
;long int a=5; 
;int main()
; {
;   printf("a=%ld, rax=%ld\n", a, a+2);
;   return 0;
; }

        extern	printf		; Função C

        SECTION .data		

	a:	dq	5	    ; long int a=5;
        fmt:    db "a=%ld, rax=%ld", 10, 0  ; Formato printf


        SECTION .text           ;Seção de código

        global main		
main:				
        push    rbp		
	mov     rbp,rsp
	mov	rax,[a]		; coloca conteúdo do ponteiro a em um registrador
	add	rax,2		; rax = rax +2  soma constante 2 com rax
	mov	rdi,fmt		; primeiro parâmetro
	mov	rsi,[a]         ; segundo parâmetro
	mov	rdx,rax         ; terceiro parâmetro
	mov	rax,0		; sem doubles
        call    printf		; chama função C

	leave		         ; restaura pilha

	mov	rax,0		; valor de retorno da printf
	ret			; return
