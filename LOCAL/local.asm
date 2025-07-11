    segment .data

;  Codigo C equivalente
;  main () {
;   long int x; 
;    printf ("Entre x:");
;   scanf("%ld",&x);
;   printf("Voce entrou: %ld\n",x);
;   return 0;
;  }
    
    
    
    
    
prompt:         db     "Entre x: ",0
fmt1            db    "%ld",0
fmt2            db     "%d",0
resultado       db    "Voce entrou: %ld",13,10,0

    segment .text
        global  main          ; let the linker know about main
        extern  scanf        ; resolve write and exit from libc
        extern  printf
main:
        x  equ  8
        push    rbp      ; salva a base da pilha antiga 
                         ; na pilha *antiga*
        mov     rbp, rsp ; topo da pilha antiga vai ser a base
                         ;da nova pilha.
        sub     rsp, 8
;
;       printf("Enter n: ");
;
        lea     rdi, [prompt]      ; set arg 1 for printf
        xor     eax, eax            ; 0 float parameters
        call    printf
;
;       scanf("%ls", x);
;
        lea     rdi, [fmt1] ; set arg 1 for scanf
        lea     rsi, [rsp+x] ; set arg 2 for scanf
        xor     eax, eax      ; set rax to 0 (2 byte instruction)
        call    scanf

;
;       printf("voce entrou: %d\n", x);
;
        
        
        lea     rdi, [resultado]    ; 
        mov     rsi, [rsp+x]   ; 
        xor     eax, eax       ; 
        call    printf

;
;       return 0
;
        xor     eax, eax            ; set rax to 0 for return value
        leave  ; o mesmo que Set ESP to EBP, then pop EBP.
               ; mov rsp,rbp ; restaura a pilha antiga:
               ;     o topo da pilha antiga eh igual a base da pilha 
               ;     atual
               ;     
               ; pop rbp  ; a base da pilha pilha antiga eh o que
               ;           foi empilhado antes de se criarem as
               ;           variaveis locais.
        ret

