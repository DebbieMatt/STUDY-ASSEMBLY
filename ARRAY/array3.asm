; array3.asm    


; Codigo C equivalente
;#include <stdio.h>
;#define MAX 5
;  int i;
;  int a[MAX] = {10,20,30,40,50};


;int main()
;{
;  for (i = 0; i< MAX ; i++)
;  {
;      printf("Entre com um inteiro:"); 
;      scanf("%d",&a[i]);
;  }
;  
;  for (i = 0; i< MAX; i++)
;  {
;     printf("Inteiro %d: %d\n",i,a[i]);
;  }
;
;  return 0;
;}


%define MAX 5

        extern  getchar
        extern	printf; 
        extern  scanf
        section .data		; 
fmt0:    db "Entre com um numero:",0
fmt1:    db "Inteiro %d: %d",13,10, 0                  ; String de formato  "\n",'0'
fmt2:    db  "%d",0
a       times 10 dd  10,20,30,40,50
i        dd  0



        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
       
      
       
for_loop_1:        
       mov ecx,  [i]
       cmp ecx, MAX ; i < MAX ?
       jae fim_for_loop_1
       
       mov  rdi, fmt0
       mov  rax,0
       call printf
       
        mov rax, 0
        mov ecx,  [i]
        mov ebx, a
        lea eax, [ebx + 4*ecx]
       
       
        mov   rdi, fmt2
        mov   rsi, rax
        mov   rax,0  
        call  scanf
        
        mov eax, [i]
        inc eax
        mov [i], eax
        jmp for_loop_1
        
fim_for_loop_1:   
        
        xor rax,rax
        mov [i],eax
   
for_loop_2:   
       mov ecx,  [i]
       cmp ecx, MAX ; i < MAX ?
       jae fim_for_loop_2
   
        mov  rdi, fmt1
       mov  rsi, [i]
       
       mov rbx,a
       mov rcx,[i]
       lea eax, [ebx + 4*ecx]
       mov  rdx, [eax]
       mov  rax,0
       call printf
        
        mov eax, [i]
        inc eax
        mov [i], eax
        jmp for_loop_2
fim_for_loop_2:
 
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret	

;  rdi = endereco da posicao de memoria a ser examinada 
;  rsi = numero de bytes
;	
	
	