#define UNDEF_TYPE 0
#define INT_TYPE 1
#define FLOAT_TYPE 2
#define STRING_TYPE 3

char *typename[] = {"UNDEF_TYPE", "INT_TYPE", "FLOAT_TYPE", "STRING_TYPE"};

typedef struct list_t{
    char st_name[124];
    int st_type;

    struct list_t *next;    
} symbol_tab;

void insert(char* name, int type);
symbol_tab* search(char *name);
int idcheck(char* name);
int gettype(char *name);
int typecheck(int type1, int type2);