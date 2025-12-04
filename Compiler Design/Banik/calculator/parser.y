%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include "../symtab.c"

int yyerror(const char *s);
extern int lineno;
extern int yylex();
%}

%union{
    int INTNUM;
    float FLOATNUM;
}

%token PLUS MINUS MUL DIV LP RP MOD
%token<INTNUM> INT_NUM
%token<FLOATNUM> FLOAT_NUM

%type<FLOATNUM> EXP TERM FACTOR

%start EXP

%%
// expression
EXP: EXP MOD TERM { $$ = (int)$1 % (int)$3; printf("mod : %f\n", $$); }
    | EXP PLUS TERM { $$ = $1 + $3; printf("plus : %f\n", $$); }
    | EXP MINUS TERM { $$ = $1 - $3; printf("minus : %f\n", $$); }
    | TERM { $$ = $1; printf("term : %f\n", $$) }
    ;
    
TERM: TERM MUL FACTOR { $$ = $1 * $3; }
    | TERM DIV FACTOR { $$ = $1 / $3; }
    | FACTOR { $$ = $1; }
    ;

FACTOR: LP EXP RP { $$ = $2; }
        | INT_NUM { $$ = yylval.INTNUM; }
        | FLOAT_NUM { $$ = yylval.FLOATNUM; }
        ;
%%

int yyerror(const char *s) {
    printf("Error: %s at line %d\n", s, lineno);
    return 0;
}

int main (int argc, char *argv[]){
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
