%option noyywrap
%{
  #include "prog.tab.h"  
%}
delim [ \t\n]
ws {delim}+
digit [0-9]
number {digit}+
letter [A-Za-z]
us [_]
id ({us}|{letter})({us}|{letter}|{digit})*

%%
{ws} {}
{number} {yylval = atoi(yytext); return (NUM);}
"+" {return (ADD);}
"-" {return (SUB);}
"*" {return (MULT);}
"if" {return (IF);}
"while" {return (WHILE);}
{id} {return (ID);}
"=" {return (ASSIGN);}
"==" {return (EQUAL);}
">" {return (GT);}
"(" {return (LP);}
")" {return (RP);}
"{" {return (LB);}
"}" {return (RB);}
";" {return (SEMI);}
%%
