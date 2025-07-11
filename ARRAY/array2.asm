; array1.asm    


; Codigo C equivalente
;#include <stdio.h>
;  int a[5] = {10,20,30,40,50}; 
;int main()
;{

;  printf("Entre com um inteiro:"); 
;  scanf("%d",&a[0]);
;  printf("Entre com um inteiro:"); 
;  scanf("%d",&a[1]);
;  printf("Entre com um inteiro:"); 
;  scanf("%d",&a[2]);
;  printf("%d\n",a[1]);
;  printf("%d\n",a[2]);
;  printf("%d\n",a[3]);
;
;
;  return 0;
;}




        extern  getchar
        extern	printf; 
        extern  scanf
        section .data		; 
fmt0:    db "Entre com um numero:",0
fmt1:    db "%d",13,10, 0                  ; String de formato  "\n",'0'
fmt2:    db "%d",0
a       times 10 dd  10,20,30,40,50



        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
       
       mov  rdi, fmt0
       mov  rax,0
       call printf
       
       
        mov   rdi, fmt2
        mov   rsi, a
        mov   rax,0  
        call  scanf    
        
       mov  rdi, fmt0
       mov  rax,0
       call printf  
        
        
        mov   rdi, fmt2
        mov   rsi, a+4        
        mov   rax,0  
        call  scanf   
        
       mov  rdi, fmt0
       mov  rax,0
       call printf
        
        
        mov   rdi, fmt2
        mov   rsi, a+8        
        mov   rax,0  
        call  scanf     
        
        mov  rdi, fmt1
       mov  rsi,[a]
       mov  rax,0
       call printf
        
         mov  rdi, fmt1
       mov  rsi,[a+4]
       mov  rax,0
       call printf
        
         mov  rdi, fmt1
       mov  rsi,[a+8]
       mov  rax,0
       call printf
        
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret	

;  rdi = endereco da posicao de memoria a ser examinada 
;  rsi = numero de bytes
;	
	
	