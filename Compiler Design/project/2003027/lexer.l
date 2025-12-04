%option noyywrap

%{
	#define INT_TYPE 1
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror(const char* msg);
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
%%

"//".*        { } 

"FUNC"       { printf("Token: FUNC\n"); return FUNC; }
"start"      { printf("Token: START_BLOCK\n"); return START_BLOCK; }
"end"        { printf("Token: END_BLOCK\n"); return END_BLOCK; }
"mone_kori"  { printf("Token: MONE_KORI\n"); return MONE_KORI; }
"integer"    { printf("Token: INTEGER\n"); yylval.int_val=INT_TYPE; return INTEGER; }
"equal"      { printf("Token: EQUAL\n"); return EQUAL; }
"jog"        { printf("Token: JOG\n"); return JOG; }
"print_kori" { printf("Token: PRINT_KORI\n"); return PRINT_KORI; }

"<--"        { printf("Token: DECLARATION\n"); return DECLARATION; }
"("          { printf("Token: LPAREN\n"); return LPAREN; }
")"          { printf("Token: RPAREN\n"); return RPAREN; }

{ID}         { printf("Token: ID, Value: %s\n", yytext); strcpy(yylval.str_val, yytext); return ID; }
{ICONST}     { printf("Token: ICONST, Value: %s\n", yytext); yylval.int_val=atoi(yytext); return ICONST; }

"\n"         { lineno += 1; }
[ \t\r\f]+  

.            { yyerror("Unrecognized character"); }

%%
