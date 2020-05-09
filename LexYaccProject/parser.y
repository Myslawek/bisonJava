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

/*Podstawowa regula sprawdzajacy po prostu czy program dziala*/
program: program PRIMITIVE WHITE_SYMBOL CHAR_SEQUENCE SEMICOLON { printf("ZAAKCEPTOWANO NAPIS\n"); }
|
;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() 
{
	SetInputFile("Program.txt");

    yyparse();    

	CloseInputFile();
    
	return 0;
}