main: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c
	./a.exe <input.txt> output.txt
clean:
	rm -f parser.exe parser.tab.c parser.tab.h lex.yy.c a.exe output.txt syntax_log.txt 