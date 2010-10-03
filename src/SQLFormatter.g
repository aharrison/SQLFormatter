grammar SQLFormatter;

@header {
  import static java.lang.System.out;
}

@members {
    String s = "";
    String dent = "  ";
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/

statement returns [String s]:
        select_statement
        {
            return this.s;
        }
    ;

select_statement :
        SELECT { s += "SELECT "; }
        select_list FROM WORD
        { 
          s += "\nFROM " + $WORD.text;
        }
    ;

select_list:
        MULT { s += "*"; } 
    | list_elem
    ;

list_elem:
        w=WORD {s += "\n" + dent + $w.text;} 
        (COMMA w=WORD {s += ",\n" + dent + $w.text;})*
    ;

/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/
PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV	: '/' ;
COMMA : ',';
SELECT : 'select' ;
FROM : 'from' ;

NUMBER	: (DIGIT)+ ;
WORD : (CHAR)(CHAR|DIGIT)+ ;




WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+	{ $channel = HIDDEN; } ;

fragment CHAR : 'a'..'z' | 'A'..'Z' ;

fragment DIGIT : '0'..'9' ;


