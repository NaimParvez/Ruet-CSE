%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
}

%token <num> NUMBER
%token RANGEOP COMMENT NEWLINE

%%

program:
    range_line comment_line
    ;

range_line:
    NUMBER RANGEOP NUMBER NEWLINE {
        if ($1 <= $3)
            printf("Range Accepted: %d-%d\n", $1, $3);
        else
            printf("Error: invalid range %d-%d\n", $1, $3);
    }
    ;

comment_line:
    COMMENT NEWLINE {
        printf("Comment Accepted\n");
    }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
