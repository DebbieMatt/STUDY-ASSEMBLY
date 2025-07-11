        segment .data
x       dd      0.0, 1.0, 2.0 ; x1 x2 x3
y       dd      1.0, 3.0, 5.0 ; y1 y2 y3
d       dq      0
str0    db    "a distancia eh: %f",13,10,0

;
;   float x[3] = {0.0,1.0,2.0};
;  float y[3] = {1.0, 3.0, 5.0};
;
;

;  main () {
;    printf("a distancia eh: %f\n",distance3d(x,y));
;    return 0;
;  }
;
        segment .text
        extern printf
        global  main, distance3d
main:
        push    rbp
        mov     rbp, rsp
        lea     rdi, [x]
        lea     rsi, [y]
        call    distance3d
        
     ;   mov   rdi, str0
      ;  movss    [d],xmm0
       ; movss  xmm0, [d]
        ;mov   rax,1
        ;call  printf
        
        
        xor     eax, eax
        leave
        ret

distance3d:
        movss   xmm0, [rdi]  ; xmm0 <- x1     
        subss   xmm0, [rsi]  ;  xmm0 <- xmm0 - y1
        mulss   xmm0, xmm0      
        movss   xmm1, [rdi+4]  ; xmm1 <- x2 
        subss   xmm1, [rsi+4]   ; xmm1 <- xmm1 - y2
        mulss   xmm1, xmm1      
        movss   xmm2, [rdi+8]  
        subss   xmm2, [rsi+8]   
        mulss   xmm2, xmm2      
        addss   xmm0, xmm1      
        addss   xmm0, xmm2      
        sqrtss  xmm0, xmm0
        ret
