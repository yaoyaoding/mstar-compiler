package Mstar;

public class Config {
    public static int REGISTER_WIDTH = 8;

    public enum Allocator {
        NaiveAllocator, SimpleGraphAllocator, GraphAllocator
    };

    public static boolean useOutputIrrelevantElimination = true;
    public static boolean useSimpleInline = true;
    public static boolean useBackupOptimization = true;
    public static boolean useLocalValueNumberOptimization = true;
    public static boolean useUselessInstructionElimination = true;

    public static Allocator allocator = Allocator.SimpleGraphAllocator;
    public static boolean printAST = false;
    public static boolean printIR = false;
    public static boolean printIRAfterLocalValueNumberOptimization = true;
    public static boolean printIRAfterUselessInstructionElimination = true;
    public static boolean printIRAfterAllocator = true;
    public static boolean printIRWithFrame = false;
    public static boolean printToAsmFile = true;
}
