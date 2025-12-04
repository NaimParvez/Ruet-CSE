%option noyywrap

%{
#include "parser.tab.h"
int lineno = 1;
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
STRING    \"{print}*\"
%%

"//".*     { } 

"int"      { printf("INT: %s\n", yytext); return INT; }
"double"   { printf("DOUBLE: %s\n", yytext); return DOUBLE; }
"char"	   { printf("CHAR: %s\n", yytext); return CHAR; }

"if"	   { printf("IF: %s\n", yytext); return IF; }
"else"	   { printf("ELSE: %s\n", yytext); return ELSE; }
"while"    { printf("WHILE: %s\n", yytext); return WHILE; }
"for"      { printf("FOR: %s\n", yytext); return FOR; }
"continue" { printf("CONTINUE: %s\n", yytext); return CONTINUE; }
"break"    { printf("BREAK: %s\n", yytext); return BREAK; }
"void"     { printf("VOID: %s\n", yytext); return VOID; }
"return"   { printf("RETURN: %s\n", yytext); return RETURN; }
"printf"   { printf("PRINTF: %s\n", yytext); return PRINTF; }

"+"        { printf("ADDOP: %s\n", yytext); return ADDOP; }
"-"        { printf("SUBOP: %s\n", yytext); return SUBOP; }
"*"        { printf("MULOP: %s\n", yytext); return MULOP; }
"/"        { printf("DIVOP: %s\n", yytext); return DIVOP; }
"++"       { printf("INCR: %s\n", yytext); return INCR; }
"--"       { printf("DECR: %s\n", yytext); return DECR; }
"||"       { printf("OROP: %s\n", yytext); return OROP; }
"&&"       { printf("ANDOP: %s\n", yytext); return ANDOP; }
"!"        { printf("NOTOP: %s\n", yytext); return NOTOP; }
"=="       { printf("EQUOP: %s\n", yytext); return EQUOP; }
"!="       { printf("NEQUOP: %s\n", yytext); return NEQUOP; }
">="       { printf("GTEQ: %s\n", yytext); return GTEQ; }
">"        { printf("GT: %s\n", yytext); return GT; }
"<="       { printf("LTEQ: %s\n", yytext); return LTEQ; }
"<"        { printf("LT: %s\n", yytext); return LT; }

"("        { printf("LPAREN: %s\n", yytext); return LPAREN; }
")"        { printf("RPAREN: %s\n", yytext); return RPAREN; }
"{"        { printf("LBRACE: %s\n", yytext); return LBRACE; }
"}"        { printf("RBRACE: %s\n", yytext); return RBRACE; }
";"        { printf("SEMI: %s\n", yytext); return SEMI; }
","        { printf("COMMA: %s\n", yytext); return COMMA; }
"="        { printf("ASSIGN: %s\n", yytext); return ASSIGN; }

{ID}       { printf("ID: %s\n", yytext); return ID; }
{ICONST}   { printf("ICONST: %s\n", yytext); return ICONST; }
{FCONST}   { printf("FCONST: %s\n", yytext); return FCONST; }
{CCONST}   { printf("CCONST: %s\n", yytext); return CCONST; }
{STRING}   { printf("STRING: %s\n", yytext); return STRING; }

"\n"        { lineno += 1; }
[ \t\r\f]+  { /* Ignore whitespace */ }

.           { printf("Unrecognized character"); }
%%

// int main(){
//     yylex();
//     return 0;
// }