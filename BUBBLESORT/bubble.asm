
;#include <stdio.h>
;  int main(void){;
;
;  int vetor[10] = {10,9,8,7,6,5,4,3,2,1};;
;
 ; int tamanho = 10;
;  int aux;
;  for (i = 0; i< MAX; i++)
;  {
;    printf("Entre com um numero:");
;    scanf ("%d",&vetor[i]);
;  }  
;
 ; for(int i=tamanho-1; i >= 1; i--) { 
 ;      
 ;   for( int j=0; j < i ; j++) {
 ;        
 ;     if(vetor[j]>vetor[j+1]) {
 ;              
 ;       aux = vetor[j];
 ;       vetor[j] = vetor[j+1];
 ;       vetor[j+1] = aux;
 ;      
 ;       }
 ;     }
 ;   }

 ; for( int r = 0; r < 10; ++r){

;       printf("%d\n",vetor[r]);
 ;}
;}

%define MAX 5

        extern  getchar
        extern    printf;
        extern  scanf
        section .data        ;
fmt0:    db "Entre com um numero:",0
fmt1:    db "Inteiro %d: %d",13,10, 0                  ; String de formato  "\n",'0'
fmt2:    db  "%d",0
a       times 10 dd  10,20,30,40,50
i        dd  0
j        dd  0
aux      dd  0
fmt3:   db "i=%d,j=%d",13,10,0
fmt4:   db "a[i]=%d, a[i+1]=%d",13,10,0

        section .text           ; .

        global main        ; Ponto de entrada do gcc
main:                ;
        push    rbp        ; seta a pilha
      
     
      
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
       
       
; for(int i=tamanho-1; i >= 1; i--) { 
 ;      
 ;   for( int j=0; j < i ; j++) {
 ;        
 ;     if(vetor[j]>vetor[j+1]) {
 ;              
 ;       aux = vetor[j];
 ;       vetor[j] = vetor[j+1];
 ;       vetor[j+1] = aux;
 ;      
 ;       }
 ;     }
 ;   }       
       
      mov   eax, MAX
      dec   eax
      mov   [i], eax  ; i = MAX -1

for_loop_3:
     
      mov ebx, [i]
      cmp ebx, 1
      jb  fim_for_loop_3          ; i >= 1
     
     
      xor  eax,eax
      mov  [j],eax  ; j = 0
for_loop_4:
      mov  eax,[j]
      mov  ebx,[i]
      cmp  eax,ebx        ; j < i
      jae  fim_for_loop_4
       
      ; mov  rdi, fmt3
      ; mov  rsi, [i]
      ; mov  rdx, [j]
      ; mov  rax,0
      ; call printf  
     
 ;     if(a[j]>a[j+1]) {
 ;              
 ;       aux = a[j];
 ;       a[j] = a[j+1];
 ;       a[j+1] = aux;
 ;      
 ;       } 
     
      ; computo de a[j]   
      mov  ebx, a
      mov  ecx, [j]
      lea  eax, [ebx + 4*ecx]
      mov  ecx, eax  ; &a[j]
      add  eax,4
      mov  edx, eax ; &a[j+1]
     
      ; mov  rdi, fmt4
      ;mov  rsi, [r8]
      ; mov  rdx, [r9]
      ; mov  rax,0
      ; call printf  
     
     
     
     
     
      mov  eax,[ecx] ; a[j]
       mov  ebx,[edx] ; a[j+1]
       cmp  eax,ebx; a[j] > a[j+1]
       jbe  fim_if
      
       ; aux = a[j]
       mov  [aux], eax ; a[j] em eax
       ; a[j] = a[j+1]
       mov  [ecx], ebx   ; a[j+1] em ebx
       ; a[j+1] = aux
       mov  ebx, [aux];
        mov [edx], ebx  ;  a[j+1] = aux
      
      
      
      
       
 fim_if:     
      
      
      
      
       mov  eax,[j]    ; j++
       inc  eax
       mov  [j], eax
       jmp  for_loop_4
fim_for_loop_4:       
       
      mov  ebx,[i]              ;i--
      dec  ebx
      mov  [i], ebx
      jmp  for_loop_3 
       
fim_for_loop_3:       
       
        xor rax,rax
        mov [i],rax
  
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
 
    pop    rbp        ; reseta a pilha

    mov    rax,0        ; return 0
    ret   
