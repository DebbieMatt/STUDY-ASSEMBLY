      extern print_str
      extern read_str
 
 section .data
 prompt1  db  "digite um nome:",0
 mystr    db  "           "
 mystrsz  equ $-mystr
 prompt2  db  "você digitou:",0
 prompt3  db  13,10,0
 section .text
    global main

main:
   mov rdi,prompt1
   call print_str
   mov rdi,mystr
   call read_str
   mov rdi,prompt2
   call print_str
   mov rdi,mystr
   call print_str
   ret