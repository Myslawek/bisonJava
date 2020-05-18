%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"

	void SetInputFile(const char* strFileName);
	void CloseInputFile();

	FILE* pInputFile = NULL;
%}

IMPORT "import"
DOT_STAR ".*"
NATURAL_NUMBER [0]|[1-9][0-9]*
WHOLE_NUMBER "-"?{NATURAL_NUMBER}
REAL_NUMBER  {WHOLE_NUMBER}"."[0]*{NATURAL_NUMBER}
WHOLE_NUM_PRIMITIVE "byte"|"char"|"short"|"int"|"long"
REAL_NUM_PRIMITIVE "float"|"double"
BOOLEAN_PRIMITIVE "boolean"
VOID "void"
STRING "String"
ACCESS_MODIFIER "public"|"private"|"protected"
STATIC "static"
STRUCTURE "interface"|"enum"
CLASS "class"
IF_COND "if"
ELSE_IF_COND "else if"
ELSE_COND "else"
FOR_LOOP "for"
WHILE_LOOP "while"
NEW "new"
BOOLEAN_VAL "true"|"false"
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
{WHOLE_NUMBER}   { printf("WHOLE_NUMBER\n"); return WHOLE_NUMBER; }
{REAL_NUMBER}    { printf("REAL_NUMBER\n"); return REAL_NUMBER; }
{WHOLE_NUM_PRIMITIVE} { printf("WHOLE_NUM_PRIMITIVE\n"); return WHOLE_NUM_PRIMITIVE; } 
{REAL_NUM_PRIMITIVE}  { printf("REAL_NUM_PRIMITIVE\n"); return REAL_NUM_PRIMITIVE; }
{BOOLEAN_PRIMITIVE} { printf("BOOLEAN_PRIMITIVE\n"); return BOOLEAN_PRIMITIVE; }
{VOID} { printf("VOID\n"); return VOID; }
{STRING} { printf("STRING\n"); return STRING; }
{STATIC} { printf("STATIC\n"); return STATIC; }
{ACCESS_MODIFIER} { printf("ACCESS_MODIFIER\n"); return ACCESS_MODIFIER; }
{STRUCTURE} { printf("STRUCTURE\n"); return STRUCTURE; }
{IF_COND} { printf("IF_COND\n"); return IF_COND; }
{ELSE_IF_COND} { printf("ELSE_IF_COND\n"); return ELSE_IF_COND; }
{ELSE_COND} { printf("ELSE_COND\n"); return ELSE_COND; }
{FOR_LOOP} { printf("FOR_LOOP\n"); return FOR_LOOP; }
{WHILE_LOOP} { printf("WHILE_LOOP\n"); return WHILE_LOOP; }
{NEW} { printf("NEW\n"); return NEW; }
{BOOLEAN_VAL} { printf("BOOLEAN_VAL\n"); return BOOLEAN_VAL; }
{NULL} { printf("NULL\n"); return _NULL; }
{ARG_MATH_OP} { printf("ARG_MATH_OP\n"); return ARG_MATH_OP; }
{ARGS_MATH_OP} { printf("ARGS_MATH_OP\n"); return ARGS_MATH_OP; }
{LOGICAL_OP} { printf("LOGICAL_OP\n"); return LOGICAL_OP; }
{OPEN_BLOCK} { printf("OPEN_BLOCK\n"); return OPEN_BLOCK; }
{CLOSE_BLOCK} { printf("CLOSE_BLOCK\n"); return CLOSE_BLOCK; }
{OPEN_SQUARE} { printf("OPEN_SQUARE\n"); return OPEN_SQUARE; }
{CLOSE_SQUARE} { printf("CLOSE_SQUARE\n"); return CLOSE_SQUARE; }
{OPEN_ROUND} { printf("OPEN_ROUND\n"); return OPEN_ROUND; }
{CLOSE_ROUND} { printf("CLOSE_ROUND\n"); return CLOSE_ROUND; }
{MAIN_METHOD} { printf("MAIN_METHOD\n"); return MAIN_METHOD; }
{DOT} { printf("DOT\n"); return DOT; }
{COMMA} { printf("COMMA\n"); return COMMA; }
{SEMICOLON} { printf("SEMICOLON\n"); return SEMICOLON; }
{RETURN} { printf("RETURN\n"); return RETURN; }
{ASSIGN} { printf("ASSIGN\n"); return ASSIGN; }
{PACKAGE} { printf("PACKAGE\n"); return PACKAGE; }
{CHAR_SEQUENCE} { printf("CHAR_SEQUENCE\n"); return CHAR_SEQUENCE; }
{IMPORT} { printf("IMPORT\n"); return IMPORT; }
{CLASS} { printf("CLASS\n"); return CLASS; }
{DOT_STAR} { printf("DOT_STAR\n"); return DOT_STAR; }
{VARIABLE} { printf("VARIABLE\n"); return VARIABLE; }
{WHITE_SYMBOL} { printf("WHITE_SYMBOL\n"); return WHITE_SYMBOL; }
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