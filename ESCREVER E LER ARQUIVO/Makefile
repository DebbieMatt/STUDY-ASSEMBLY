teste:	teste.o rw.o
	gcc -o teste teste.o rw.o

teste.o:	teste.c
	gcc -c teste.c

rw.o:
	nasm -f elf64 rw.asm
	
clean:
	rm *.o 
	rm teste