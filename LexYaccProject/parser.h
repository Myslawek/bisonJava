
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
     STRUCTURE = 267,
     CONTROL_FLOW = 268,
     NEW = 269,
     BOOLEAN_LIT = 270,
     _NULL = 271,
     ARGS_MATH_OP = 272,
     ARG_MATH_OP = 273,
     LOGICAL_OP = 274,
     OPEN_BLOCK = 275,
     CLOSE_BLOCK = 276,
     OPEN_SQUARE = 277,
     CLOSE_SQUARE = 278,
     OPEN_ROUND = 279,
     CLOSE_ROUND = 280,
     MAIN_METHOD = 281,
     DOT = 282,
     COMMA = 283,
     SEMICOLON = 284,
     RETURN = 285,
     VARIABLE = 286,
     ASSIGN = 287,
     WHITE_SYMBOL = 288,
     PACKAGE = 289,
     ERROR = 290
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


