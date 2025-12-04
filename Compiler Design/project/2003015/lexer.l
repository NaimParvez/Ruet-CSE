%option noyywrap

%{
	#define INT_TYPE 1
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror(char* s);
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
%%

"//".*        { } 

"FUNC"      { printf("Token: FUNC\n"); return FUNC; }
"start"     { printf("Token: start\n"); return STARTT; }
"end"       { printf("Token: end\n"); return END; }
"mone_kori" { printf("Token: mone_kori\n"); return MONE_KORI; }
"integer"   { printf("Token: integer\n"); yylval.int_val=INT_TYPE; return INTEGER; }
"equal"     { printf("Token: equal\n"); return EQUAL; }
"jog"       { printf("Token: jog\n"); return JOG; }
"print_kori" { printf("Token: print_kori\n"); return PRINT_KORI; }

"<--"       { printf("Token: <--\n"); return TYPE_ASSIGN; }


"("       { printf("Token: (\n"); return LPAREN; }
")"       { printf("Token: )\n"); return RPAREN; }
"{"       { printf("Token: {\n"); return LBRACE; }
"}"       { printf("Token: }\n"); return RBRACE; }
";"       { printf("Token: ;\n"); return SEMI; }
"="       { printf("Token: =\n"); return ASSIGN; }

{ID}        { printf("Token: ID (%s)\n", yytext); strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    { printf("Token: ICONST (%s)\n", yytext); yylval.int_val=atoi(yytext); return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
