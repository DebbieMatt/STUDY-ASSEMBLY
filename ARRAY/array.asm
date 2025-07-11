; array.asm    


; Codigo C equivalente
;#include <stdio.h>

;int a[10];
;  int i;
;int main()
;{
;  
;  for (i = 0; i < 10; i++)
;  {
;     printf("Entre um inteiro:");        
;     scanf("%d", &a[i]);
;  }
;  for (i = 0; i< 10; i++)
;  {
;     printf("O inteiro %d que voce entrou foi: %d\n",i, a[i]);
;   }
;  return 0;
;}
	

        extern	printf; 
        extern  scanf
        section .data		; 
msg1:	db "Entre um inteiro:", 0	; String C termina com 0 no final
fmt:    db "%d", 0                  ; String de formato do scanf, "\n",'0'
msg2:   db "O inteiro %d que voce entrou foi: %d",13,10,0 ; 13,10, para pular linha no final (equivalente ao \n do C).
a:       times 10 dd 0              ; dez posições inicializadas com 0
i:       dd  0                     ; i = 0

        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha

        
for_loop1: 
        mov   ebx, dword [i]
        cmp   ebx, 10       
        jae   fim_for_loop1

	mov	rdi,msg1         ; primeiro parametro para o printf 
	mov	rax,0		; nao tem parametros de ponto flutuante
        call    printf		; chama a funcao em C

        mov     eax,4
        mov     ebx, dword[i]
        mul     ebx      ;     edx:eax <-- eax*ebx  
        
        mov     rdi,fmt       ; primeiro parametro para scanf
        mov     rsi, a        ; segundo parametro para scanf (a eh um endereço)
        xor     rbp,rbp
        add     rsi, rbx      ; a + 4*i  = &a[i]
        ;mov     rax, 0
        call    scanf
        
        mov     eax, dword[i]
        inc     eax
        mov    dword[i], eax
        jmp    for_loop1

fim_for_loop1:
        
        
        
        mov     rdi, msg2
        mov     rsi, [a]  ; variavel a (que na realidade eh o conteudo de a).
        mov     rax, 0
        call    printf  
        
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret			; 