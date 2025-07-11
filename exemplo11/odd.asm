; odd.asm    


; Codigo C equivalente
;#include <stdio.h>
 
;#include <stdio.h>
 
;int main()
;{
;   int n;
; 
;   printf("Entre um inteiro:");
;   scanf("%d", &n);
; 
;   if (n%2 == 0)
;      printf("Par\n");
;   else
;      printf("Impar\n");
; 
;   return 0;
;}
	

        extern	printf;  
        extern  scanf;
        section .data		; 
msg1:	db "Entre um inteiro:", 0	; String C termina com 0 no final
fmt:    db "%d", 0                  ; String de formato do scanf, "\n",'0'
msg2:   db "Par",13,10,0 ; 13,10, para pular linha no final (equivalente ao \n do C).
msg3:   db "Impar",13,10,0 ;
n       dq  0                         ; variavel a nao inicializada (a eh um ponteiro).  


        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
	
	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        mov     rdi,fmt       ; primeiro parametro para scanf
        mov     rsi, n        ; segundo parametro para scanf (n eh um endereço)
        ;mov     rax, 0
        call    scanf
        
        ; divisao de 32 bits
        ;
        ; edx:eax |  reg
        ;          _______
        ;  edx       eax
        ;  
        ; fazemos reg = ecx abaixo
        
        mov rdx,0
        mov rax,[n]
        mov rcx, 2
        div ecx    ; quociente fica em eax e resto em edx 
        
        cmp edx,0
        jz  PAR
        
        
        ; se o resto nao for zero, o resto eh um e o
        ; numero eh impar

        mov     rdi, msg3
        mov     rax, 0
        call    printf  
        jmp      FIM
       
PAR: 
        mov     rdi, msg2
        mov     rax, 0
        call    printf  
 
FIM: 
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret			; 