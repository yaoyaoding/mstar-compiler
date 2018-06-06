package Mstar;

import java.io.FileInputStream;
import java.io.PrintStream;

public class Config {
    public static int REGISTER_WIDTH = 8;

    public enum Allocator {
        NaiveAllocator, SimpleGraphAllocator, GraphAllocator
    };

    public static FileInputStream fin;
    public static PrintStream fout;

    public static boolean useOutputIrrelevantElimination = true;
    public static boolean useBackupOptimization = true;
    public static boolean useLocalValueNumberOptimization = true;
    public static boolean useUselessInstructionElimination = true;
    public static boolean useInlineOptimization = true;
    public static int inlineMaxDepth = 4;
    public static int inlineOperationsThreshold = 25;

    public static Allocator allocator = Allocator.SimpleGraphAllocator;
    public static boolean printAST = false;
    public static boolean printIR = true;
    public static boolean printIRAfterLocalValueNumberOptimization = false;
    public static boolean printIRAfterUselessInstructionElimination = false;
    public static boolean printIRAfterAllocator = false;
    public static boolean printIRWithFrame = false;
    public static boolean printToAsmFile = true;
}
