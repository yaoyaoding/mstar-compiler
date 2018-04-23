package mstar.compile;

import mstar.ast.TokenLocation;

import java.io.OutputStream;
import java.io.PrintStream;
import java.util.LinkedList;
import java.util.List;

public class ErrorRecorder {
    private List<String> errorList;

    public ErrorRecorder() {
        errorList = new LinkedList<String>();
    }

    public void addRecord(TokenLocation location, String message) {
        StackTraceElement[] stacks = new Throwable().getStackTrace();
        errorList.add(stacks[1].getClassName() + "." + stacks[1].getLineNumber() + ":" + location + ":" + message);
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
