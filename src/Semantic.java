import org.antlr.v4.runtime.*;
import parser.MstarLexer;
import parser.MstarParser;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Collections;
import java.util.List;


public class Semantic {
    public static void main(String[] args) {
        try {
            InputStream is = new FileInputStream("program.txt");
            ANTLRInputStream ais= new ANTLRInputStream(is);
            MstarLexer mstarLexer = new MstarLexer(ais);
            CommonTokenStream tokens = new CommonTokenStream(mstarLexer);
            MstarParser parser = new MstarParser(tokens);
            parser.removeErrorListeners();
            MyErrorListener myErrorListener = new MyErrorListener();
            parser.addErrorListener(myErrorListener);
            parser.compilationUnit();
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

class MyErrorListener extends BaseErrorListener {
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer,
                            Object offendingSymbol,
                            int line,
                            int charPositionInLine,
                            String msg,
                            RecognitionException e) {
        List<String> stack = ((Parser)recognizer).getRuleInvocationStack();
        Collections.reverse(stack);
        System.err.println("rule stack: "+stack);
        System.err.println("line "+line+":"+charPositionInLine+" at "+
                offendingSymbol+": "+msg);
    }
}
