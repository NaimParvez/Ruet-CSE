%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror(char* s);
	extern int lineno;
	extern int yylex();
	FILE *fp_syntax;
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
program: {gen_code(START, -1);} func_def {gen_code(HALT, -1); fprintf(fp_syntax, "program -> func_def\n");}

func_def: FUNC ID LPAREN RPAREN STARTT statements END
        {
            fprintf(fp_syntax, "func_def -> FUNC ID LPAREN RPAREN STARTT statements END\n");
        }
        ;

statements: statements statement 
          {
              fprintf(fp_syntax, "statements -> statements statement\n");
          }
          | 
          {
              fprintf(fp_syntax, "statements -> empty\n");
          };

statement:  declaration
            {
                fprintf(fp_syntax, "statement -> declaration\n");
            }
            |assignment_print_scan
            {
                fprintf(fp_syntax, "statement -> assignment_print_scan\n");
            }
            ;

declaration: MONE_KORI ID TYPE_ASSIGN INTEGER
            {
                insert($2, $4);
                fprintf(fp_syntax, "declaration -> MONE_KORI ID TYPE_ASSIGN INTEGER\n");
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
                    
                    fprintf(fp_syntax, "assignment_print_scan -> ID EQUAL exp\n");
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
                    
                    fprintf(fp_syntax, "assignment_print_scan -> PRINT_KORI ID\n");
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
                yyerror("Undefined variable in expression");
            
            fprintf(fp_syntax, "exp -> ID\n");
      }
    | exp JOG exp 
      { 
          gen_code(ADD, -1); 
          fprintf(fp_syntax, "exp -> exp JOG exp\n");
      }
    | exp MULOP exp
      {
          fprintf(fp_syntax, "exp -> exp MULOP exp\n");
      }
    | exp GT exp
      {
          fprintf(fp_syntax, "exp -> exp GT exp\n");
      }
    |exp LT exp
      {
          fprintf(fp_syntax, "exp -> exp LT exp\n");
      }
    ;

%%

void yyerror (char* s)
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
    fp_syntax = fopen("syntax_log.txt", "w");
    if (!fp_syntax) { printf("Error opening syntax log file\n"); return 1; }

    printf("============= LEXICAL ANALYSIS =============\n");
	yyparse();
    fclose(fp_syntax);
    
	printf("\nParsing finished!\n");

    printf("\n============= SYNTAX ANALYSIS (Parse Tree) =============\n");
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
