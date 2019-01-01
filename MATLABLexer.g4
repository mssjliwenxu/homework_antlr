lexer grammar MATLABLexer;

// 关键字
FUNCTION : 'function' ;

CLASSDEF : 'classdef' ;

PROPERTIES : 'properties' ;

METHODS : 'methods' ; 

END : 'end' ;

IF  : 'if' ;

ELSEIF : 'elseif' ;

ELSE : 'else' ;

WHILE : 'while' ;

FOR :  'for' ;

SWITCH : 'switch' ;

CASE : 'case' ; 

OTHERWISE : 'otherwise' ;

// 运算符
EQUALS : '=' ;

EQUALTO : '==' ;

GT : '>' ;

LT : '<' ;

GE : '>=' ;

LE : '<=' ;

PLUS : '+' ;

MINUS : '-' ;

DOT : '.' ;

VECAND : '&' ;

VECOR : '|' ;

SCALAND : '&&' ;

SCALOR : '||' ;

LPAREN : '(' ;

RPAREN : ')' ;

LBRACE : '{' ;

// RBRACE : '}' ;

LBRACK : '[' ;

// RBRACK : ']' ;

MTIMES : '*' ;

TIMES : '.*' ;

RDIVIDE : '/' ;

LDIVIDE : '\\' ;

MRDIVIDE : './' ;    //数组右除

MLDIVIDE : '.\\' ;     //数组左除

POW : '.^' ;         //数组幂运算

MPOW : '^' ;

NOT : '~' ;

COLON : ':' ;

TRANS : '.\'' ;

CTRANS : '\'' ;

// General rules
NL  : '\r'?'\n' ;

COMMENT
    : '%'.*? NL -> skip ;
BLOCKCOMMENT	: '%{' .*?  '%}' -> channel(HIDDEN);

fragment
LETTER  : [a-zA-Z] ; 
fragment
DIGIT   : [0-9] ; 
fragment
ESC : '\'\'' ;

INT : DIGIT+;                //普通int

FLOAT : DIGIT+ '.' DIGIT*
      | '.' DIGIT+
      ;                      //普通浮点数

SCI : (INT|FLOAT) ('e'|'E') ('+'|'-')? INT ;  //科学计数法
STRING : '\'' (ESC|.)*? '\'' ;   //字符串

ID  : LETTER (LETTER|DIGIT|'_')* ;//只能以字母开头的 字母数字下划线的

RBRACK : ']' ;
RBRACE : '}' ;

// HCAT : (COMMA); // | SPACE ) ;

// VCAT : (SEMI | NL ) ;

// ARRAYELSEP : (HCAT| VCAT ) ; // SPACE+ ;

COMMA : ',' ;

SEMI  : ';' ;

WS  : SPACE+ -> skip ;

fragment
SPACE : [ \t] ;