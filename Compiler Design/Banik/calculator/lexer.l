%option noyywrap

%{
#include "parser.tab.h"
int lineno = 1;
%}

digit     [0-9]
INT_NUM   {digit}+
FLOAT_NUM {digit}+"."{digit}*([eE][+-]?{digit}+)?
%%
"//".*        { }

"+" { printf("PLUS: %s\n", yytext); return PLUS; }
"-" { printf("MINUS: %s\n", yytext); return MINUS; }
"*" { printf("MUL: %s\n", yytext); return MUL; }
"/" { printf("DIV: %s\n", yytext); return DIV; }
"%" { printf("MOD: %s\n", yytext); return MOD; }

"(" { printf("LP: %s\n", yytext); return LP; }
")" { printf("RP: %s\n", yytext); return RP; }

{INT_NUM} { printf("INT_NUM: %s\n", yytext); yylval.INTNUM = atoi(yytext); return INT_NUM; }
{FLOAT_NUM} { printf("FLOAT_NUM: %s\n", yytext); yylval.FLOATNUM = atof(yytext); return FLOAT_NUM; }

"\n"        { lineno += 1; }
[ \t\r\f]+  { /* ignore whitespace */ }
.       { printf("Unrecognized character: %s\n", yytext); }
%%