package mstar.Worker;

import mstar.AST.AstProgram;
import mstar.Symbol.GlobalSymbolTable;
import mstar.Worker.FrontEnd.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import mstar.Parser.*;

import static java.lang.System.exit;


public class MstarCompiler {
    public static void main(String[] args) throws IOException {
        InputStream is = new FileInputStream("astProgram.txt");
        ANTLRInputStream ais = new ANTLRInputStream(is);
        MstarLexer mstarLexer = new MstarLexer(ais);
        CommonTokenStream tokens = new CommonTokenStream(mstarLexer);
        MstarParser parser = new MstarParser(tokens);

        //  record errors
        ErrorRecorder errorRecorder = new ErrorRecorder();

        //  replace the error listener to record syntax error to errorRecorder
        parser.removeErrorListeners();
        SyntaxErrorListener syntaxErrorListener = new SyntaxErrorListener(errorRecorder);
        parser.addErrorListener(syntaxErrorListener);

        //  parse the input and build the parse tree
        ParseTree parseTree = parser.compilationUnit();

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        AstBuilder astBuilder = new AstBuilder(errorRecorder);
        astBuilder.visit(parseTree);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        AstProgram astProgram = astBuilder.getAstProgram();

        AstPrinter astPrinter = new AstPrinter();
//        astProgram.accept(astPrinter);
        astPrinter.printTo(System.err);

        SymbolTableBuilder symbolTableBuilder = new SymbolTableBuilder(errorRecorder);
        astProgram.accept(symbolTableBuilder);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        GlobalSymbolTable globalSymbolTable = symbolTableBuilder.globalSymbolTable;
        SemanticChecker semanticChecker = new SemanticChecker(globalSymbolTable, errorRecorder);

        astProgram.accept(semanticChecker);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.out);
            exit(1);
        }

        System.err.println("Successfully passed.");
        exit(0);
    }
}

