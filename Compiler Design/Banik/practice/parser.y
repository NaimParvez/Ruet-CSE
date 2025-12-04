%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../symtab.c"

int yyerror(const char *s);
extern int lineno;
extern int yylex();
%}

%union{
    int int_val;
    float float_val;
    char str_val[124];
}

%token INT INTEGER FLOAT 
%token INPUT PRINT RETURN IF ELIF ELSE COLON COMMA SEMI MOD DIM AS FOR TO NEXT FUNC BEG END
%token LP RP GT LT EQU ASSIGN
%token PLUS MINUS MUL DIV
%token<str_val> ID STRING
%token<int_val> INT_NUM
%token<float_val> FLOAT_NUM

%type<int_val> TYPE VALUE USE_INPUT
%type<int_val> EXP TERM FACTOR 


%start STATEMENTS

%%
// statements
STATEMENTS: STATEMENTS STATEMENT | ;

STATEMENT: DECLARATION
          | ASSIGNMENT
          | CONDITION
          | PRINT_STATEMENT
          | LOOP
          | FUNCTION
          ;

// expression
EXP: EXP GT TERM { $$ = INT_TYPE; }
    | EXP LT TERM { $$ = INT_TYPE; }
    | EXP EQU TERM { $$ = INT_TYPE; }
    | EXP MOD TERM { $$ = INT_TYPE; }
    | EXP PLUS TERM { $$ = typecheck($1, $3); }
    | EXP MINUS TERM { $$ = typecheck($1, $3); }
    | TERM { $$ = $1; }
    ;
    
TERM: TERM MUL FACTOR 
    { 
        if(typecheck($1, $3) == 0){
            printf("error"); 
            $$ = 0;
        }
        else { 
            $$ = typecheck($1, $3); 
        }
    }
    | TERM DIV FACTOR 
    { 
        if(typecheck($1, $3) == 0){
            printf("error"); 
            $$ = 0;
        }
        else { 
            $$ = typecheck($1, $3); 
        }
    }
    | FACTOR { $$ = $1; }
    ;

FACTOR: LP EXP RP { $$ = $2; }
        | ID { $$ = gettype($1); }
        | INT_NUM { $$ = INT_TYPE; }
        | FLOAT_NUM { $$ = FLOAT_TYPE; }
        ;

// condition
CONDITION: IF EXP COLON STATEMENTS ELIF_STATEMENT ELSE_STATEMENT
ELIF_STATEMENT: ELIF_STATEMENT ELIF EXP COLON STATEMENTS | ;
ELSE_STATEMENT: ELSE COLON STATEMENTS | ;

// assignment
ASSIGNMENT: ID ASSIGN VALUE { if(idcheck($1)) printf("id is used"); if(!typecheck(gettype($1), $3)) printf("Error"); };
VALUE: EXP { $$ = $1; }
     | USE_INPUT { $$ = INT_TYPE; }
     ;

// declaration
DECLARATION: DIM ID AS TYPE { if(idcheck($2)){ printf("Id is used"); } insert($2, $4); }
            | TYPE ID ASSIGN VALUE { insert($2, $1);}
            ;
TYPE: INT { $$ = INT_TYPE; }
    | FLOAT { $$ = FLOAT_TYPE; }
    | INTEGER { $$ = INT_TYPE; }
    ;

// input statement
USE_INPUT: INPUT LP STRING RP { $$ = STRING_TYPE; };

// print statement
PRINT_STATEMENT: PRINT LP STRING RP ;

// for loop
LOOP: FOR ID ASSIGN INT_NUM TO INT_NUM STATEMENTS NEXT ID { if(idcheck($2) == 1){ printf("ID is already present\n"); }};

// function
FUNCTION: FUNC ID LP ARGUMENT RP BEG RSTATEMENT END ;
ARGUMENT: ARGS | ;
ARGS: ARGS COMMA ARG | ARG ;
ARG: ID COLON TYPE ;
RSTATEMENT: STATEMENTS RETURN_STATEMENT;
RETURN_STATEMENT: RETURN EXP SEMI | ASSIGNMENT SEMI | ;
%%

int yyerror(const char *s) {
    printf("Error: %s at line %d\n", s, lineno);
    return 0;
}

int main (int argc, char *argv[]){
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
