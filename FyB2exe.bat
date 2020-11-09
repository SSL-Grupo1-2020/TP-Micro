bison -yd *.y
flex *.l
gcc y.tab.c lex.yy.c -o CompiladorMicro-Grupo1
pause
