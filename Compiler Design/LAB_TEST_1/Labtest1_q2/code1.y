%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
    int num;
}

%token <str> KEYWORD DEGREE
%token <num> NUMBER
%token LPAREN RPAREN DASH NEWLINE

%%


program:
    line_list
    ;

line_list:
    line
    | line_list line
    ;

line:
    year_statement NEWLINE
    | NEWLINE
    ;

year_statement:
    KEYWORD LPAREN NUMBER RPAREN DEGREE DASH NUMBER
    {
        printf("Parsed: Year (%d) %s-%d\n", $3, $5, $7);
    }
    ;

%%


int main(){
    printf("Starting parser for year and degree information...\n");
    
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}

void yyerror(const char *s){
    printf("Timestamp: %s %s\n error: %s\n", __DATE__, __TIME__, s);
}