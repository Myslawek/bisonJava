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
%token OPEN_SQUARE
%token CLOSE_SQUARE
%token MAIN_METHOD
%token DOT
%token COMMA
%token RETURN
%token VARIABLE
%token ASSIGN
%token WHITE_SYMBOL
%token PACKAGE
%token ERROR
%token IMPORT
%token DOT_STAR
%token FOR_LOOP
%token WHILE_LOOP
%token IF_COND
%token ELSE_IF_COND
%token ELSE_COND
%token CLASS
%%


program: program ws_opt package_def_opt ws_opt imports ws_opt main ws_opt {printf("Poprawny kod");}
|
;

class: ACCESS_MODIFIER ws CLASS ws VARIABLE ws_opt '{' ws_opt declarations_definitions ws_opt 
;

method: ACCESS_MODIFIER WHOLE_NUM_PRIMITIVE
| ACCESS_MODIFIER REAL_NUM_PRIMITIVE
;
main: MAIN_METHOD ws_opt instruction_block 
;

if_cond: IF_COND ws_opt '(' ws_opt conditions ws_opt ')' instruction_block
;

conditions: conditions ws_opt LOGICAL_OP ws_opt condition 
| condition
;

condition: WHOLE_NUMBER ws_opt LOGICAL_OP ws_opt WHOLE_NUMBER 
| REAL_NUMBER ws_opt LOGICAL_OP ws_opt REAL_NUMBER 
| BOOLEAN_VAL
;

instruction_block: '{' ws_opt block ws_opt '}'
;

block: block ws_opt declarations_definitions | ws_opt
;

declarations_definitions: declaration ws_opt ';'
| definition ws_opt ';' 
;

declarations_with_definitions: declarations_with_definitions declaration 
| declarations_with_definitions definition
| declaration
| definition
;


declaration: WHOLE_NUM_PRIMITIVE ws VARIABLE 
| REAL_NUM_PRIMITIVE ws VARIABLE 
| BOOLEAN_PRIMITIVE ws VARIABLE
;

definition: WHOLE_NUM_PRIMITIVE var_assign ws_opt WHOLE_NUMBER 
| REAL_NUM_PRIMITIVE var_assign ws_opt REAL_NUMBER
| REAL_NUM_PRIMITIVE var_assign ws_opt WHOLE_NUMBER
| BOOLEAN_PRIMITIVE var_assign ws_opt BOOLEAN_VAL 
;

package_def_opt: PACKAGE ws path ws_opt ';' | ws_opt
;

var_assign: ws VARIABLE ws_opt ASSIGN
;

imports_opt: imports | ws_opt
;

imports: imports ws import
| import 
;

import: IMPORT ws path ws_opt ';' 
| IMPORT ws STATIC ws path ws_opt ';'
| IMPORT ws STATIC ws path DOT_STAR ws_opt ';'
;

static_opt: STATIC | ws_opt
;

path: VARIABLE
| path DOT VARIABLE

ws: ws WHITE_SYMBOL
| WHITE_SYMBOL
;

ws_opt: | ws
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