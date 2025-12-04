%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    int yyerror(char *s);
    extern int lineno;
    extern int yylex();
%}

%union{
    char str_val[100];
    int int_val;
}

%token CHAR INT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN PRINTF
%token ADDOP SUBOP MULOP DIVOP INCR DECR OROP ANDOP NOTOP EQUOP NEQUOP GTEQ GT LTEQ LT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA
%token ID
%token ICONST
%token FCONST
%token CCONST
%token STRING

%right ASSIGN
%left OROP
%left ANDOP
%left EQUOP NEQUOP
%left GTEQ GT LTEQ LT
%left ADDOP SUBOP
%left MULOP DIVOP
%right NOTOP INCR DECR
%left LPAREN RPAREN

%start code

%%
code: code function | code declaration SEMI | ;

/* statements */
statements: statements statement | ;
statement:  declaration SEMI
            | if_statement
            | for_statement
            | while_statement 
            | assignment SEMI
            | function_call SEMI
            | PRINTF LPAREN STRING RPAREN SEMI
            | ID INCR SEMI 
            | INCR ID SEMI
            | ID DECR SEMI 
            | DECR ID SEMI
            | RETURN expression SEMI
            ;

/* function */
function: type ID LPAREN parameters RPAREN LBRACE statements RBRACE;
parameters: params | /* empty */ ;
params: params COMMA type ID
    | type ID
    ;

/* declaration */
declaration: type variables ;
variables: variables COMMA ID | variables COMMA ID ASSIGN expression | ID | ID ASSIGN expression ;
type: INT | CHAR | DOUBLE | VOID ;

/* if statement */
if_statement: IF LPAREN expression RPAREN LBRACE statements RBRACE
            | IF LPAREN expression RPAREN LBRACE statements RBRACE else_if
            | IF LPAREN expression RPAREN LBRACE statements RBRACE else_if ELSE LBRACE statements RBRACE
            | IF LPAREN expression RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE
            ;

else_if: else_if ELSE IF LPAREN expression RPAREN LBRACE statements RBRACE
        | ELSE IF LPAREN expression RPAREN LBRACE statements RBRACE
        ;

/* for statement */
for_statement: FOR LPAREN initalization SEMI condition SEMI increments RPAREN LBRACE statements RBRACE;
initalization: declaration | assignments | /* empty */ ;
assignments: assignments COMMA assignment | assignment;
condition: expression | /* empty */ ;
increments: increments COMMA increment | increment;
increment: ID INCR | INCR ID | ID DECR | DECR ID;

/* while statement */
while_statement: WHILE LPAREN expression RPAREN LBRACE statements RBRACE ;

/* assignment */
assignment: ID ASSIGN expression;

/* function call */
function_call: ID LPAREN arguments RPAREN ;
arguments: arguments args | /* empty */ ;
args: args COMMA expression | args COMMA STRING | expression | STRING ;

/* expression */
expression: expression OROP exp
    | expression ANDOP exp
    | expression EQUOP exp
    | expression NEQUOP exp
    | expression GTEQ exp
    | expression GT exp
    | expression LTEQ exp
    | expression LT exp
    | exp
    ;

exp : exp ADDOP term
    | exp SUBOP term
    | term
    ;
term: term MULOP factor
    | term DIVOP factor
    | factor
    ;
factor: ID INCR
       | ID DECR
       | INCR ID
       | DECR ID
       | ID
       | ICONST
       | FCONST
       | CCONST
       | LPAREN exp RPAREN
       | NOTOP factor
       ;
%%

int yyerror (char *s){
	printf("Error: %s at line %d\n", s, lineno);
	exit(1);
}

int main (int argc, char *argv[]){
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
