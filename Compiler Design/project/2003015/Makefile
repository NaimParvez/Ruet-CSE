input = input.txt
output = output.txt

main: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c -o compiler
	./compiler <$(input)> $(output)

assembler-Linux:
	grep -A 1000 "============= ASM CODE===============" $(output) | tail -n +3 > generated_assembly.asm
	@echo "Assembly code saved to generated_assembly.asm"

assembler-windows:
	C:\masm32\bin\ml /c /coff /Cp prog1.asm
	C:\masm32\bin\link -entry:main /subsystem:console prog1.obj
	prog1

clean:
	rm -f lex.yy.c parser.tab.c parser.tab.h compiler output.txt generated.asm *.obj *.exe

