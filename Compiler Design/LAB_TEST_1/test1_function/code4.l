%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "code4.tab.h"    
%}

%%
"function"      { printf("%s -> FUNCTION\n", yytext); return FUNCTION; }
"return"        { printf("%s -> RETURN\n", yytext); return RETURN; }
"begin"         { printf("%s -> BEGIN_TOKEN\n", yytext); return BEGIN_TOKEN; }
"end"           { printf("%s -> END\n", yytext); return END; }
"int"|"float"|"double"  { printf("%s -> TYPE\n", yytext); return TYPE; }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("%s -> IDENTIFIER\n", yytext); return IDENTIFIER; }
[0-9]+          { printf("%s -> NUMBER\n", yytext); return NUMBER; }
[0-9]+\.[0-9]+  { printf("%s -> DECIMAL\n", yytext); return DECIMAL; }
"("             { printf("%s -> LPAREN\n", yytext); return LPAREN; }
")"             { printf("%s -> RPAREN\n", yytext); return RPAREN; }
"=="|"<"|">"        { printf("%s -> COND\n", yytext); return COND; }
"%"            { printf("%s -> MOD\n", yytext); return MOD; }
":"            { printf("%s -> COLON\n", yytext); return COLON; }
";"            { printf("%s -> SEMICOLON\n", yytext); return SEMICOLON; }

%%
int yywrap() {
    return 1;
}