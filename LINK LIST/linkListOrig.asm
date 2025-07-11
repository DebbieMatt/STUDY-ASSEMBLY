;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   linklist
	next:	resd	1
	nr:     resd    1
endstruc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
%define NULL            0
%define LLSIZE          8
section .data
limit   dd              5
msg     db              'Node contains %d', 10, 0
section .bss
head    resd            1
newItem resd            1

section .text
    global main
    extern printf
    extern malloc

main:
        mov     dword [ head ], NULL        ; start with an empty list
        mov     dword [ newItem ], NULL

        mov     ecx, [ limit ]

makeNode:
        push    ecx
        mov     eax, LLSIZE
        push    eax
        call    malloc                      ; create a node
        add     esp, 4
        pop     ecx
        cmp     dword [ head ], NULL
        jne     notFirst
        mov     [ head ], eax               ; Keep track of where the list starts
       
notFirst:
        mov     ebx, eax                    ; put the address into an index register
        mov     [ ebx ], dword NULL         ; this is the end of the list, so mark it.
        mov     [ ebx + nr ], ecx           ; this is our data
        
        cmp     dword [ newItem ], NULL
        je      notFirst2
        mov     edi, dword [ newItem ]
        mov     dword [ edi + next ], ebx

notFirst2:
        mov     dword [ newItem ], ebx

        loop    makeNode                    ; make next node, if not done yet.

        mov     ecx, dword [ limit ]
        mov	ebx,dword [ head ]
printNode:
        push    ecx
        mov     dword [ newItem ], ebx      
        push    dword [ ebx + nr ]
        push    msg
        call    printf
        add     esp, 8
        mov     ebx, dword [ ebx ]
        pop     ecx
        loop    printNode

done:
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel
