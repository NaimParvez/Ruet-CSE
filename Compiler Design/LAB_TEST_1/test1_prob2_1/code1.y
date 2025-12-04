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

%token <str> UNIVERSITY DEPARTMENT
%token <num> YEAR
%token NEWLINE

%%


program:
    line_list
    ;

line_list:
    line
    | line_list line
    ;

line:
    university_info NEWLINE
    | NEWLINE
    ;

university_info:
    UNIVERSITY DEPARTMENT YEAR
    | UNIVERSITY DEPARTMENT
    | UNIVERSITY YEAR
    | DEPARTMENT YEAR
    | UNIVERSITY
    | DEPARTMENT
    | YEAR
    ;

%%


int main(){
    printf("Starting parser for university information...\n");
    
    yyparse();
    printf("Timestamp: %s %s Parsing Finished\n", __DATE__, __TIME__);
    return 0;
}

void yyerror(const char *s){
    printf("Timestamp: %s %s\n error: %s\n", __DATE__, __TIME__, s);
}