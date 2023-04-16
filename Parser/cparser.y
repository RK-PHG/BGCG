%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<ctype.h>
    int yylex();
    void yyerror(const char* s);
%}


%%

file:
    code 
    ;

code:
    ;

%%

int main(int argv, char* args[]){
    yyparse();
}

void yyerror(const char* s){
    fprintf(stderr,"Parse error:%s\n",s);
    exit(1);
}
