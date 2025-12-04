%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.c"

void yyerror(char *s);
extern int lineno;
extern int yylex();
int error_count = 0;
%}

%union{
    char str_val[100];
    int int_val;
}

%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token LET AS BEGINN ENDD STOP
%token EQUOP 
%token LPAREN RPAREN SEMI
%token<str_val> ID
%token ICONST

%type<int_val> type constant exp

%left EQUOP
%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has highest precedence*/

%start code

%%

code: statements
    ;

statements: statements statement 
    | 
    ;

statement: let_declaration
    | if_statement
    | begin_block
    | STOP SEMI
    ;



let_declaration: LET ID AS type SEMI
    {
        insert($2, $4);
    }
    ;

begin_block: BEGINN statements ENDD
    ;



type: DOUBLE 
    {
        $$ = DOUBLE_TYPE;
    }
    ;

exp: constant
    {
        $$ = $1;
    }
    | ID
    {
        if(idcheck($1)==0)
        {
            error_count++;
            $$ = UNDEF_TYPE;
        }
        else
        {
            $$ = gettype($1);
        }
    }
    | exp EQUOP exp
    {
        if(typecheck($1, $3)==0)
        {
            error_count++;
        }
        $$ = INT_TYPE;
    }
    | LPAREN exp RPAREN
    {
        $$ = $2;
    }
    ;

constant: ICONST 
    {
        $$ = INT_TYPE;
    }
    ;

if_statement: IF LPAREN exp RPAREN statement
    ;

%%

void yyerror(char *s)
{
    printf("Syntax error at line %d: %s\n", lineno, s);
    error_count++;
}

int main(int argc, char *argv[])
{
    yyparse();
    
    if(error_count == 0)
    {
        printf("\nParsing finished successfully with no errors!\n");
    }
    else
    {
        printf("\nParsing finished with %d error(s).\n", error_count);
    }
    
    return 0;
}