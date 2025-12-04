%{
#include<stdio.h>
void yyerror(char *s);
int yylex();

%}
%token NUM ADD SUB IF ELSE WHILE ID LP RP LB RB EQUAL ASSIGN SEMI INT

%right ASSIGN
%left EQUAL
%left ADD SUB
%nonassoc IFX
%nonassoc ELSE

%start program

%%
program: statements
       ;

statements: statements statement
          | statement
          |
          ;
           
statement: if_statement
         | while_statement
         | declaration
         | assignment
         ;

if_statement: IF LP expression RP LB statements RB ELSE LB statements RB
            | IF LP expression RP LB statements RB %prec IFX
            ;

while_statement: WHILE LP expression RP LB statements RB
               ;

expression: expression EQUAL expression
          | expression ADD expression
          | expression SUB expression
          | ID
          | NUM
          | LP expression RP
          ;

declaration: INT ID ASSIGN expression SEMI
           | INT ID SEMI
           ;
           
assignment: ID ASSIGN expression SEMI
          ;
           
%%


int main(){

    yyparse();
    printf("Parsing Finished\n");
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}