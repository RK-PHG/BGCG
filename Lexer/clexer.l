%{ 
    #include<stdio.h>
    #include<stdlib.h>
    #include<iostream>
   
    extern  int  yyerror( const  char*);
    
    /*for lexer's testing*/
   
    enum token{

        /*基本数据类型*/
        CHAR,
        INT,
        SHORT,
        LONG,
        DOUBLE,
        FLOAT,
        STRUCT,
        VOID,

        /*修饰符*/
        UNSIGNED,
        STATIC,
        AUTO,
        CONST,

        /*其他*/
        BREAK,
        CASE,
        CONTINUE,
        DO,
        ELSE,
        ENUM,
        FOR,
        IF,
        RETURN,
        SIZEOF,
        SWITCH,
        TYPEDEF,
        UNION,
        WHILE,

        /*标点符号*/
        SELF_ADD,
        SELF_SUB,
        LEFT_SHIFT,
        RIGHT_SHIFT,
        LESS_EQUAL,
        GREATER_EQUAL,
        EQUAL,
        UNEQUAL,
        AND,
        OR,
        MUL_ASIGN,
        DIV_ASIGN,
        MOD_ASIGN,
        ADD_ASIGN,
        SUB_ASIGN,
        LEFR_SHIFT_ASIGN,
        RIGHT_SHIFT_ASIGN,
        BIT_AND_ASIGN,
        BIT_OR_ASIGN,
        BIT_NEG_ASIGN,

        /*标识符*/
        ID,

        POINTER,

        /*常量*/
        C_INT,
        C_CHAR,
        C_FLOAT,
        C_STRING,
    };

    void echoKeyword(){
        int len = strlen(yytext),i;  
        for(i=0;i<len;i++){
            printf("%c",yytext[i]-'a'+'A');
        }
        putchar(' ');
    }

    void echoID(){
        printf("ID ");
    }

    void echoCOS_INT(){
        printf("CONSTANT_INT ");
    }

    void echoCOS_FLOAT(){
        printf("CONSTANT_FLOAT ");
    }

    void echoCOS_CHAR(){
        printf("CONSTANT_CHAR ");
    }

    void echoCOS_STRING(){
        printf("CONSTANT_STRING ");
    }

%}

digit [0-9]

no_digit [_a-zA-Z]

no_zero_digit [1-9]

hexadecimal_digit [0-9a-fA-F]

c_char [^\'\\]

s_char [^\"\\]

%%

char {
           echoKeyword(); 
      //   return CHAR;
     }

int {
           echoKeyword(); 
      //   return INT;
     }

float {
           echoKeyword();
      //   return FLOAT;

    }

double {
       echoKeyword();
     //  return DOUBLE; 
}

short {
           echoKeyword(); 
      //   return SHORT;
     }

long {
           echoKeyword(); 
      //   return LONG;
     }

struct {
           echoKeyword();
      //   return STRUCT;

    }

void {
       echoKeyword();
     //  return VOID; 
}

unsigned {
           echoKeyword(); 
      //   return  UNSIGNED;
     }

static {
           echoKeyword(); 
     //   return STATIC;
     }

auto {
           echoKeyword();
       //   return AUTO;

    }

const {
       echoKeyword();
      //  return CONST; 

}

break {
       echoKeyword();
     //  return BREAK; 
}

case {
           echoKeyword(); 
      //   return CASE;
     }

continue {
           echoKeyword(); 
     //   return CONTINUE;
     }

do {
           echoKeyword();
       //   return DO;

    }

else {
       echoKeyword();
      //  return ELSE; 

}

enum {
       echoKeyword();
     //  return ENUM; 
}

for {
           echoKeyword(); 
      //   return FOR;
     }

if {
           echoKeyword(); 
     //   return IF;
     }

return {
           echoKeyword();
       //   return RETURN;

    }

sizeof {
       echoKeyword();
      //  return SIZEOF; 

}

switch {
       echoKeyword();
     //  return SWITCH; 
}

typedef {
           echoKeyword(); 
      //   return TYPEDEF;
     }

union {
           echoKeyword(); 
     //   return UNION;
     }

while {
           echoKeyword();
       //   return WHILE;

    }

"++" {
        printf("SELF_ADD ");
       // return SELF_ADD;
}

"--" {
        printf("SELF_SUB ");
       // return SELF_SUB;
}

"<<" {
       printf("LEFT_SHIFT ");
       //return LEFT_SHIFT;
}

">>" {
        printf("RIGHT_SHIFT ");
       // return RIGHT_SHIFT;
}

"<=" {
        printf("LESS_EQUAL ");
       // return LESS_EQUAL;
}

">=" {
       printf("GREATER_EQUAL ");
       //return GREATER_QEUAL;
}

"==" {
       printf("EQUAL ");
      //  return EQUAL;
}

"!=" {
        printf("UNEQUAL ");
     //   return UNEQUAL;
}

"&&" {
       printf("AND ");
       //return AND;
}

"||" {
        printf("OR ");
       // return OR;
}

"*=" {
        printf("MUL_ASSIGN ");
       // return MUL_ASSIGN;
}

"/=" {
        printf("DIV_ASSIGN ");
       // return DIV_ASSIGN;
}

"%=" {
        printf("MOD_ASSIGN ");
       // return MOD_ASSIGN;
}

"+=" {
        printf("ADD_ASSIGN ");
       // return ADD_ASSIGN;
}

"-=" {
       printf("SUB_ASSIGN ");
       //return SUB_ASSIGN;
}

"<<=" {
        printf("LEFT_SHIFT_ASSIGN ");
       // return LEFT_SHIFT_ASSIGN;
}

">>=" {
        printf("RIGHT_SHIFT_ASSIGN ");
       // return RIGHT_SHIFT_ASSIGN;
}

"&=" {
        printf("BIT_AND__ASSIGN ");
       // return BIT_AND_ASSIGN;
}

"|=" {
        printf("BIT_OR_ASSIGN ");
       // return BIT_OR_ASSIGN;
}

"^=" {
       printf("BIT_NEG_ASSIGN ");
       //return BIT_NEG_ASSIGN;
}

"->" {
       printf("POINTER ");
       //return POINTER;
}

[\[\]\(\)\{\}\.\+\-\*\/\&\|\!\%\>\<\^\?\:\;\=\,] {
       printf("%c ",yytext[0]);
       //return yytext[0];
}
 
{no_digit}({no_digit}|{digit})* {
       echoID();
       //return ID;
}

0|({no_zero_digit}{digit}*)|(("0x"|"0X"){hexadecimal_digit}*) {
       echoCOS_INT();
       //return C_INT;
}

{digit}*\.{digit}* {

    echoCOS_FLOAT();
    //return C_FLOAT;
}


\'{c_char}+\' {
      echoCOS_CHAR();
      //return C_CHAR;
}

\"{s_char}*\" {
    echoCOS_STRING();
    //return C_STRING;
}

. {
  //printf("%c",yytext[0]);  
}

%%

int yywrap(){
    return 1;
}

