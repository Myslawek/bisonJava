%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
	void yyerror(char *s);
%}
%token INTEGER
%token DOUBLE
%token PRIMITIVE
%token VOID "void"
%token CHAR_SEQUENCE
%token STRING
%token ACCESS_MODIFIER
%token STRUCTURE
%token CONTROL_FLOW
%token NEW
%token BOOLEAN_LIT
%token _NULL
%token ARGS_MATH_OP
%token ARG_MATH_OP
%token LOGICAL_OP
%token OPEN_BLOCK
%token CLOSE_BLOCK
%token OPEN_SQUARE
%token CLOSE_SQUARE
%token OPEN_ROUND
%token CLOSE_ROUND
%token MAIN_METHOD
%token DOT
%token COMMA
%token SEMICOLON
%token RETURN
%token VARIABLE
%token ASSIGN
%token WHITE_SYMBOL
%token ERROR
%%

program: program instruction {printf("Poprawny kod");}
|
;

instruction: declaration SEMICOLON 
| definition SEMICOLON
;

declaration: PRIMITIVE ws VARIABLE  
| PRIMITIVE ws VARIABLE ws 
;

definition: declaration ASSIGN INTEGER 
| declaration ASSIGN ws INTEGER 
;

ws: ws WHITE_SYMBOL
| WHITE_SYMBOL
;

%%

void yyerror(char *s) {
    fprintf(stderr, "\n%s\n", s);
}

int main() 
{
	SetInputFile("Program.txt");

    yyparse();    

	CloseInputFile();
    
	return 0;
}