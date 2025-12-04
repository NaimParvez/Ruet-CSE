%{
#include "compiler.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
%}

%%

[0-9]{3} {
    printf("%s -> NUMBER\n", yytext);
    yylval.num = atoi(yytext);
    return NUMBER;
}

"-"     { printf("- -> RANGE_OPERATOR\n"); return RANGEOP; }

"//".*  {
    printf("%s -> COMMENT\n", yytext);
    return COMMENT;
}

\n      { return NEWLINE; }
[ \t]   { /* skip spaces */ }
.       { /* ignore unknown */ }

%%

int yywrap(void) { return 1; }
