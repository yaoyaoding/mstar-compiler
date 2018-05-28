compile : program.asm
	nasm -felf64 -l ./gen/program.lst -g program.asm -o ./gen/program.o && gcc -g ./gen/program.o -o ./gen/program.out 
run : compile
	./gen/program.out
gdb : compile
	gdb ./gen/program.out
lib : ./lib/c2nasm/lib.c
	cd ./lib/c2nasm && make

