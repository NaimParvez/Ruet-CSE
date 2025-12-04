main: compiler.l compiler.y
	bison -d compiler.y
	flex compiler.l
	gcc compiler.tab.c lex.yy.c
	./a.out <input.txt> output.txt
clean:
	rm -f compiler.tab.c compiler.tab.h lex.yy.c a.out output.txt

object:
	gcc -c input.c -o input.o
