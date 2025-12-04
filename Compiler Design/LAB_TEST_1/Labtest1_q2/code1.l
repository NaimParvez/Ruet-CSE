%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "code1.tab.h"
%}

%%
"Year"                  { 
    printf("%s -> KEYWORD\n", yytext);
    yylval.str = strdup(yytext); 
    return KEYWORD; 
}
"MBA"|"MSc"|"BBA"|"BSc"|"PhD"|"MA"|"BA"   { 
    printf("%s -> DEGREE_NAME\n", yytext);
    yylval.str = strdup(yytext); 
    return DEGREE; 
}
[0-9]+                  { 
    printf("%s -> NUMBER\n", yytext);
    yylval.num = atoi(yytext); 
    return NUMBER; 
}
"("                     { 
    printf("( -> LPAREN\n");
    return LPAREN; 
}
")"                     { 
    printf(") -> RPAREN\n");
    return RPAREN; 
}
"-"                     { 
    printf("- -> DASH\n");
    return DASH; 
}
[ \t]+                  { /* ignore whitespace */ }
\n                      { 
    printf("\\n -> NEWLINE\n");
    return NEWLINE; 
}
.                       { 
    printf("%c -> UNKNOWN\n", yytext[0]);
    return yytext[0]; 
}
%%

int yywrap() {
    return 1;
}