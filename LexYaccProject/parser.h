
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     WHOLE_NUMBER = 258,
     REAL_NUMBER = 259,
     WHOLE_NUM_PRIMITIVE = 260,
     REAL_NUM_PRIMITIVE = 261,
     BOOLEAN = 262,
     VOID = 263,
     CHAR_SEQUENCE = 264,
     STRING = 265,
     ACCESS_MODIFIER = 266,
     STATIC = 267,
     STRUCTURE = 268,
     CONTROL_FLOW = 269,
     NEW = 270,
     BOOLEAN_LIT = 271,
     _NULL = 272,
     ARGS_MATH_OP = 273,
     ARG_MATH_OP = 274,
     LOGICAL_OP = 275,
     OPEN_BLOCK = 276,
     CLOSE_BLOCK = 277,
     OPEN_SQUARE = 278,
     CLOSE_SQUARE = 279,
     OPEN_ROUND = 280,
     CLOSE_ROUND = 281,
     MAIN_METHOD = 282,
     DOT = 283,
     COMMA = 284,
     SEMICOLON = 285,
     RETURN = 286,
     VARIABLE = 287,
     ASSIGN = 288,
     WHITE_SYMBOL = 289,
     PACKAGE = 290,
     ERROR = 291,
     IMPORT = 292,
     END_OF_IMPORT = 293
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


