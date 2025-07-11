    segment .data

prompt:         db     "Entre m e n: ",0
fmt1            db    "%ld %ld",0
resultado       db    "Voce entrou: %ld e %ld",13,10,0

    segment .text
        global  main                ; let the linker know about main
        global  fact                ; tell the world about fact
        extern  scanf               ; resolve write and exit from libc
        extern  printf
main:
        x  equ  8
        y  equ  16
        push    rbp   ; salva base da pilha antiga
        mov     rbp, rsp ; base da pilha nova eh o topo da antiga
        sub     rsp, 16  ; cria variaveis locais
;
;       printf("Enter m e n: ");
;
        lea     rdi, [prompt]      ; set arg 1 for printf
        xor     eax, eax            ; 0 float parameters
        call    printf
;
;       scanf("%ls %ls", x,y);
;
        lea     rdi, [fmt1] ; set arg 1 for scanf
        lea     rsi, [rsp+x] ; set arg 2 for scanf
        lea     rdx, [rsp+y]
        xor     eax, eax      ; set rax to 0 (2 byte instruction)
        call    scanf

;
;       printf("voce entrou: %d\n e %d", x,y);
;
        
        
        lea     rdi, [resultado]    ; 
        mov     rsi, [rsp+x]   ; 
        mov     rdx, [rsp+y]
        xor     eax, eax       ; 
        call    printf

;
;       return 0
;
        xor     eax, eax            ; set rax to 0 for return value
        leave  ; o mesmo que Set ESP to EBP, then pop EBP.
               ; mov rsp,rbp
               ; pop rbp
        ret

