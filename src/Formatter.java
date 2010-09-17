import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Formatter {
    public static void main(String args[]) throws Exception {
	ANTLRInputStream input = new ANTLRInputStream(System.in);
        SimpleCalcLexer lex = new SimpleCalcLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        SimpleCalcParser parser = new SimpleCalcParser(tokens);

	SimpleCalcParser.expr_return r = parser.expr();
        if ( r!=null ) {
	    CommonTree ct = (CommonTree)r.tree;
	    System.out.println(ct.toStringTree());
	}
    }
}
