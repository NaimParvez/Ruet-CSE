%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror(char* s);
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token<int_val> FUNC STARTT END MONE_KORI INTEGER EQUAL JOG PRINT_KORI TYPE_ASSIGN
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INT

%left LT GT /*LT GT has lowest precedence*/
%left JOG 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> exp assignment_print_scan

%start program

%%
program: {gen_code(START, -1);} func_def {gen_code(HALT, -1);}

func_def: FUNC ID LPAREN RPAREN STARTT statements END
        ;

statements: statements statement | ;

statement:  declaration
            |assignment_print_scan
            ;

declaration: MONE_KORI ID TYPE_ASSIGN INTEGER
            {
                insert($2, $4);
            }
            ;

assignment_print_scan: ID EQUAL exp
                {
                    int address = idcheck($1);

                    if(address != -1)
                    {
                        gen_code(STORE, address);
                    }
                    else
                        yyerror("Undefined variable in assignment");
                }
                | PRINT_KORI ID
                {
                    int address = idcheck($2);

                    if(address != -1)
                    {
                        gen_code(PRINT_INT_VALUE, address);
                    }
                    else
                        yyerror("Undefined variable in print");
                }
                ;

exp: ICONST
    {
        gen_code(LD_INT, $1);
    }
    | ID 
      {
            int address = idcheck($1);

            if(address != -1)
            {
                gen_code(LD_VAR, address);
            }
            else
                yyerror("Undefined variable in expression");

      }
    | exp JOG exp { gen_code(ADD, -1); }
    | exp MULOP exp
    | exp GT exp
    |exp LT exp
    ;

%%

void yyerror (char* s)
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("============= ASM CODE===============\n");
    print_assembly();

	return 0;
}
