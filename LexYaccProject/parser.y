%{
	#include <stdlib.h>
	#include <stdio.h>
	#include <math.h>
	void yyerror(char *s);
%}

%token PACKAGE
%token IDENTIFIER
%token IMPORT
%token PUBLIC
%token PRIVATE
%token PROTECTED
%token STATIC
%token FINAL
%token NATIVE
%token SYNCHRONIZED
%token ABSTRACT
%token TREADSAFE
%token TRANSIENT
%token CLASS
%token EXTENDS
%token IMPLEMENTS
%token BOOLEAN
%token BYTE
%token CHAR
%token SHORT
%token INT
%token FLOAT
%token LONG
%token DOUBLE
%token IF
%token ELSE
%token DO
%token WHILE
%token FOR
%token TRY
%token CATCH
%token FINALLY
%token INTERFACE
%token AMPERSAND
%token TRUE
%token FALSE
%token ERROR

%%

compilation_unit: type_declaration													{printf("Poprawny kod");}
|  package_statement 																{printf("Poprawny kod");}
|  import_statement 																{printf("Poprawny kod");}
|  import_statement type_declaration												{printf("Poprawny kod");}
|  package_statement type_declaration												{printf("Poprawny kod");}
|  package_statement import_statement												{printf("Poprawny kod");}
|  package_statement import_statement type_declaration								{printf("Poprawny kod");}
|  
;

package_statement: PACKAGE package_name ';'
;

package_name: IDENTIFIER 
| package_name '.' IDENTIFIER
;

import_statement: import_statement IMPORT package_name '.' '*' ';' 
| import_statement IMPORT class_name ';' 
| import_statement IMPORT interface_name ';' 
|
;

class_name: IDENTIFIER
| package_name '.' IDENTIFIER
;

interface_name: IDENTIFIER
| package_name '.' IDENTIFIER
;

type_declaration: class_declaration 
| interface_declaration
|

class_declaration: modifier_class CLASS IDENTIFIER EXTENDS class_name IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| CLASS IDENTIFIER EXTENDS class_name IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier_class CLASS IDENTIFIER IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier_class CLASS IDENTIFIER EXTENDS class_name '{' method_field_declaration '}'
| CLASS IDENTIFIER IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier_class CLASS IDENTIFIER '{' method_field_declaration '}'
| CLASS IDENTIFIER EXTENDS class_name '{' method_field_declaration '}'
| CLASS IDENTIFIER '{' method_field_declaration '}'


class_interface_names: interface_name ',' interface_name
| interface_name

modifier_class: PUBLIC
| PRIVATE
| PROTECTED
;

method_field_declaration: method_field_declaration method_declaration
| method_field_declaration constructor_declaration
| method_field_declaration method_variable_declaration 
| method_field_declaration static_initializer
| method_field_declaration ';' 
| 
;

method_declaration: modifier type IDENTIFIER '(' ')' statement_block 
| modifier type IDENTIFIER '(' parameter_list ')' statement_block
| type IDENTIFIER '(' parameter_list ')' statement_block
| type IDENTIFIER '(' ')' statement_block 



modifier: PUBLIC
| PRIVATE
| PROTECTED
| STATIC
| FINAL
| NATIVE
| SYNCHRONIZED
| ABSTRACT
| TREADSAFE
| TRANSIENT
;

type: type_specifier
| type_specifier '[' ']'
;

type_specifier: class_name
| interface_name 
| BOOLEAN
| BYTE
| CHAR
| SHORT
| INT
| FLOAT
| LONG
| DOUBLE
;

parameter_list: parameter
| parameter_list ',' parameter

parameter: type IDENTIFIER
| type IDENTIFIER '[' ']'

statement_block: '{' statement '}'
| statement
| '{' '}'

statement: statement variable_declaration
| statement if_statement
| statement do_statement
| statement while_statement
| statement for_statement
| statement try_statement
|

variable_declaration: type variable_declarator ';'

variable_declarator: IDENTIFIER 
| IDENTIFIER '[' ']'
| IDENTIFIER '=' IDENTIFIER


if_statement: IF '(' ')' statement_block
| IF '(' ')' statement_block ELSE statement_block 

do_statement: DO statement_block WHILE '(' ')' ';'

while_statement: WHILE '(' ')' statement_block

for_statement: FOR '(' ')' statement_block

try_statement: TRY statement_block CATCH '(' parameter ')' statement_block 
| TRY statement_block CATCH '(' parameter ')' statement_block FINALLY statement_block

constructor_declaration: modifier_class IDENTIFIER '(' parameter_list ')' statement_block 
| IDENTIFIER '(' parameter_list ')' statement_block
| modifier_class IDENTIFIER '(' ')' statement_block
| IDENTIFIER '(' ')' statement_block

method_variable_declaration: modifier variable_declaration
| variable_declaration

static_initializer: STATIC static_statement_block

static_statement_block: '{' statement '}'

interface_declaration: modifier_class INTERFACE IDENTIFIER EXTENDS interface_name '{' interface_field_declaration '}' 
| INTERFACE IDENTIFIER EXTENDS interface_name '{' interface_field_declaration '}' 
| modifier_class INTERFACE IDENTIFIER'{' interface_field_declaration '}' 
| INTERFACE IDENTIFIER '{' interface_field_declaration '}' 

interface_field_declaration: interface_field_declaration interface_method_declaration
| interface_field_declaration method_variable_declaration 
| interface_field_declaration ';' 
| 
;

interface_method_declaration: modifier type IDENTIFIER '(' ')' ';' 
| modifier type IDENTIFIER '(' parameter_list ')' ';'
| type IDENTIFIER '(' parameter_list ')' ';'
| type IDENTIFIER '(' ')' ';' 
;

numeric_expression: __num_expr1 expression
| expression __num_expr2
| expression __num_expr3 expression
;

__num_expr1: '-' 
| '+' '+' 
| '-' '-'
;

__num_expr2: '+' '+' 
| '-' '-'
;

__num_expr3: '+' 
| '+' '=' 
| '-' 
| '-' '=' 
| '*' 
| '*' '=' 
| '/' 
| '/' '=' 
| '%' 
| '%' '='
;

testing_expression: expression __testing_expr expression 
;

__testing_expr: '>' 
| '<' 
| '>' '=' 
| '<' '=' 
| '=' '=' 
| '!' '='
;

logical_expression: '!' expression
| expression __logical_expr1 expression
| expression '?' expression ':' expression
| TRUE
| FALSE 
;

__logical_expr1: AMPERSAND 
| AMPERSAND '=' 
| '|' 
| '|' '=' 
| '^' 
| '^' '=' 
| AMPERSAND AMPERSAND 
| '|' '|' '=' 
| '%' 
| '%' '='
;

string_expression: expression __string_expr1 expression
;

__string_expr1: '+' 
| '+' '='
;
%%

void yyerror(char *s) {
    fprintf(stderr, "\n%s\nPodany kod programu zawiera bledy w linii nr %u\n", s, getLineCount());
}

int main() 
{
	SetInputFile("Program.txt");

    yyparse();    

	CloseInputFile();
   
	return 0;
}