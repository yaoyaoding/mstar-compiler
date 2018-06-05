package Mstar;

import Mstar.AST.AstProgram;
import Mstar.Config;
import Mstar.IR.IRProgram;
import Mstar.IR.RegisterSet;
import Mstar.Parser.MstarLexer;
import Mstar.Parser.MstarParser;
import Mstar.Symbol.GlobalSymbolTable;
import Mstar.Worker.BackEnd.*;
import Mstar.Worker.ErrorRecorder;
import Mstar.Worker.FrontEnd.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.io.*;


import static java.lang.System.exit;
import static java.lang.System.in;


public class MstarCompiler {

    public static void printHelp() {
        System.out.println("mstar - A Simple Optimized Compiler for M* Language");
        System.out.println("");
        System.out.println("\tUsage: mstar [--no-optimize] [--printAST] [--printIR] [source] [-o target]");
        System.out.println("");
        System.out.println("\tif you do not specify the source, the compiler will regard program.cpp as the input.");
        System.out.println("");
        System.out.println("\t--no-optimize disable all the optimizations");
        System.out.println("\t--printAST print abstract syntax tree");
        System.out.println("\t--printIR print intermediate representations");
    }
    public static void argumentIncorrect() {
        System.out.println("Argument Format Incorrect");
        System.out.println("");
        printHelp();
        exit(0);
    }
    public static String getOutputName(String inputName) {
        StringBuilder stringBuilder = new StringBuilder();
        for(int i = 0; i < inputName.length(); i++) {
            if(inputName.charAt(i) != '.')
                stringBuilder.append(inputName.charAt(i));
        }
        stringBuilder.append(".asm");
        return stringBuilder.toString();
    }
    public static void parseArgs(String[] args) {
        try {
            String inputName = "program.cpp";
            for (int i = 0; i < args.length; i++) {
                String arg = args[i];
                switch (arg) {
                    case "--no-optimize":
                        Config.useUselessInstructionElimination = false;
                        Config.useLocalValueNumberOptimization = false;
                        Config.useOutputIrrelevantElimination = false;
                        Config.useBackupOptimization = false;
                        Config.useSimpleInline = false;
                        break;
                    case "--printAST":
                        Config.printAST = true;
                        break;
                    case "--printIR":
                        Config.printIR = true;
                        Config.printIRAfterUselessInstructionElimination = true;
                        Config.printIRWithFrame = true;
                        Config.printIRAfterLocalValueNumberOptimization = true;
                        Config.printIRAfterAllocator = true;
                        break;
                    case "-o":
                        if (i + 1 < args.length) {
                            i++;
                            arg = args[i];
                            Config.fout = new PrintStream(arg);
                        } else
                            argumentIncorrect();
                        break;
                    default:
                        if (Config.fin == null) {
                            inputName = arg;
                            Config.fin = new FileInputStream(arg);
                        } else
                            argumentIncorrect();
                        break;
                }
            }
            if(Config.fin == null) {
                Config.fin = new FileInputStream(inputName);
            }
            if(Config.fout == null) {
                Config.fout = new PrintStream(getOutputName(inputName));
            }
            assert Config.fin != null && Config.fout != null;
        } catch (FileNotFoundException e) {
            System.out.println(e.toString());
            exit(0);
        }
    }


    public static void main(String[] args) throws IOException {
        parseArgs(args);
        compile();
    }

    public static void compile() throws IOException {
        InputStream is = Config.fin;
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

        //  output irrelevant code elimination optimization
        if(Config.useOutputIrrelevantElimination) {
            OutputIrrelevantEliminator outputIrrevelantEliminator = new OutputIrrelevantEliminator(astProgram);
            outputIrrevelantEliminator.run();
        }

        //  AST with Symbol information -> IR with VirtualRegister
        IRBuilder irBuilder = new IRBuilder(globalSymbolTable);
        astProgram.accept(irBuilder);
        IRProgram irProgram = irBuilder.irProgram;

        if(Config.printIR) {
            System.err.println("=============================================");
            System.err.println("Intermediate Representation After IR Building");
            IRPrinter irPrinter = new IRPrinter();
            irPrinter.visit(irProgram);
            irPrinter.printTo(System.err);
        }

        if(Config.useLocalValueNumberOptimization) {
            LocalValueNumberOptimizer localValueNumberOptimizer = new LocalValueNumberOptimizer(irProgram);
            localValueNumberOptimizer.run();
            if(Config.printIRAfterLocalValueNumberOptimization) {
                System.err.println("====================================================================");
                System.err.println("Intermediate Representation After Local Value Numbering Optimization");
                IRPrinter irPrinter = new IRPrinter();
                irPrinter.visit(irProgram);
                irPrinter.printTo(System.err);
            }
        }


        if(Config.useUselessInstructionElimination) {
            UselessInstructionEliminater uselessInstructionEliminater = new UselessInstructionEliminater(irProgram);
            uselessInstructionEliminater.run();
            if(Config.printIRAfterUselessInstructionElimination) {
                System.err.println("===============================================================");
                System.err.println("Intermediate Representation After Eliminate Useless Instruction");
                IRPrinter irPrinter = new IRPrinter();
                irPrinter.visit(irProgram);
                irPrinter.printTo(System.err);
            }
        }



        //  correct some invalid use of instruction
        IRCorrector irCorrector = new IRCorrector();
        irProgram.accept(irCorrector);

        if(Config.printIR) {
            System.err.println("==============================================");
            System.err.println("Intermediate Representation After IR Corrector");
            IRPrinter irPrinter = new IRPrinter();
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

