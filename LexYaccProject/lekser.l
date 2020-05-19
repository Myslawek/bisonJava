%option noyywrap

%{
	#include <stdlib.h> 
	#include "parser.h"

	void SetInputFile(const char* strFileName);
	void CloseInputFile();

	FILE* pInputFile = NULL;
%}



%%

"package" { return PACKAGE; }
"import" {return IMPORT; }
"public" {return PUBLIC; }
"private" {return PRIVATE; }
"protected" {return PROTECTED;}
"static" {return STATIC; }
"final" {return FINAL;}
"native" {return NATIVE; }
"synchronized" {return SYNCHRONIZED; }
"abstract" {return ABSTRACT;}
"treadsafe" {return TREADSAFE; }
"transient" {return TRANSIENT; }
"boolean" {return BOOLEAN; }
"byte" {return BYTE;}
"char" {return CHAR;}
"short" {return SHORT;}
"int" {return INT;}
"float" {return FLOAT;}
"long" {return LONG;}
"double" {return DOUBLE;}


"class"	{return CLASS; }
"extends" {return EXTENDS;}
"implements" {return IMPLEMENTS; }
"interface" {return INTERFACE; }
"if" {return IF; }
"else" {return ELSE; }
"do" {return DO; }
"while" {return WHILE;}
"for" {return FOR; }
"try" {return TRY; }
"catch" {return CATCH;}
"finally" {return FINALLY;}


";" { return yytext[0]; }
"." { return yytext[0]; }
"{" { return yytext[0]; }
"}" { return yytext[0]; }
"[" {return yytext[0]; }
"]" {return yytext[0]; }
"(" {return yytext[0]; }
")" {return yytext[0]; }
"," {return yytext[0]; }
"=" {return yytext[0]; }
"*" {return yytext[0]; }

[a-zA-Z$_]?[a-zA-Z0-9$_]* {return IDENTIFIER;}

\n ;
. ;

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