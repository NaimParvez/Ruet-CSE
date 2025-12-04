main: cal.l 
	flex cal.l
	gcc lex.yy.c
	a <input.txt> output.txt
main2: 
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt
main3: 
	bison -d prog.y
	flex prog.l
	gcc prog.tab.c lex.yy.c
	a <input.txt> output.txt