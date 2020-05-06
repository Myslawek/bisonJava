%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"
%}
INTEGER [0]|[1-9][0-9]*
OPERATION "+"|"-"|"*"|"\"
DOUBLE  {INTEGER}"."[0]*{INTEGER}
OPEN_BLOCK "{"
CLOSE_BLOCK "}"
VARIABLE [a-zA-Z]([a-z]*|[A-Z]*|[0-9]
STRUCTURE "class"|"interface"
PRIMITIVES "int"|"float"|"double"|"char"|"boolean"
ASSIGN "="
IMPORT "static "?"import "[ab]+


%%
{INTEGER}   { yylval=atoi(yytext); return INTEGER; }
{DOUBLE}    { yylval=atoi(yytext); return DOUBLE; }
{OPERATION} { }
;

"+"     return yytext[0];
"-"     return yytext[0];
"*"     return yytext[0];
"/"     return yytext[0];
.       ;
[\n]    return ENDL;
%%