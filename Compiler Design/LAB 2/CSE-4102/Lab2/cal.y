%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}
%token NUM ADD SUB MULT 
%start cal
%left ADD SUB
%left MULT
%%
cal: exp {$$ = $1; printf("=%d\n", $$);}
   ;

exp: exp ADD NUM {$$ = $1 + $3; printf("exp ADD NUM =%d\n", $$); }
    | exp SUB NUM {$$ = $1 - $3;  printf("exp SUB NUM =%d\n", $$);}
    | exp MULT NUM {$$ = $1 * $3;  printf("exp MULT NUM =%d\n", $$);}
    | NUM {$$ = $1;  printf("NUM =%d\n", $$); }
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
