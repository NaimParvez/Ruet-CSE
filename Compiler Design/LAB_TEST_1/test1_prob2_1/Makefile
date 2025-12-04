# main:flex code1.l && bison -d code1.y && gcc code1.tab.c lex.yy.c -o parser -lfl && ./parser < input.txt > output.txt

main: code1.l code1.y
	bison -d code1.y
	flex code1.l
	gcc code1.tab.c lex.yy.c
	./a.out <input.txt> output.txt 
	