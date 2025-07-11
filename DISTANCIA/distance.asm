        segment .data
x       times 3 dd  0.0     
y       times 3 dd  0.0
fmt0    db  "%f %f %f",0
fmt1    db  "Entre o vetor x:",13,10,0
fmt2    db  "Entre o vetor y:",13,10,0
fmt3    db  "x.y = %f",13,10,0

        segment .text
        extern printf
        extern scanf
        global  main, distance3d
main:
        push    rbp
        mov     rbp, rsp
        
        ; printf("Entre o vetor x:");
        lea    rdi,[fmt1]
        xor    rax,rax
        call   printf
        
        lea   rdi, [fmt0]
        movq  xmm0,  [x]
        movq  xmm1,  [x+4]
        movq   xmm2,  [x+8]
        mov rax,3
        call scanf

        lea    rdi,[fmt2]
        xor    rax,rax
        call   printf
        
        lea   rdi, [fmt0]
        movq   xmm0,  [y]
        movq   xmm1,  [y+4]
        movq   xmm2,  [y+8]
        mov rax,3
        call scanf
        
        
        
        lea     rdi, [x]
        lea     rsi, [y]
        call    distance3d
        
        lea   rdi, [fmt3]
        mov   rsi,  rax
        mov   rax,1
        call printf
        
        
        
        xor     eax, eax
        leave
        ret

distance3d:
        movss   xmm0, [rdi]     ; x from first point
        subss   xmm0, [rsi]     ; subtract x from second point
        mulss   xmm0, xmm0      ; (x1-x2)^2
        movss   xmm1, [rdi+4]   ; y from first point
        subss   xmm1, [rsi+4]   ; subtract y from second point
        mulss   xmm1, xmm1      ; (y1-y2)^2
        movss   xmm2, [rdi+8]   ; z from first point
        subss   xmm2, [rsi+8]   ; subtract z from second point
        mulss   xmm2, xmm2      ; (z1-z2)^2
        addss   xmm0, xmm1      ; add x and y parts
        addss   xmm0, xmm2      ; add z part
        sqrtss  xmm0, xmm0
        ret
