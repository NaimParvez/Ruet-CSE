%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token UNIVERSITY OF DHAKA RAJSHAHI CHITTAGONG NEWLINE

%%

program:
    line_list
    ;

line_list:
    line_list line
    | line
    ;

line:
    UNIVERSITY OF DHAKA NEWLINE        { printf("Accepted\n"); }
    | UNIVERSITY OF RAJSHAHI NEWLINE   { printf("Accepted\n"); }
    | UNIVERSITY OF CHITTAGONG NEWLINE { printf("Accepted\n"); }
    | UNIVERSITY OF DHAKA              { printf("Accepted\n"); }
    | UNIVERSITY OF RAJSHAHI           { printf("Accepted\n"); }
    | UNIVERSITY OF CHITTAGONG         { printf("Accepted\n"); }
    ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
