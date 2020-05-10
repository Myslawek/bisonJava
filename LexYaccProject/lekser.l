%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"

	void SetInputFile(const char* strFileName);
	void CloseInputFile();

	FILE* pInputFile = NULL;
%}

NATURAL [0]|[1-9][0-9]*
INTEGER "-"?{NATURAL}
DOUBLE  {INTEGER}"."[0]*{NATURAL}
PRIMITIVE "int"|"boolean"|"double"|"long"|"char"|"byte"|"short"|"float"
VOID "void"
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
ASSIGN "="
VARIABLE [a-zA-Z][a-zA-Z0-9]*
CHAR_SEQUENCE "\""[a-zA-Z0-9]*"\""
WHITE_SYMBOL " "|\t|\n

%%
{INTEGER}   { return INTEGER; }
{DOUBLE}    { return DOUBLE; }
{PRIMITIVE} { return PRIMITIVE; }
{VOID} { return VOID; }
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
{ASSIGN} { return ASSIGN; };
{CHAR_SEQUENCE} { return CHAR_SEQUENCE; }
{VARIABLE} { return VARIABLE; }
{WHITE_SYMBOL} { return WHITE_SYMBOL; }
. { printf("none\n"); return ERROR; };
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