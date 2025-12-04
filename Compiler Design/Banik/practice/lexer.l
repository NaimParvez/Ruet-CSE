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
INT_NUM   {digit}+
FLOAT_NUM {digit}+"."{digit}*([eE][+-]?{digit}+)?
STRING    \"{print}*\"
%%
"//".*        { }

int { printf("INT: %s\n", yytext); return INT; }
integer { printf("INTEGER: %s\n", yytext); return INTEGER; }
float { printf("FLOAT: %s\n", yytext); return FLOAT; }

input { printf("INPUT: %s\n", yytext); return INPUT; }
print { printf("PRINT: %s\n", yytext); return PRINT; }
return { printf("RETURN: %s\n", yytext); return RETURN; }

"+" { printf("PLUS: %s\n", yytext); return PLUS; }
"-" { printf("MINUS: %s\n", yytext); return MINUS; }
"*" { printf("MUL: %s\n", yytext); return MUL; }
"/" { printf("DIV: %s\n", yytext); return DIV; }

"(" { printf("LP: %s\n", yytext); return LP; }
")" { printf("RP: %s\n", yytext); return RP; }

if { printf("IF: %s\n", yytext); return IF; }
elif { printf("ELIF: %s\n", yytext); return ELIF; }
else { printf("ELSE: %s\n", yytext); return ELSE; }

"=" { printf("ASSIGN: %s\n", yytext); return ASSIGN; }
">" { printf("GT: %s\n", yytext); return GT; }
"<" { printf("LT: %s\n", yytext); return LT; }
"==" { printf("EQU: %s\n", yytext); return EQU; }
":" { printf("COLON: %s\n", yytext); return COLON; }
"%" { printf("MOD: %s\n", yytext); return MOD; }
"," { printf("COMMA: %s\n", yytext); return COMMA; }
";" { printf("SEMI: %s\n", yytext); return SEMI; }

dim { printf("DIM: %s\n", yytext); return DIM; }
as	{ printf("AS: %s\n", yytext);return AS; }
For	{ printf("FOR: %s\n", yytext); return FOR; }
To { printf("TO: %s\n", yytext); return TO; }
Next { printf("NEXT: %s\n", yytext); return NEXT; }
function { printf("FUNC: %s\n", yytext); return FUNC; }
begin { printf("BEGIN: %s\n", yytext); return BEG; }
end { printf("END: %s\n", yytext); return END; }

{ID} { printf("ID: %s\n", yytext); strcpy(yylval.str_val, yytext); return ID; }
{INT_NUM} { printf("INT_NUM: %s\n", yytext); yylval.int_val = atoi(yytext); return INT_NUM; }
{FLOAT_NUM} { printf("FLOAT_NUM: %s\n", yytext); yylval.float_val = atof(yytext); return FLOAT_NUM; }
{STRING} { printf("STRING: %s\n", yytext); strcpy(yylval.str_val, yytext); return STRING; }

"\n"        { lineno += 1; }
[ \t\r\f]+  { /* ignore whitespace */ }
.       { printf("Unrecognized character: %s\n", yytext); }
%%