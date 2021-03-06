/*
-----------------------------------------------------------------
						*~- GRUPO 1 -~*
	-Integrantes:
			~Berrojalviz, Tomas
			~Carballo, Tomas
			~Garcia, Ignacio
			~Chittaro, Paula
------------------------------------------------------------------
*/
%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include "y.tab.h" /* Biblioteca que se genera con el parser del bison */
int linea=1;
%}
%option noyywrap

letra [a-z]
digito [0-9]
identificador {letra}({letra}|{digito})*
constEntera {digito}({digito})*
inicio "inicio"
fin "fin"
leer "leer"
escribir "escribir"

%%

"INTEGRANTES"					{printf("\n------------------------------------------------------------------\n\t\t\t*~- GRUPO 1 -~*\n-Integrantes:\n\t~Berrojalviz, Tomas\n\t~Carballo, Tomas\n\t~Garcia, Ignacio\n\t~Chittaro, Paula\n------------------------------------------------------------------\n");};
"SALIR"							{return 0;};
leer							{return (LEER);};
escribir 						{return (ESCRIBIR);};
inicio 							{return (INICIO);};
fin 							{return (FIN);};
" "								{};
{constEntera} 					{yylval.entero=atoi(yytext); return (CONSTANTE);};
":=" 							{return (ASIGNACION);};
"+" 							{return (SUMA);};
"-" 							{return (RESTA);};
{identificador} 				{yylval.cadena = strdup(yytext); return (ID);};
"(" 							{return (PARENIZQUIERDO);};
")" 							{return (PARENDERECHO);};
\n 								{linea++;return (NL);};
\t								{};
";" 							{return (PYCOMA);};
"," 							{return (COMA);};
. 								{printf("Error lexico en linea %d\n",linea);};

%%

/* -------- ANOTACIONES
LOS LEXEMAS "INTEGRANTES" Y "SALIR" SON DE LA PRIMERA ENTREGA DEL EJERCICIO INICAL DE FLEX, LOS DEJAMOS COMO RECORDATORIO DEL TP ANTERIOR.
*/