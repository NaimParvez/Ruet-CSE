%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
    void yyerror(const char *s);
	extern int lineno;
	extern int yylex();
    FILE *fp_syntax;
%}

%union
{
    char str_val[100];
    int int_val;
}

%token FUNC START_BLOCK END_BLOCK MONE_KORI EQUAL JOG PRINT_KORI DECLARATION
%token LPAREN RPAREN
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INTEGER

%type<int_val> exp

%left JOG

%start program

%%
program: {gen_code(START, -1);} function {gen_code(HALT, -1); fprintf(fp_syntax, "program -> function\n");}
        ;
function: FUNC ID LPAREN RPAREN START_BLOCK statements END_BLOCK
        { fprintf(fp_syntax, "function -> FUNC ID LPAREN RPAREN START_BLOCK statements END_BLOCK\n"); }
        ;
statements: statements statement 
          { fprintf(fp_syntax, "statements -> statements statement\n"); }
          | statement
          { fprintf(fp_syntax, "statements -> statement\n"); }
          ;
statement: declaration
         { fprintf(fp_syntax, "statement -> declaration\n"); }
         | assignment
         { fprintf(fp_syntax, "statement -> assignment\n"); }
         | print_statement
         { fprintf(fp_syntax, "statement -> print_statement\n"); }
         ;
declaration: MONE_KORI ID DECLARATION INTEGER
            {
                insert($2, $4);
                fprintf(fp_syntax, "declaration -> MONE_KORI ID DECLARATION INTEGER\n");
            }
            ;
assignment: ID EQUAL exp
            {
                int address = idcheck($1);
                if(address != -1)
                {
                    gen_code(STORE, address);
                }
                else
                    yyerror("Undeclared variable");
                fprintf(fp_syntax, "assignment -> ID EQUAL exp\n");
            }
            ;
print_statement: PRINT_KORI ID
                {
                    int address = idcheck($2);
                    if(address != -1)
                    {
                        gen_code(PRINT_INT_VALUE, address);
                    }
                    else
                        yyerror("Undeclared variable");
                    fprintf(fp_syntax, "print_statement -> PRINT_KORI ID\n");
                }
                ;
exp: ICONST
    {
        gen_code(LD_INT, $1);
        fprintf(fp_syntax, "exp -> ICONST\n");
    }
    | ID 
      {
            int address = idcheck($1);
            if(address != -1)
            {
                gen_code(LD_VAR, address);
            }
            else
                yyerror("Undeclared variable");
            fprintf(fp_syntax, "exp -> ID\n");
      }
    | exp JOG exp 
      { 
        gen_code(ADD, -1); 
        fprintf(fp_syntax, "exp -> exp JOG exp\n");
      }
    ;
%%

void yyerror (const char *s)
{
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}

int main (int argc, char *argv[])
{
    fp_syntax = fopen("syntax_log.txt", "w");
    if (!fp_syntax) { printf("Error opening syntax log file\n"); return 1; }

    printf("\n============= LEXICAL ANALYSIS ===============\n");
	yyparse();
    fclose(fp_syntax);

	printf("\nParsing finished!\n");

    printf("\n============= SYNTAX ANALYSIS (PARSE TREE) ===============\n");
    fp_syntax = fopen("syntax_log.txt", "r");
    if (fp_syntax) {
        char ch;
        while ((ch = fgetc(fp_syntax)) != EOF) putchar(ch);
        fclose(fp_syntax);
    }

    printf("\n============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("\n============= ASM CODE===============\n");
    print_assembly();

	return 0;
}
