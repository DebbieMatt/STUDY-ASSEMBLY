; integer.asm    


; Codigo C equivalente
;#include <stdio.h>
;  int a;
;int main()
;{
; 
;  printf("Entre um inteiro:");
;  scanf("%d", &a);
; 
;  printf("O inteiro que voce entrou foi: %d\n", a);
; 
;  return 0;
;}
	

        extern	printf; 
        extern  scanf
        section .data		; 
msg1:	db "Entre um inteiro:", 0	; String C termina com 0 no final
fmt:    db "%d", 0                  ; String de formato do scanf, "\n",'0'
msg2:   db "O inteiro que voce entrou foi: %d",13,10,0 ; 13,10, para pular 
                                    ; linha no final (equivalente ao \n do C).
a       dd  0                         ; variavel a nao inicializada (a eh um ponteiro).  


        section .text           

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
        mov     rbp,rsp
	; printf ("Entre um inteiro:");
	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        ; scanf ("%d",&a);
        mov     rdi,fmt       ;  primeiro parametro para scanf
        mov     rsi, a        ; segundo parametro para scanf (a eh um endereço)
        ;mov     rax, 0
        call    scanf
        
        ;printf("O inteiro que você entrou foi: %d\n",a);
        mov     rdi, msg2
        mov     rsi, [a]  ; variavel a (que na realidade eh o conteudo de a).
        mov     rax, 0
        call    printf  
        
        
	mov     rsp,rbp         ; destroi todas as variaveis locais 
	                        ; não tem nenhuma no caso
	pop	rbp		; restaura o quadro de pilha anterior 

	mov	rax,0		; return 0
	ret			; 