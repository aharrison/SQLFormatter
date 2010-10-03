import java.io.*;
import org.antlr.runtime.*;
import org.antlr.runtime.tree.*;

public class Formatter {
    public static void main(String args[]) throws Exception {
	Formatter f = new Formatter();
	SQLFormatterParser parser = f.createParser(System.in);
	System.out.println(parser.statement());
    }
    
    public SQLFormatterParser createParser(InputStream is) throws Exception {
	ANTLRInputStream input = new ANTLRNoCaseInputStream(is);
        SQLFormatterLexer lex = new SQLFormatterLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lex);
        SQLFormatterParser parser = new SQLFormatterParser(tokens);
	return parser;
    }
}
