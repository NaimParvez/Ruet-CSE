#define UNDEF_TYPE 0
#define INT_TYPE 1
#define DOUBLE_TYPE 2

char *typename[] = {"UNDEF_TYPE", "INT_TYPE", "DOUBLE_TYPE"};

typedef struct list_t
{
    char st_name[40];
    int st_type;

    struct list_t *next;    
}list_t;

void insert(char* name, int type);
list_t* search(char *name);
int idcheck(char* name);
int gettype(char *name);
int typecheck(int type1, int type2);