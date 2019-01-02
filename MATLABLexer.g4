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

// 关系运算
EQUALTO : '==' ;

GT : '>' ;

LT : '<' ;

GE : '>=' ;

LE : '<=' ;

//算术运算符
EQUALS : '=' ;

PLUS : '+' ;

MINUS : '-' ;

MTIMES : '*' ;     //矩阵乘

TIMES : '.*' ;       //按元素乘

LDIVIDE : '\\' ;      //矩阵左除

MLDIVIDE : '.\\' ;     //数组左除

RDIVIDE : '/' ;      //矩阵右除

MRDIVIDE : './' ;    //右除

POW : '.^' ;         //按元素求幂运算

MPOW : '^';      //矩阵幂

TRANS : '.\'' ; //矩阵转置

CTRANS : '\'' ; //副共轭转置

//逻辑运算符
NOT : '~' ;

VECAND : '&' ;

VECOR : '|' ;

SCALAND : '&&' ;

SCALOR : '||' ;



//其他运算符
DOT : '.' ;

LPAREN : '(' ;

RPAREN : ')' ;

LBRACE : '{' ;

// RBRACE : '}' ;

LBRACK : '[' ;

// RBRACK : ']' ;

COLON : ':' ;

NL  : '\r'?'\n' ;

COMMA : ',' ;

SEMI  : ';' ;

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


WS  : SPACE+ -> skip ;

fragment
SPACE : [ \t] ;