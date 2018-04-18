package mstar.compile;

import java.util.LinkedList;
import java.util.List;

public class ErrorReporter {
    private List<String> errorList;

    public ErrorReporter() {
        errorList = new LinkedList<String>();
    }

    public void addRecord(String message) {
        errorList.add(message);
    }
    public List<String> getErrorList() {
        return errorList;
    }
    public boolean errorOccured() {
        return !errorList.isEmpty();
    }
}
