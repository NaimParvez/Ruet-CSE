%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "prog.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror(const char *s);
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*             
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
SCONST    \"[ -~]*\"
%%

"//".*        { } 

"int"       { return INT; }
"double"    { return DOUBLE; }
"float"     { return DOUBLE; } 
"char"      { return CHAR; }     
"let"       { return LET; }
"FOR"       { return FOR; }
"TO"        { return TO; }
"DO"        { return DO; }
"END"       { return END; }

"+"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }

">"       { return GT; }
"<"       { return LT; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
"="       { return ASSIGN; }

{ID}        { strcpy(yylval.str_val, yytext); return ID; }
{ICONST}    { return ICONST; }
{FCONST}    { return FCONST; }
{CCONST}    { return CCONST; }
{SCONST}	{ strcpy(yylval.str_val, yytext); return SCONST; }

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }

%%