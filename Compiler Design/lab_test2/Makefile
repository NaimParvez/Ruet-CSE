main: prog.l prog.y
	bison -d prog.y
	flex prog.l
	gcc prog.tab.c lex.yy.c -o lex.out
	./lex.out < input.txt > output.txt


clean:
	rm -f lex.yy.c prog.tab.c prog.tab.h lex.out output.txt