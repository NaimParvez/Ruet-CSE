%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s);
%}


%token ROLL_NUMBER COMMA
%%
program:
    roll_number_list
    ;
roll_number_list:
    roll_number
    | roll_number_list roll_number
    ;
roll_number:
    ROLL_NUMBER COMMA
    | ROLL_NUMBER
    ;
%%

int main() {
    yyparse();
    printf("Accepted\n");
    return 0;
}
void yyerror(const char *s) {
    fprintf(stderr, "error: %s\n", s);
}