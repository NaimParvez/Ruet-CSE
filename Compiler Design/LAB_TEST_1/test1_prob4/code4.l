%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "code4.tab.h"
%}


%%
"//".*                  {
}
(1[6-9]|20)([0-9][0-9])(00[1-9]|0[1-9][0-9]|1[0-7][0-9]|180)   { 
    printf("%s -> VALID_ROLL_NUMBER\n", yytext);
    return ROLL_NUMBER;
}
[ \t]+                  { /* ignore whitespace */ }
","                 { printf("%s -> COMMA\n", yytext); return COMMA; }
%%

int yywrap() {
    return 1;
}