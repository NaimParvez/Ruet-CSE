main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	a <input.txt> output.txt

# main: cal.l cal.y
# 	win_bison -d cal.y
# 	win_flex cal.l
# 	gcc cal.tab.c lex.yy.c -o cal.exe
# 	.\cal.exe < input.txt > output.