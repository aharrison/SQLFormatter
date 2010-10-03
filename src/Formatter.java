import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Formatter {
    public static void main(String args[]) throws Exception {
	Formatter f = new Formatter();
	SimpleCalcParser parser = f.createParser(System.in);
	System.out.println(parser.statement());
    }
    
    public SimpleCalcParser createParser(InputStream is) throws Exception {
	ANTLRInputStream input = new ANTLRNoCaseInputStream(is);
        SimpleCalcLexer lex = new SimpleCalcLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        SimpleCalcParser parser = new SimpleCalcParser(tokens);
	return parser;
    }
}
