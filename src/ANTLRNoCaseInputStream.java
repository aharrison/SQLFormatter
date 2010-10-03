import org.antlr.runtime.*;
import java.io.*;

public class ANTLRNoCaseInputStream extends ANTLRInputStream {
    public ANTLRNoCaseInputStream(InputStream is) throws IOException {
	super(is);
    }

    public int LA(int i) {
        if ( i==0 ) {
            return 0; // undefined
        }
        if ( i<0 ) {
            i++; // e.g., translate LA(-1) to use offset 0
        }

        if ( (p+i-1) >= n ) {
            return CharStream.EOF;
        }
        return Character.toLowerCase(data[p+i-1]);
    }
}
