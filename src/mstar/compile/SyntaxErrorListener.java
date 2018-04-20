package mstar.compile;

import mstar.ast.TokenLocation;
import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;


public class SyntaxErrorListener extends BaseErrorListener {
    private boolean error = false;
    private ErrorRecorder errorRecorder;

    public SyntaxErrorListener(ErrorRecorder errorRecorder) {
        this.errorRecorder = errorRecorder;
    }
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer,
                            Object offendingSymbol,
                            int line,
                            int charPositionInLine,
                            String msg,
                            RecognitionException e) {
        errorRecorder.addRecord(new TokenLocation(line, charPositionInLine), msg);
//        List<String> stack = ((Parser)recognizer).getRuleInvocationStack();
//        Collections.reverse(stack);
//        System.err.println("rule stack: "+stack);
//        System.err.println("line "+line+":"+charPositionInLine+" at "+
//                offendingSymbol+": "+msg);
//        error = true;
    }

    public boolean isError() {
        return error;
    }
}
