all:
	bison -d -o ./build/parser.tab.c parser.y
	flex -o ./build/lex.yy.c lexer.l
	gcc -o ./build/compiler ./build/parser.tab.c ./build/lex.yy.c
	./build/compiler < input.txt

clean:
	rm -f ./build/*