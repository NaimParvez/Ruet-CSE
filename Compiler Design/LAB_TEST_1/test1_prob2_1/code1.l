%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "code1.tab.h"
%}

%%
"RUET"|"CUET"|"BUET"   { 
    printf("%s -> UNIVERSITY_NAME\n", yytext);
    yylval.str = strdup(yytext); 
    return UNIVERSITY; 
}
"CSE"|"EEE"|"ME"|"CE"   { 
    printf("%s -> DEPARTMENT_NAME\n", yytext);
    yylval.str = strdup(yytext); 
    return DEPARTMENT; 
}
[0-9]+                  { 
    printf("%s -> YEAR\n", yytext);
    yylval.num = atoi(yytext); 
    return YEAR; 
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