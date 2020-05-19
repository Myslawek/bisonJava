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
%token NEW
%token CHAR_VAL
%token STRING
%token INTEGER_LITERAL
%token FLOAT_LITERAL
%token _NULL
%token SUPER
%token THIS
%token INSTANCEOF
%token RETURN
%token BREAK
%token CONTINUE
%token THROW
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

class_declaration: modifier CLASS IDENTIFIER EXTENDS class_name IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| CLASS IDENTIFIER EXTENDS class_name IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier CLASS IDENTIFIER IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier CLASS IDENTIFIER EXTENDS class_name '{' method_field_declaration '}'
| CLASS IDENTIFIER IMPLEMENTS class_interface_names '{' method_field_declaration '}'
| modifier CLASS IDENTIFIER '{' method_field_declaration '}'
| CLASS IDENTIFIER EXTENDS class_name '{' method_field_declaration '}'
| CLASS IDENTIFIER '{' method_field_declaration '}'


class_interface_names: interface_name ',' interface_name
| interface_name
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
;

parameter: type IDENTIFIER
| type IDENTIFIER '[' ']'
;

statement_block: '{' __statement_block1 '}'
;

__statement_block1: __statement_block1 statement 
| statement
;


statement: variable_declaration
| expression ';'
| statement_block
| if_statement
| do_statement
| while_statement
| for_statement
| try_statement
| SYNCHRONIZED '(' expression ')' statement
| RETURN expression ';'
| THROW expression ';'
| IDENTIFIER ':' statement
| BREAK __identifier_opt ';'
| CONTINUE __identifier_opt ';'
| ';'
;

__identifier_opt: IDENTIFIER
|
;

variable_declaration: __modifiers_multiple __variable_declaration2 ';'
| __variable_declaration2 ';'
;

__modifiers_multiple: __modifiers_multiple modifier
| modifier
;

__variable_declaration2: __variable_declaration2 ',' variable_declarator
| type variable_declarator
;

variable_declarator: IDENTIFIER 
| IDENTIFIER '[' ']'
| IDENTIFIER '=' IDENTIFIER
;

if_statement: IF '(' expression ')' statement_block
| IF '(' expression ')' statement_block ELSE statement_block 
;

do_statement: DO statement_block WHILE '(' expression ')' ';'
;

while_statement: WHILE '(' ')' statement_block
;

for_statement: FOR '(' __for_statement1 expression ';' __expression_opt ')' statement 
;

__for_statement1: variable_declaration
| expression ';'
| ';'
;

try_statement: TRY statement_block CATCH '(' parameter ')' __catch_statement
| TRY statement_block CATCH '(' parameter ')' __catch_statement FINALLY statement_block
;

__catch_statement: '{' IDENTIFIER '.' IDENTIFIER '(' ')' ';' '}'
| statement
| '{' '}'
;

constructor_declaration: modifier IDENTIFIER '(' parameter_list ')' statement_block 
| IDENTIFIER '(' parameter_list ')' statement_block
| modifier IDENTIFIER '(' ')' statement_block
| IDENTIFIER '(' ')' statement_block
;

method_variable_declaration: modifier variable_declaration
| variable_declaration
;

static_initializer: STATIC statement_block
;

interface_declaration: modifier INTERFACE IDENTIFIER EXTENDS interface_name '{' interface_field_declaration '}' 
| INTERFACE IDENTIFIER EXTENDS interface_name '{' interface_field_declaration '}' 
| modifier INTERFACE IDENTIFIER'{' interface_field_declaration '}' 
| INTERFACE IDENTIFIER '{' interface_field_declaration '}' 
;

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

bit_expression: '~' expression 
| expression __bit_expr1 expression
;

__bit_expr1: '>' '>' '=' 
| '<' '<' 
| '>' '>' 
| '>' '>' '>'
;

casting_expression:	'(' type ')' expression
;

creating_expression: NEW __creating_expr1
;

__creating_expr1: class_name '(' __arglist_opt ')'
| __creating_expr2
| '(' expression ')'
;

__creating_expr2: __creating_expr2 '[' ']' 
| type_specifier '[' __expression_opt ']'
;

literal_expression: INTEGER_LITERAL
| FLOAT_LITERAL
| STRING
| CHAR_VAL
;

expression: numeric_expression
| testing_expression
| logical_expression
| string_expression
| bit_expression
| casting_expression
| creating_expression
| literal_expression
| _NULL
| SUPER
| THIS
| IDENTIFIER
| '(' expression ')'
| expression __expr1
;

__expr1: '(' __arglist_opt ')' 
| '[' expression ']' 
| '.' expression 
| ',' expression 
| INSTANCEOF __expr2
;

__expr2: class_name 
| interface_name
;

__expression_opt: expression
|
;

arglist: arglist ',' expression
| expression
;

__arglist_opt: arglist
|
;

variable_initializer: '{' expression '}'
| '{' __variable_initializer1 '}'
;

__variable_initializer1: expression
| __variable_initializer1 ','
| __variable_initializer1 ',' __variable_initializer1
| __variable_initializer1 ',' __variable_initializer1 ','
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