%{
#include <stdio.h>
void yyerror(char *s);
int yylex();

%}
%token NUM ADD SUB MULT
%start cal

%%
cal: exp;

exp: exp ADD NUM
   | exp SUB NUM
   | exp MULT NUM
   | NUM
   ;
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");

}

void yyerror( char *s)
{
    fprintf(stderr, "Error: %s", s);
}
