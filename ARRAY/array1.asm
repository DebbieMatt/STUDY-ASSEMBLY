; array1.asm    


; Codigo C equivalente
;#include <stdio.h>
;  int a[5] = {10,20,30,40,50}; 
;int main()
;{

;
;  printf("%d\n",a[0]);
;  printf("%d\n",a[1]);
;  printf("%d\n",a[2]);
;
;
;  return 0;
;}




        extern  getchar
        extern	printf; 
        extern  scanf
        section .data		; 

fmt:    db "%d",13,10, 0                  ; String de formato do scanf, "\n",'0'
a       times 10 dd  10,20,30,40,50


        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
       
        mov   rdi, fmt
        mov   rsi, [a]
        mov   rax,0  
        call  printf    
        
        mov   rdi, fmt
        mov   rsi, [a+4]        
        mov   rax,0  
        call  printf    
        
        mov   rdi, fmt
        mov   rsi, [a+8]        
        mov   rax,0  
        call  printf    
        
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret	

;  rdi = endereco da posicao de memoria a ser examinada 
;  rsi = numero de bytes
;	
	
	