; matrix.asm    


; Codigo C equivalente
;#include <stdio.h>
;#define LIN 2
;#define COL 3
;  int i,j;
;  int a[COL][LIN];
 
;int main()
;{
;  for (i = 0; i< COL ; i++)
;  {
;     for (j = 0; j< LIN; j++)
;     {
;      printf("Entre com o elemento da linha %d e coluna %d\n",i,j); 
;      scanf("%d",&a[i][j]);
;     }
;  }
;  printf("Matriz entrada:\n"); 
;  for (i = 0; i< COL; i++)
;  {
;     for (j = 0; j< LIN; j++)
;      {
;           printf("%d ", a[i][j]);
;       }
;    printf("\n");
;  }
;  printf("\n");
;  return 0;
;}


%define LIN 2
%define COL 3

        extern  getchar
        extern	printf; 
        extern  scanf
        section .data		; 
fmt0:    db "Entre com o elemento da coluna %d e linha %d:",13,10,0
fmt1:    db "%d",0
fmt2:    db "O elemento da coluna %d e linha %d eh:",13,10, 0 ; String de formato  "\n",'0'
fmt3:    db 13,10,0
fmt4:   db  "%d",13,10,0
a       times LIN*COL dd 0
i        dd  0
j        dd  0
dbg1:  db "poisicao: %d",13,10,0


        section .text           ; .

        global main		; Ponto de entrada do gcc
main:				; 
        push    rbp		; seta a pilha
       
      
       xor eax,eax
       mov [i], eax
       
for_loop_1:        
       mov ecx,  [i]
       cmp ecx, COL ; i < COL
       jae fim_for_loop_1

       xor eax,eax
       mov [j],eax ; j deve receber 0 antes do inicio do for
       
for_loop_2: 
       mov ecx, [j]
       cmp ecx, LIN  ; j < LIN
       jae  fim_for_loop_2
       
       xor  rsi,rsi; zera o rsi
       xor rdx,rdx; zera o rdx
       
       mov  rdi, fmt0
       mov  esi, [i]
       mov  edx, [j]
       mov  rax,0
       call printf
       
        xor rax,rax         ; calculo do endereço efetivo
        mov ecx, [i]
        mov edx, [j]
        mov eax, LIN
        mul ecx ;    eax <- eax*ecx  eax <-i*LIN
        add eax,edx  ;  eax <- eax+edx  eax <- i*LIN +j
        mov ebx, a
        
        lea rax, [ebx + 4*eax]  ;  eax <- a + 4*(i*LIN+j)
       
       
      
        mov   rdi, fmt1
        mov   rsi, rax
        call  scanf
      
    
        
        
        mov eax, [j]
        inc eax
        mov [j], eax
        jmp for_loop_2
        
fim_for_loop_2:   
       
        mov eax, [i]
        inc eax
        mov [i], eax
       
       jmp  for_loop_1
       
fim_for_loop_1:  

; final da leitura
;-------------------------------------------------------
; inicio da escrita 


       xor eax,eax
       mov [i], eax
       
for_loop_3:        
       mov ecx,  [i]
       cmp ecx, COL ; i < COL ?
       jae fim_for_loop_3

       xor eax,eax
       mov [j],eax ; j deve receber 0 antes do inicio do for
       
for_loop_4: 
       mov ecx, [j]
       cmp ecx, LIN  ; 
       jae  fim_for_loop_4
       
       xor  rsi,rsi; zera o rsi
       xor rdx,rdx; zera o rdx
       
       mov  rdi, fmt2
       mov  esi, [i]
       mov  edx, [j]
       mov  rax,0
       call printf
       
        xor rax,rax         ; calculo do endereço efetivo
        mov ecx, [i]
        mov edx, [j]
        mov eax, LIN
        mul ecx ;    eax <- eax*ecx  eax <-i*LIN
        add eax,edx  ;  eax <- eax+edx  eax <- i*LIN +j
        mov ebx, a

        lea rax, [ebx + 4*eax]  ;  eax <- a + 4*(i*LIN+j)
       
       
      
        mov   rdi, fmt4
        mov   rsi, [rax]
        mov rax,0
        call  printf
      
    
        
        
        mov eax, [j]
        inc eax
        mov [j], eax
        jmp for_loop_4
        
fim_for_loop_4:   
       
        mov eax, [i]
        inc eax
        mov [i], eax
       
       jmp  for_loop_3
       
fim_for_loop_3:  



         mov   rdi, fmt3
        mov   rsi, rax
        mov   rax,0  
        call  printf
   
	pop	rbp		; reseta a pilha

	mov	rax,0		; return 0
	ret	

;  rdi = endereco da posicao de memoria a ser examinada 
;  rsi = numero de bytes
;	
	
	