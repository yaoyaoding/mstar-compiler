package Mstar.Worker;

import Mstar.AST.AstProgram;
import Mstar.Config;
import Mstar.IR.IRProgram;
import Mstar.IR.RegisterSet;
import Mstar.Parser.MstarLexer;
import Mstar.Parser.MstarParser;
import Mstar.Symbol.GlobalSymbolTable;
import Mstar.Worker.BackEnd.*;
import Mstar.Worker.FrontEnd.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;


import static java.lang.System.exit;


public class MstarCompiler {
    public static void main(String[] args) throws IOException {
        InputStream is = new FileInputStream("program.cpp");
        ANTLRInputStream ais = new ANTLRInputStream(is);
        MstarLexer mstarLexer = new MstarLexer(ais);
        CommonTokenStream tokens = new CommonTokenStream(mstarLexer);
        MstarParser parser = new MstarParser(tokens);
        RegisterSet.init();

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

        if(Config.printAST) {
            System.err.println("====================");
            System.err.println("Abstract Syntax Tree");
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

        //  AST with Symbol information -> IR with VirtualRegister
        IRBuilder irBuilder = new IRBuilder(globalSymbolTable);
        astProgram.accept(irBuilder);
        IRProgram irProgram = irBuilder.irProgram;

        //  correct some invalid use of instruction
        IRCorrector irCorrector = new IRCorrector();
        irProgram.accept(irCorrector);

        if(Config.printIRBeforeAllocator) {
            System.err.println("=====================================================");
            System.err.println("Intermediate Representation Before Register Allocator");
            IRPrinter irPrinter = new IRPrinter();
            irPrinter.showBlockHint = false;
            irPrinter.showNasm = false;
            irPrinter.visit(irProgram);
            irPrinter.printTo(System.err);
        }


        //  IR with VirtualRegister -> IR with PhysicalRegister
        switch (Config.allocator) {
            case GraphAllocator:
                assert false;
                break;
            case NaiveAllocator: {
                NaiveAllocator naiveAllocator = new NaiveAllocator(irProgram);
                naiveAllocator.run();
                break;
            }
            case SimpleGraphAllocator: {
                SimpleGraphAllocator simpleGraphAllocator = new SimpleGraphAllocator(irProgram);
                simpleGraphAllocator.run();
                break;
            }
        }
        if(Config.printIRAfterAllocator) {
            System.err.println("====================================================");
            System.err.println("Intermediate Representation After Register Allocator");
            IRPrinter irPrinter = new IRPrinter();
            irPrinter.showNasm = false;
            irPrinter.visit(irProgram);
            irPrinter.printTo(System.err);
        }

        //  IR with PhysicalRegister -> IR with PhysicalRegister and StackFrame
        StackFrameBuilder stackFrameBuilder = new StackFrameBuilder(irProgram);
        stackFrameBuilder.run();

        if(Config.printIRWithFrame) {
            System.err.println("===========================================");
            System.err.println("Intermediate Representation With StackFrame");
            IRPrinter irPrinter = new IRPrinter();
            irPrinter.showNasm = true;
            irPrinter.showHeader = false;
            irPrinter.visit(irProgram);
            irPrinter.printTo(System.err);
        }

        if(Config.printToAsmFile) {
            IRPrinter irPrinter = new IRPrinter();
            irPrinter.showNasm = true;
            irPrinter.showHeader = true;
            irPrinter.visit(irProgram);
            irPrinter.printTo(new PrintStream("program.asm"));
        }



        exit(0);
    }
}

