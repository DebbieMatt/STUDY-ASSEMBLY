        segment .data

prompt: db     "Entre x: ",0
scanf_format   db    "%ld",0
printf_format  db    "fact(%ld) = %ld",13,10,0

        segment .text
        global  main                ; let the linker know about main
        global  fact                ; tell the world about fact
        extern  scanf               ; resolve write and exit from libc
        extern  printf
main:
        x  equ  8
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8
;
;       printf("Entre x: ");
;
        lea     rdi, [prompt]      ; set arg 1 for printf
        xor     eax, eax            ; 0 float parameters
        call    printf
;
;       scanf("%ls", &x);
;
        lea     rdi, [scanf_format] ; set arg 1 for scanf
        lea     rsi, [rsp+x]            ; set arg 2 for scanf
        xor     eax, eax            ; set rax to 0 (2 byte instruction)
        call    scanf

;
;       printf("fact(%ld) = %ld\n",x,fact(x));
;
        mov     rdi, [rsp+x]     ; 
        call    fact ; retorno da fact esta em rax

        lea     rdi, [printf_format]    ; set arg 1 for printf
        mov     rsi, [rsp+x]            ; set arg 2 for printf
        mov     rdx, rax            ; set arg 3 to be x!
        xor     eax, eax            ; 0 pontos flutuantes
        call    printf

;
;       return 0
;
        xor     eax, eax            ; set rax to 0 for return value
        leave
        ret

;   long fact ( long n )
;
fact:                               ; recursive factorial function
        n       equ     8
        push    rbp
        mov     rbp, rsp
        sub     rsp, 8
;
;       if ( n <= 1 ) return 1;
;
        cmp     rdi, 1              ; compare argument with 1
        jg      greater             ; if n <= 1, return 1
        mov     eax, 1              ; set return value to 1
        leave
        ret
;
;       else return fact(x-1) * x;
;
greater:
        push    rdi
        dec     rdi                 ; call fact with x-1
        call    fact
        pop     rdi
        imul    rax, rdi           ; rax = rax*rdi
        leave
        ret                    ; retornando x*fact(x-1) que esta em rax

