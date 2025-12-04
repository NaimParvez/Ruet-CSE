%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}
%token NUM ADD SUB MULT GT ID LP RP LB RB WHILE IF SEMI ASSIGN EQUAL
%start prog
%left ADD SUB
%left MULT
%%
prog: statements
      ;

statements : statements statement 
           | 
           ;
 statement : if_statement
            | id_assign
            | while_statement
            ;

while_statement: WHILE LP exp RP LB statements RB            
if_statement: IF LP exp RP LB statements RB
            ;       
exp: ID EQUAL NUM
    | ID GT NUM
    ;  

id_assign : ID ASSIGN NUM SEMI
           ;    

%%

int main(){
    yyparse();
    printf("Parshing Finished\n");
    return 0;
}
 void yyerror(char *s){
     fprintf(stderr,"Error:%s\n",s);
 }
