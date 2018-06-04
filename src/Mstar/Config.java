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

    public static Allocator allocator = Allocator.SimpleGraphAllocator;
    public static boolean printAST = false;
    public static boolean printIR = true;
    public static boolean printIRAfterLocalValueNumberOptmization = true;
    public static boolean printIRAfterAllocator = true;
    public static boolean printIRWithFrame = true;
    public static boolean printToAsmFile = true;
}
