%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token INCLUDE HEADER DEFINE
%token INT RETURN
%token ID NUMBER
%token ASSIGN SEMI LBRACE RBRACE LP RP

%%

program:
      INCLUDE HEADER DEFINE ID INT mainfunc
    ;

mainfunc:
      INT ID LP RP LBRACE decls RETURN NUMBER SEMI RBRACE
    ;

decls:
      decls decl
    | decl
    ;

decl:
      ID ID ASSIGN NUMBER SEMI
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter code:\n");
    if (yyparse() == 0)
        printf("Accepted\n");
    return 0;
}
