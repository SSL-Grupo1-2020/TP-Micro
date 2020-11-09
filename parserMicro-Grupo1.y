%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex(void);
extern FILE *yyin;
extern void yyerror(char*);
%}
%union{
   char* cadena;
} 
%token ASIGNACION PYCOMA CONSTANTE SUMA RESTA PARENIZQUIERDO PARENDERECHO NL INICIO FIN LEER ESCRIBIR
%token <cadena> ID
%%
programa: INICIO sentencias FIN NL {ejecucionCorrecta();} | INICIO sentencias FIN {ejecucionCorrecta();}
;
sentencias: sentencias sentencia | sentencia | NL
;
sentencia: ID ASIGNACION expresion PYCOMA | ID ASIGNACION expresion PYCOMA NL | PYCOMA
;
expresion: primaria | expresion operadorAditivo primaria
;
primaria: ID |CONSTANTE |PARENIZQUIERDO expresion PARENDERECHO
;
operadorAditivo: SUMA | RESTA
;
%%

void ejecucionCorrecta(){
	printf ("El programa se compilo con exito\n\n");
}

void yyerror(char *s){
  printf("Error sintactico: %s.\n",s);
}

int main(int argc,char **argv){

	printf("\t\tCompilador de Micro del Grupo 1\n------------------------------------------------------------------\n\t\t\t*~- GRUPO 1 -~*\n-Integrantes:\n\t~Berrojalviz, Tomas\n\t~Carballo, Tomas\n\t~Garcia, Ignacio\n\t~Chittaro, Paula\n------------------------------------------------------------------\n\n");
	
	if (argc>1){
		yyin=fopen(argv[1],"rt");
		printf("Se compilara el archivo: %s\n\n",argv[1]);
	}
	else
		yyin=stdin;

	yyparse();
	
	system("pause");
	
	return 0;
}
int yywrap()  {
  return 1;  
} 