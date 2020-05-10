%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
	void yyerror(char *s);
%}
%token WHOLE_NUMBER
%token REAL_NUMBER
%token WHOLE_NUM_PRIMITIVE
%token REAL_NUM_PRIMITIVE
%token BOOLEAN
%token VOID
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
%token PACKAGE
%token ERROR
%%

program: program package_def SEMICOLON ws instruction {printf("Poprawny kod");}
|
;

instruction: declaration SEMICOLON 
| declaration ws SEMICOLON 
| definition SEMICOLON 
| definition ws SEMICOLON 
;

declaration: assignable_primitive ws VARIABLE  
| assignable_primitive ws VARIABLE ws 
;

definition: WHOLE_NUM_PRIMITIVE var_assign WHOLE_NUMBER 
| REAL_NUM_PRIMITIVE var_assign REAL_NUMBER
| REAL_NUM_PRIMITIVE var_assign WHOLE_NUMBER
| BOOLEAN var_assign BOOLEAN_LIT 
;

package_def: PACKAGE ws VARIABLE
| package_def DOT VARIABLE
;

var_assign: ws VARIABLE ws ASSIGN ws
| ws VARIABLE ws ASSIGN 
| ws VARIABLE ASSIGN
| ws VARIABLE ASSIGN ws
;

assignable_primitive: WHOLE_NUM_PRIMITIVE 
| REAL_NUM_PRIMITIVE 
| BOOLEAN
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