%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
	void yyerror(char *s);
	int yylex();
	extern FILE* yyin;
%}
%token DOUBLE
%token INTEGER
%token ENDL
%%
program: program wyrazenie ENDL { printf("= %d \n",$2); }
|
;

wyrazenie: INTEGER { $$ = $1; }
| wyrazenie '+' wyrazenie { $$ =  $1 + $3}
| wyrazenie '-' wyrazenie { $$ =  $1 - $3}
| wyrazenie '*' wyrazenie { $$ =  $1 * $3}
| wyrazenie '/' wyrazenie { if($3!=0) $$ =  $1 / $3; else yyerror("Dzielenie przez 0"); } 
;
%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() 
{
    yyparse();    
    return 0;
}