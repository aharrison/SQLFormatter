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
        (join_clause)*
        (WHERE { s += "\nWHERE\n  ";} conditional_list)?
    ;

select_list:
        MULT { s += "*"; } 
    | list_elem
    ;

join_clause:
        JOIN t=WORD ON { s+= "\n" + "JOIN " + $t.text + " ON "; }
        conditional_list
    ;

conditional_list:
        conditional (boolean_operator conditional)*;

conditional:
        access EQUALS { s+= " = "; } access
    ;

boolean_operator:
        AND { s+= "\n" + dent + "AND "; }
    |  OR { s+= "\n" + dent + "OR "; }
    ;

list_elem:
        w=WORD {s += "\n" + dent + $w.text;} 
        (COMMA w=WORD {s += ",\n" + dent + $w.text;})*
    ;

access:
        ( t=WORD DOT f=WORD ) { s += $t.text + "." + $f.text; }
    | n=NUMBER { s += $n.text;}
    ;

/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/
PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV	: '/' ;
COMMA : ',';
DOT : '.';
SELECT : 'select' ;
FROM : 'from' ;
WHERE : 'where';
JOIN : 'join' ;
ON : 'on';
EQUALS : '=';
NOTEQUALS : '!=';
LESSGREATER : '<>';
SINGLEQUOTE : '\'';
DOUBLEQUOTE : '"';
AND : 'and';
OR : 'or';
IS : 'is';
ISNOT : 'is not';


NUMBER	: (DIGIT)+ ;
WORD : (CHAR)(CHAR|DIGIT)+ ;




WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+	{ $channel = HIDDEN; } ;

fragment CHAR : 'a'..'z' | 'A'..'Z' ;

fragment DIGIT : '0'..'9' ;


