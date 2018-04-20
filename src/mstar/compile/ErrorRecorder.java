package mstar.compile;

import mstar.ast.TokenLocation;

import java.util.LinkedList;
import java.util.List;

public class ErrorRecorder {
    private List<String> errorList;

    public ErrorRecorder() {
        errorList = new LinkedList<String>();
    }

    public void addRecord(TokenLocation location, String message) {
        errorList.add(location + ":" + message);
    }
    public List<String> getErrorList() {
        return errorList;
    }
    public boolean errorOccured() {
        return !errorList.isEmpty();
    }
}
