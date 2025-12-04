%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yylex();
void yyerror(const char *s);    
%}

%token FUNCTION RETURN BEGIN_TOKEN END
%token TYPE IDENTIFIER NUMBER DECIMAL
%token LPAREN RPAREN
%token SEMICOLON MOD COND COLON

%%
program:
    function_list
    ;

function_list:
    function
    | function_list function
    ;
function:
    FUNCTION IDENTIFIER LPAREN IDENTIFIER COLON TYPE RPAREN BEGIN_TOKEN statement_list END
    ;
statement_list:
    statement
    | statement_list statement
    ;
statement:
    RETURN condition SEMICOLON
    | NUMBER
    | DECIMAL
    ;
condition:
    IDENTIFIER MOD DECIMAL COND NUMBER
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