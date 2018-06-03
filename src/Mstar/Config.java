package Mstar;

public class Config {
    public static int REGISTER_WIDTH = 8;

    public enum Allocator {
        NaiveAllocator, SimpleGraphAllocator, GraphAllocator
    };

    public static boolean useSimpleInline = true;
    public static boolean useBackupOptimization = true;

    public static Allocator allocator = Allocator.SimpleGraphAllocator;
    public static boolean printAST = false;
    public static boolean printIRBeforeAllocator = true;
    public static boolean printIRAfterAllocator = true;
    public static boolean printIRWithFrame = true;
    public static boolean printToAsmFile = true;
}
