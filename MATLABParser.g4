parser grammar MATLABParser;
options { tokenVocab=MATLABLexer;}

fileDecl  
    : (functionDecl | classDecl)? (functionDecl* | partialFunctionDecl*)
    | partialFunctionDecl+   
    | statement+ // 普通语句
    | EOF
    ;

endStat//语句的结束
    : (NL|COMMA|SEMI) NL*
    ;


// 不含end的函数
partialFunctionDecl
    : FUNCTION outArgs? ID inArgs? endStat statement* 
    ; 

// 普通函数定义=部分函数加end
functionDecl
    : partialFunctionDecl END NL+ 
    ;

// Functions inside method blocks can be comma or semi separated 
methodDecl
    : partialFunctionDecl END endStat
    ;

classDecl
    : CLASSDEF ID endStat 
      (propBlockDecl|methodBlockDecl)* 
      END (EOF|endStat) NL*
    ;

propBlockDecl
    : PROPERTIES endStat prop* END endStat
    ;

methodBlockDecl
    : METHODS endStat methodDecl* END endStat
    ;

outArgs
    : ID EQUALS
    | LBRACK ID (COMMA ID)* RBRACK EQUALS
    ;

inArgs
    : LPAREN ID (COMMA ID)* RPAREN
    | LPAREN RPAREN
    ;

prop
    : ID (EQUALS expr)? endStat
    ;



statement
    : (stat endStat)
    ;

ifStat
    : IF expr endStat statement* 
      (ELSEIF expr endStat statement*)* 
      (ELSE endStat? statement*)?
      END
    ;

whileStat
    : WHILE expr endStat statement* END
    ;

caseStat
    : SWITCH expr endStat 
      (CASE expr endStat statement*)*
      (OTHERWISE endStat statement*)?
      END
    ;

stat
    : ID EQUALS expr
    | ifStat
    | whileStat
    | caseStat
    | expr 
    | NL
    ;

arrayExpr
    : LBRACK matrix? RBRACK
    ;

cellExpr
    : LBRACE matrix? RBRACE
    ;

expr
    : expr LPAREN exprList RPAREN
    | expr (TRANS|CTRANS)
    | expr (MPOW|POW) expr
    | (PLUS|MINUS|NOT) expr
    | expr (MTIMES|TIMES|MLDIVIDE|LDIVIDE|MRDIVIDE|RDIVIDE) expr
    | expr (PLUS|MINUS) expr
    | expr COLON expr
    | expr (NOT|EQUALTO|GT|LT|GE|LE) expr
    | expr VECAND expr
    | expr VECOR expr
    | expr SCALAND expr
    | expr SCALOR expr
    | ID
    | INT | FLOAT | SCI  
    | STRING
    | arrayExpr
    | cellExpr
    | LPAREN expr RPAREN
    ;

exprList
    : expr (',' expr)*
    ;

exprArrayList //原工程数组
    : expr (COMMA? exprArrayList)*    #hcat
    | expr ((SEMI|NL) exprArrayList)* #vcat
    ;
row 
	: expr (COMMA? expr)*
	;
matrix
	: row((SEMI|NL) row)*
	;