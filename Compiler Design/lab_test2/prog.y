%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
  #include "symtab.c"
	int yyerror(const char *s);
	extern int lineno;
	extern int yylex();
%}

%union {
    char str_val[100];
    int int_val;
}

%token INT DOUBLE CHAR LET  STREQUOP 
%token FOR TO DO END
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID 
%token ICONST FCONST CCONST SCONST

%type<int_val> type constant exp

%left LT GT STREQUOP 
%left ADDOP 
%left MULOP

%start code

%%
code: statements;

statements: statements statement 
          | 
          ;

statement: declaration
         | for_statement
         | ID ASSIGN exp SEMI
           {
             if(idcheck($1)==0)
             {
               yyerror("Undefined identifier");
             } 
             else
             {
               if(typecheck(gettype($1), $3)==0)
                 yyerror("Type mismatch in assignment");
             }
           } 
         ;

declaration: type ID SEMI
             {
               insert($2, $1);
             } 
           | type ID ASSIGN exp SEMI
             {
               insert($2, $1);
               if(typecheck(gettype($2), $4)==0)
                 yyerror("Type mismatch in declaration");
             }
           ;

type: INT { $$ = INT_TYPE; }
    | DOUBLE { $$ = REAL_TYPE; }
    | CHAR  { $$ = CHAR_TYPE; }
    ;

exp: constant { $$ = $1; }
   | ID  
     {
       if(idcheck($1)==0)
       {
         yyerror("Undefined identifier");
       } 
       else
       {
         $$ = gettype($1); 
       }  
     }  
   | exp ADDOP exp
     {
       if(typecheck($1, $3)==0)
         yyerror("Type mismatch in addition");
       else
         $$ = typecheck($1, $3);
     }
    | exp ASSIGN exp
    {
      if(typecheck($1, $3)==0) 
         yyerror("Type mismatch in assignment");
       else
         $$ = typecheck($1, $3);
    }
   ;

constant: ICONST { $$ = INT_TYPE; }
        | FCONST { $$ = REAL_TYPE; }
        | CCONST { $$ = CHAR_TYPE; }
        | SCONST { $$ = CHAR_TYPE; }
        ;


for_statement: FOR ID ASSIGN constant TO constant DO exp SEMI END FOR
                {
                    if(typecheck(INT_TYPE, $4)==0)
                      yyerror("Invalid start value type in for loop");
                    if(typecheck(CHAR_TYPE, $6)==0)
                      yyerror("Invalid end value type in for loop");
                      if(typecheck($4, $6)==0) 
                      yyerror("Type mismatch between start and end values in for loop");
                }
             ;

%%

int yyerror(const char *s)
{
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}

int main(int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");    
    return 0;
}