package mstar.Worker;

import mstar.AST.TokenLocation;

import java.io.PrintStream;
import java.util.LinkedList;
import java.util.List;

public class ErrorRecorder {
    private List<String> errorList;

    public static final String ANSI_RESET = "\u001B[0m";
    public static final String ANSI_BLACK = "\u001B[30m";
    public static final String ANSI_RED = "\u001B[31m";
    public static final String ANSI_GREEN = "\u001B[32m";
    public static final String ANSI_YELLOW = "\u001B[33m";
    public static final String ANSI_BLUE = "\u001B[34m";
    public static final String ANSI_PURPLE = "\u001B[35m";
    public static final String ANSI_CYAN = "\u001B[36m";
    public static final String ANSI_WHITE = "\u001B[37m";

    public ErrorRecorder() {
        errorList = new LinkedList<String>();
    }

    public void addRecord(TokenLocation location, String message) {
        StackTraceElement[] stacks = new Throwable().getStackTrace();
        errorList.add(ANSI_CYAN + stacks[1].getClassName() + "." + stacks[1].getLineNumber() +  ANSI_PURPLE + ":" + ANSI_BLUE + location + ANSI_RESET + ANSI_PURPLE + ":" + ANSI_RED + message + ANSI_RESET);
    }
    public List<String> getErrorList() {
        return errorList;
    }
    public boolean errorOccured() {
        return !errorList.isEmpty();
    }

    public void printTo(PrintStream out) {
        out.print(toString());
    }

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        for(String s : errorList) {
            stringBuilder.append(s + '\n');
        }
        return stringBuilder.toString();
    }

}
