%{
#include "compiler.tab.h"
#include <stdio.h>
#include <string.h>
%}

%%

"University"    { printf("University -> UNIVERSITY_NAME\n"); return UNIVERSITY; }
"of"            { return OF; }

"Dhaka"         { return DHAKA; }
"Rajshahi"      { return RAJSHAHI; }
"Chittagong"    { return CHITTAGONG; }

\n              { return NEWLINE; }
[ \t]           { /* skip whitespace */ }

.               { /* ignore anything else */ }

%%

int yywrap(void) { return 1; }
