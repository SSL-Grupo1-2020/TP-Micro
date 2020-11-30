%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
extern int yylex(void);
extern FILE *yyin;
extern void yyerror(char*);

int cantVar=0;
char** variables;
int* valores;

void ejecucionCorrecta(){
	printf ("\n\t*~- El programa se compilo con exito -~*\n\n");
}

void escribirConsola(int n){
	printf ("El valor es: %d\n",n);
}

void leerConsola(char* id){
	asignarVariable(id);
	int aux;
	printf ("Ingrese el valor de %s: ",id);
    scanf("%d",&aux);
	asignarValor(aux);
}

int obtenerValor(char* id){
	for(int i=0;variables[i];i++){
		if(strcmp(variables[i],id) == 0){
			return valores[i];
		}
	}
	return -1;
}

void asignarVariable(char* idNuevo){
	variables[cantVar] = malloc(strlen(idNuevo));
	variables[cantVar] = strdup(idNuevo);
}

void asignarValor(int valorNuevo){
	valores[cantVar] = (int) malloc(sizeof(int));
	valores[cantVar] = valorNuevo;
	cantVar++;
}

%}
%union{
   char* cadena;
   int entero;
   char caracter;
}
%token <entero> CONSTANTE
%token <caracter> SUMA
%token <caracter> RESTA 
%token ASIGNACION PYCOMA COMA PARENIZQUIERDO PARENDERECHO NL INICIO FIN LEER ESCRIBIR
%token <cadena> ID
%left SUMA RESTA
%type <entero> expresion
%type <entero> primaria
%type <caracter> operadorAditivo
%%
programa: INICIO sentencias FIN NL {ejecucionCorrecta();} | INICIO sentencias FIN {ejecucionCorrecta();}
;
sentencias: sentencias sentencia | sentencia
;
sentencia: asignacion | leer | escribir | pycoma | NL
;
pycoma: PYCOMA | PYCOMA NL
;
leer: LEER PARENIZQUIERDO identificadores PARENDERECHO pycoma
;
escribir: ESCRIBIR PARENIZQUIERDO expresiones PARENDERECHO pycoma
;
asignacion: ID ASIGNACION expresion pycoma {printf("Se le asigna %d a %s\n",$3,$1);asignarVariable($1);asignarValor($3);}
;
identificadores: ID {leerConsola($1);}| ID COMA identificadores {leerConsola($1);}
; 
expresiones: expresion {escribirConsola($1);} | expresion COMA expresiones {escribirConsola($1);}
;
expresion: primaria {$$=$1;} | expresion operadorAditivo primaria {if($2 == '+')	$$= $1 + $3;	else	$$=$1 - $3;}
; 
primaria: ID {$$=obtenerValor($1);} |CONSTANTE {$$=$1;} |PARENIZQUIERDO expresion PARENDERECHO {$$=$2;}
;
operadorAditivo: SUMA {$$ = '+';} | RESTA {$$ = '-';}
;
%%

void yyerror(char *s){
  printf("Error sintactico: %s.\n",s);
}

int main(int argc,char **argv){
	variables = (char**) malloc(sizeof(char*));
	valores = (int*) malloc(sizeof(int));

	printf("\t\tCompilador de Micro del Grupo 1\n------------------------------------------------------------------\n\t\t\t*~- GRUPO 1 -~*\n-Integrantes:\n\t~Berrojalviz, Tomas\n\t~Carballo, Tomas\n\t~Garcia, Ignacio\n\t~Chittaro, Paula\n------------------------------------------------------------------\n\n");
	
	if (argc > 1){
		yyin = fopen(argv[1],"r");
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