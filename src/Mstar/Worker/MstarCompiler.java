package Mstar.Worker;

import Mstar.AST.AstProgram;
import Mstar.Config;
import Mstar.IR.IRProgram;
import Mstar.Parser.MstarLexer;
import Mstar.Parser.MstarParser;
import Mstar.Symbol.GlobalSymbolTable;
import Mstar.Worker.BackEnd.IRBuilder;
import Mstar.Worker.BackEnd.IRPrinter;
import Mstar.Worker.FrontEnd.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;


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

        //  source -> AST
        AstBuilder astBuilder = new AstBuilder(errorRecorder);
        astBuilder.visit(parseTree);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        AstProgram astProgram = astBuilder.getAstProgram();

        if(Config.printIR) {
            AstPrinter astPrinter = new AstPrinter();
            astPrinter.printTo(System.err);
        }

        //  AST -> AST with Symbol information
        SymbolTableBuilder symbolTableBuilder = new SymbolTableBuilder(errorRecorder);
        astProgram.accept(symbolTableBuilder);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.err);
            exit(1);
        }

        //  Semantic check on AST with Symbol information
        GlobalSymbolTable globalSymbolTable = symbolTableBuilder.globalSymbolTable;
        SemanticChecker semanticChecker = new SemanticChecker(globalSymbolTable, errorRecorder);

        astProgram.accept(semanticChecker);

        if(errorRecorder.errorOccured()) {
            errorRecorder.printTo(System.out);
            exit(1);
        }

        //  AST with Symbol information -> IR
        IRBuilder irBuilder = new IRBuilder(globalSymbolTable);
        astProgram.accept(irBuilder);
        IRProgram irProgram = irBuilder.irProgram;

        if(Config.printIR) {
            IRPrinter irPrinter = new IRPrinter(irProgram);
            irPrinter.printTo(System.err);
        }

        exit(0);
    }
}

