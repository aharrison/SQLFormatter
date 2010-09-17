grammar SimpleCalc;

options { output=AST; }

tokens {
       PLUS	= '+' ;
       MINUS	= '-' ;
       MULT	= '*' ;
       DIV	= '/' ;
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/

expr returns [int value] : 
        term ( ( PLUS | MINUS )  term )* 
    ;


term returns [int value] : 
        factor ( ( MULT | DIV ) factor )* 
    ;

factor returns [int value] : 
        NUMBER { System.out.println($NUMBER.text); }
    ;

/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/

NUMBER	: (DIGIT)+ ;

WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+	{ $channel = HIDDEN; } ;

fragment DIGIT : '0'..'9' ;
