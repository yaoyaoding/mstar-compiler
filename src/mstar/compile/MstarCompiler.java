package mstar.compile;

import mstar.ast.Program;
import mstar.symbol.GlobalSymbolTable;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import mstar.parser.*;

import static java.lang.System.exit;


public class MstarCompiler {
    public static void main(String[] args) throws IOException {
        InputStream is = new FileInputStream("program.txt");
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

        Program program = astBuilder.getProgram();

        AstPrinter astPrinter = new AstPrinter();
//        program.accept(astPrinter);
        astPrinter.printTo(System.err);

        SymbolTableBuilder symbolTableBuilder = new SymbolTableBuilder(errorRecorder);
        program.accept(symbolTableBuilder);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        GlobalSymbolTable globalSymbolTable = symbolTableBuilder.globalSymbolTable;
        SemanticChecker semanticChecker = new SemanticChecker(globalSymbolTable, errorRecorder);

        program.accept(semanticChecker);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.out);
            exit(1);
        }

        System.err.println("Successfully passed.");
        exit(0);
    }
}

