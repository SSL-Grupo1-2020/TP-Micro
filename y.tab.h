
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
     CONSTANTE = 258,
     SUMA = 259,
     RESTA = 260,
     ASIGNACION = 261,
     PYCOMA = 262,
     COMA = 263,
     PARENIZQUIERDO = 264,
     PARENDERECHO = 265,
     NL = 266,
     INICIO = 267,
     FIN = 268,
     LEER = 269,
     ESCRIBIR = 270,
     ID = 271
   };
#endif
/* Tokens.  */
#define CONSTANTE 258
#define SUMA 259
#define RESTA 260
#define ASIGNACION 261
#define PYCOMA 262
#define COMA 263
#define PARENIZQUIERDO 264
#define PARENDERECHO 265
#define NL 266
#define INICIO 267
#define FIN 268
#define LEER 269
#define ESCRIBIR 270
#define ID 271




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 15 "parserMicro-Grupo1.y"

   char* cadena;
   int entero;
   char caracter;



/* Line 1676 of yacc.c  */
#line 92 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


