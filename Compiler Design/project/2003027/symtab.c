#include "symtab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

list_t *head = NULL;
extern int lineno; 
int address = 0;

void insert(char* name, int type)
{
    if(search(name)==NULL)
    {
        list_t* temp = (list_t*)malloc(sizeof(list_t));

        strcpy(temp->st_name, name);
        temp->st_type = type;

        printf("In line no %d, Inserting %s with type %s in symbol table at address %d.\n", 
               lineno, name, typename[type], address);

        address++;

        temp->next = head;
        head = temp;
    }
    else
    {
        printf("In line no %d, Same variable %s is declared more than once.\n", lineno, name);
    }
}

list_t* search(char *name)
{
    list_t* current = head;
    int addr = address - 1;

    while(current!=NULL)
    {
       if(strcmp(name, current->st_name)!=0)
       {
            current = current->next;
            addr--;
       }
       else
            break;
    }

    return current;
}

int idcheck(char* name)
{
    list_t* current = head;
    int addr = address - 1;

    while(current!=NULL)
    {
       if(strcmp(name, current->st_name)!=0)
       {
            current = current->next;
            addr--;
       }
       else
            return addr;
    }

    printf("In line no %d, ID %s is not declared.\n", lineno, name);
    return -1;
}

int gettype(char *name)
{
    list_t* temp = search(name);

    if(temp==NULL)
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return UNDEF_TYPE;
    }
    else
        return temp->st_type;
}
