Defining The Structure
In C

struct foo
{
    short  a;          /* 2 bytes */
    int    b;          /* 4 bytes */
    char   c;          /* 1 byte  */
    int    d;          /* 4 bytes */
    char   e[ 6 ];     /* 6 bytes */
                       /* Total:  17 bytes, do the math */
};
  
  

In Assembly Language

struc   mystruct
	a:	resw	1
	b:	resd	1
	c:	resb	1
	d:	resd	1
	e:	resb	6
endstruc
  
  

Instatiating The Structure
In C

struct foo s;
  

In Assembly Language


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
struc   mystruct
	a:	resw	1
	b:	resd	1
	c:	resb	1
	d:	resd	1
	e:	resb	6
endstruc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
section .data
aData:  dw      0

struct:
    istruc mystruct
        at a, dw        -1
        at b, dd        0x12345678
        at c, db        ' '
        at d, dd        23
        at e, db        'Gary', 0
    iend

mysize: dd     $ - struct
msg:    db     'Size of struct is %d', 10, 0
msg1:   db     'struct + b = %d', 10, 0
msg2:   db     'pStru + b = %d', 10, 0

zData:  dw     0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

section .bss
aBss:   resw    1

pStru:	resd	1         ; This is a pointer for a dynamically created structure

zBss:   resd    1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section .text
    global main
    extern printf
    extern scanf
    extern malloc

main:                                 

        push    dword [ mysize ]
        push    msg
        call    printf
        add     esp, 8

;; This is a static structure
	mov	eax, 7                    
	mov	dword [ struct + b ], eax  ; move a value into the structure
        push    dword [ struct + b ]       ; get the value
        push    dword msg1
        call    printf                     ; print it out
        add     esp, 8
        
;; This is a dynamic structure

        mov	eax, 17                    ; size of the structure
        push    eax
        call    malloc                     ; get the memory allocated
        mov     dword [ pStru ], eax       ; store the address in the pointer
        add     esp, 4

        mov	ebx, dword [ pStru ]       ; put the address into an index register
        mov     dword [ ebx + b ], 44h     ; set a value
        push    dword [ ebx + b ]          ; get the value
        push    dword msg2
        call    printf                     ; print it out
        add     esp, 8

;; The final part of the program must be a call to the operating system to exit
;;; the program.
        mov     ebx,0   ;successful termination of program
        mov     eax,1   ;system call number (sys_exit)
        int     0x80    ;call kernel

;; Notice the file just ends.

  

Output

[~/courses/umbc/CMSC313/spring05/lectures/Lect10/struct]$ struct
Size of struct is 17
struct + b = 7
pStru + b = 68

