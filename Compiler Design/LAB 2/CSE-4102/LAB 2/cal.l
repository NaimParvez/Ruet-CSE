%option noyywrap
%{
#include "cal.tab.h"
%}
delim [ \t]
ws {delim}+
digit [0-9]
letter [A-Za-z]
number ({digit}+)
id ({letter})({letter}|{digit})*

%%
{ws} {}
{id} {return ID;}
{number} {return NUM;}
"+" {return ADD;}
"-" {return SUB;}
"*" {return MULT;}
"=" {return EQ;}

%%