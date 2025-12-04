%{
#include "compiler.tab.h"
%}

%%

"#include"          { return INCLUDE; }
"<math.h>"          { return HEADER; }
"#define"           { return DEFINE; }

"int"               { return INT; }
"return"            { return RETURN; }

[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

"="                 { return ASSIGN; }
";"                 { return SEMI; }
"{"                 { return LBRACE; }
"}"                 { return RBRACE; }
"("                 { return LP; }
")"                 { return RP; }

[ \t\n]             { /* ignore whitespace */ }
.                   { /* ignore other chars */ }

%%

int yywrap(void) { return 1; }
