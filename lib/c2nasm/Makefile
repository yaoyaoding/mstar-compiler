lib : lib.c
	bash c2nasm.bash lib.c

test : test.cpp
	bash c2nasm.bash test.cpp
code : code.asm
	nasm -felf64 -o code.o -g code.asm && g++ -o code -g code.o 
