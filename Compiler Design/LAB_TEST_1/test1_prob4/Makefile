main: code4.l code4.y
	bison -d code4.y
	lex code4.l
	gcc -o code4 lex.yy.c code4.tab.c -lfl
	./code4 < input.txt > output.txt