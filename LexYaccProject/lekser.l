%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"

	void SetInputFile(const char* strFileName);
	void CloseInputFile();

	FILE* pInputFile = NULL;
%}

INTEGER [0]|[1-9][0-9]*
DOUBLE  {INTEGER}"."[0]*{INTEGER}
PRIMITIVE "int"|"boolean"|"double"|"long"|"char"|"byte"|"short"|"float"
VOID "void"
CHAR_SEQUENCE [a-zA-Z0-9]*
STRING "String"
ACCESS_MODIFIER "public"|"private"|"protected"
STRUCTURE "class"|"interface"|"enum"
CONTROL_FLOW "for"|"while"|"if"|"else"
NEW "new"
BOOLEAN_LIT "true"|"false"
NULL "null"
ARGS_MATH_OP "+"|"-"|"*"|"/"|"+="|"-="|"*="|"/="
ARG_MATH_OP "++"|"--"
LOGICAL_OP "&&"|"\|\|"|">"|"=="|"<"|"=>"|"=<"|"!="|"!"
OPEN_BLOCK "{"
CLOSE_BLOCK "}"
OPEN_SQUARE "["
CLOSE_SQUARE "]"
OPEN_ROUND "("
CLOSE_ROUND ")"
MAIN_METHOD "public static void main(String"("..."|"[]")[a-zA-Z]+[a-zA-Z0-9]*")"
DOT "."
COMMA ","
SEMICOLON ";"
RETURN "return"
VARIABLE [a-zA-Z][a-zA-Z0-9]*
ASSIGN "="
WHITE_SYMBOL " "|\t|\n

%%
{INTEGER}   { yylval=atoi(yytext); return INTEGER; }
{DOUBLE}    { yylval=atoi(yytext); return DOUBLE; }
{PRIMITIVE} { return PRIMITIVE; }
{VOID} { return VOID; }
{CHAR_SEQUENCE} { return CHAR_SEQUENCE; }
{STRING} { return STRING; }
{ACCESS_MODIFIER} { return ACCESS_MODIFIER; }
{STRUCTURE} { return STRUCTURE; }
{CONTROL_FLOW} { return CONTROL_FLOW; }
{NEW} { return NEW; }
{BOOLEAN_LIT} { return BOOLEAN_LIT; }
{NULL} { return _NULL; }
{ARG_MATH_OP} { return ARG_MATH_OP; }
{ARGS_MATH_OP} { return ARGS_MATH_OP; }
{LOGICAL_OP} { return LOGICAL_OP; }
{OPEN_BLOCK} { return OPEN_BLOCK; }
{CLOSE_BLOCK} { return CLOSE_BLOCK; }
{OPEN_SQUARE} { return OPEN_SQUARE; }
{CLOSE_SQUARE} { return CLOSE_SQUARE; }
{OPEN_ROUND} { return OPEN_ROUND; }
{CLOSE_ROUND} { return CLOSE_ROUND; }
{MAIN_METHOD} { return MAIN_METHOD; }
{DOT} { return DOT; }
{COMMA} { return COMMA; }
{SEMICOLON} { return SEMICOLON; }
{RETURN} { return RETURN; }
{VARIABLE} { return VARIABLE; }
{ASSIGN} { return ASSIGN; };
{WHITE_SYMBOL} { return WHITE_SYMBOL; }
. { return ERROR; };
%%

void SetInputFile(const char* strFileName){
	if(strFileName){
		pInputFile = fopen(strFileName, "r");
		yyin = pInputFile;
	}
}

void CloseInputFile(){
	if(pInputFile){
		fclose(pInputFile);
		pInputFile = NULL;
	}
}