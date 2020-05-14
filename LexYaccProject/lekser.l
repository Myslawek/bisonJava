%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"

	void SetInputFile(const char* strFileName);
	void CloseInputFile();

	FILE* pInputFile = NULL;
%}

IMPORT "import"
END_OF_IMPORT ".*"
NATURAL_NUMBER [0]|[1-9][0-9]*
WHOLE_NUMBER "-"?{NATURAL_NUMBER}
REAL_NUMBER  {WHOLE_NUMBER}"."[0]*{NATURAL_NUMBER}
WHOLE_NUM_PRIMITIVE "byte"|"char"|"short"|"int"|"long"
REAL_NUM_PRIMITIVE "float"|"double"
BOOLEAN "boolean"
VOID "void"
STRING "String"
ACCESS_MODIFIER "public"|"private"|"protected"
STATIC "static"
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
MAIN_METHOD "public"{WHITE_SYMBOL}+{STATIC}{WHITE_SYMBOL}+{VOID}{WHITE_SYMBOL}+"main("{STRING}("..."|"[]"){WHITE_SYMBOL}+{VARIABLE}")"
DOT "."
COMMA ","
SEMICOLON ";"
RETURN "return"
ASSIGN "="
PACKAGE "package"
VARIABLE [a-zA-Z][a-zA-Z0-9]*
CHAR_SEQUENCE "\""[a-zA-Z0-9]*"\""
WHITE_SYMBOL " "|\t|\n

%%
{WHOLE_NUMBER}   { return WHOLE_NUMBER; }
{REAL_NUMBER}    { return REAL_NUMBER; }
{WHOLE_NUM_PRIMITIVE} { return WHOLE_NUM_PRIMITIVE; } 
{REAL_NUM_PRIMITIVE}  { return REAL_NUM_PRIMITIVE; }
{BOOLEAN} { return BOOLEAN; }
{VOID} { return VOID; }
{STRING} { return STRING; }
{STATIC} { return STATIC; }
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
{ASSIGN} { return ASSIGN; }
{PACKAGE} { return PACKAGE; }
{CHAR_SEQUENCE} { return CHAR_SEQUENCE; }
{IMPORT} { return IMPORT; }
{END_OF_IMPORT} {return END_OF_IMPORT; }
{VARIABLE} { return VARIABLE; }
{WHITE_SYMBOL} { return WHITE_SYMBOL; }
. { printf("Nieobslugiwany token\n"); return ERROR; };
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