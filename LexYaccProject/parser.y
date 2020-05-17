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
%token BOOLEAN_PRIMITIVE
%token VOID
%token CHAR_SEQUENCE
%token STRING
%token ACCESS_MODIFIER
%token STATIC
%token STRUCTURE
%token CONTROL_FLOW
%token NEW
%token BOOLEAN_VAL
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
%token IMPORT
%token IMPORT_ALL_STATIC_MEMBERS
%%


program: program ws_opt package_def import main ws_opt {printf("Poprawny kod");}
|
;

main: MAIN_METHOD ws_opt method 
;

method: OPEN_BLOCK ws_opt block ws_opt CLOSE_BLOCK 
;

block: block ws_opt instruction 
|
;

instruction: declaration ws_opt SEMICOLON
| definition ws_opt SEMICOLON 
;

declaration: assignable_primitive ws VARIABLE
;

definition: WHOLE_NUM_PRIMITIVE var_assign ws_opt WHOLE_NUMBER 
| REAL_NUM_PRIMITIVE var_assign ws_opt REAL_NUMBER
| REAL_NUM_PRIMITIVE var_assign ws_opt WHOLE_NUMBER
| BOOLEAN_PRIMITIVE var_assign ws_opt BOOLEAN_VAL 
;

package_def: package_def PACKAGE ws var ws_opt SEMICOLON ws_opt
|
;

var_assign: ws VARIABLE ws_opt ASSIGN
;

assignable_primitive: WHOLE_NUM_PRIMITIVE 
| REAL_NUM_PRIMITIVE 
| BOOLEAN
;

import: import IMPORT ws static var end_of_import ws_opt SEMICOLON ws_opt
|
;

static: STATIC ws
|
;

end_of_import: END_OF_IMPORT
|
;

var: VARIABLE
| var DOT VARIABLE

ws: ws WHITE_SYMBOL
| WHITE_SYMBOL
;

ws_opt: ws
|
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