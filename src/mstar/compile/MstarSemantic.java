package mstar.compile;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.InputStream;

import mstar.parser.*;


public class MstarSemantic {
    public static void main(String[] args) {
        try {
            InputStream is = new FileInputStream("program.txt");
            ANTLRInputStream ais = new ANTLRInputStream(is);
            MstarLexer mstarLexer = new MstarLexer(ais);
            CommonTokenStream tokens = new CommonTokenStream(mstarLexer);
            MstarParser parser = new MstarParser(tokens);

            //  replace the error listener
            parser.removeErrorListeners();
            MyErrorListener myErrorListener = new MyErrorListener();
            parser.addErrorListener(myErrorListener);

            //  parse
            ParseTree parseTree = parser.compilationUnit();

            ErrorReporter errorReporter = new ErrorReporter();
            AstBuilder astBuilder = new AstBuilder(errorReporter);
            astBuilder.visit(parseTree);

            System.out.print(astBuilder.program);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }
}

