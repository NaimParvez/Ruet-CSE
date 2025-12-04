#include "symtab.h"
#include <stdio.h>

symbol_tab *head = NULL;
extern int lineno; 

void insert(char* name, int type){
    if(search(name) == NULL){
        symbol_tab* temp = (symbol_tab*)malloc(sizeof(symbol_tab));

        strcpy(temp->st_name, name);
        temp->st_type = type;

        printf("In line no %d, Inserting %s with type %s in symbol table.\n", lineno, name, typename[type]);

        temp->next = head;
        head = temp;
    }
    else{
        printf("In line no %d, Same variable %s is declared more than once.\n", lineno, name);
    }
}

symbol_tab* search(char *name){
    symbol_tab* current = head;

    while(current != NULL){
        if(strcmp(name, current->st_name) != 0)
            current = current->next;
        else break;
    }

    return current;
}

int idcheck(char* name){
    if(search(name) == NULL){
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return 0;
    }
    else return 1;
}

int gettype(char *name){
    symbol_tab* temp = search(name);

    if(temp == NULL){
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return UNDEF_TYPE;
    }
    else
        return temp->st_type;
}

int typecheck(int type1, int type2){
    if(type1 == INT_TYPE && type2 == INT_TYPE)
        return INT_TYPE;
    else if (type1 == FLOAT_TYPE && type2 == FLOAT_TYPE)
        return FLOAT_TYPE;
    else if (type1 == STRING_TYPE && type2 == STRING_TYPE)
        return STRING_TYPE;
    else{
        if (type1 > 3 || type1 < 0) type1 = 0;
        if (type2 > 3 || type2 < 0) type2 = 0;

        printf("In line no %d, Data type %s is not matched with Data type %s.\n", lineno, typename[type1], typename[type2]);
        return UNDEF_TYPE;
    }
}