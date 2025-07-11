
    segment .text
        global  maximo                
 
;   int  maximo (int a , int b int c)
;   {
;      int max;
;      if (a >= b) 
;        max = a;
;      else 
;         max = b;
;      if (c > max)
;        max = c;
;      return max; 
;  } 
 
 maximo:
        max   equ  8
        
        push    rbp   ; salva base da pilha antiga
        mov     rbp, rsp ; base da pilha nova eh o topo da antiga
   ;     sub     rsp, 8  ; cria variaveis locais

;  if (a >= b)  ==>  cmp rdi,rsi
    
        cmp   rdi,rsi
        jb    else_1
        mov    rax , rdi ; max = a;
       jmp   fim_if_1        
else_1:
        mov rax, rsi  ; max = b;
fim_if_1:
;      if (c > max)        
        cmp rdx,rax
        jbe  fim_if_2
        mov rax,rdx ; max = c;
        
fim_if_2:
      
       
        leave
        ret
        
        
        
