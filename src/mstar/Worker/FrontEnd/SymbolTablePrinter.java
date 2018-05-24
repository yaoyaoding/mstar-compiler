package mstar.Worker.FrontEnd;

import mstar.Symbol.*;

import java.io.PrintStream;

public class SymbolTablePrinter {
    StringBuilder stringBuilder;
    String curIndent;
    String incIndent;

    public SymbolTablePrinter(GlobalSymbolTable globalSymbolTable) {
        this.stringBuilder = new StringBuilder();
        this.curIndent = "";
        this.incIndent = "  ";
        print(globalSymbolTable);
    }

    public String toString() {
        return stringBuilder.toString();
    }

    public void printTo(PrintStream out) {
        out.println(toString());
    }

    private void indent() {
        curIndent = curIndent + incIndent;
    }
    private void unindent() {
        curIndent = curIndent.substring(0, curIndent.length() - incIndent.length());
    }
    private void appendCurrentLine(String s) {
        stringBuilder.append(s);
    }
    private void appendNewLine(String s) {
        if(stringBuilder.length() == 0)
            stringBuilder.append(curIndent + s);
        else
            stringBuilder.append("\n" + curIndent + s);
    }

    String trans(PrimitiveType type) { return type.name; }
    String trans(ArrayType type) { return trans(type.baseType) + "[]"; }
    String trans(ClassType type) { return type.name; }

    String trans(VariableType type) {
        if(type instanceof PrimitiveType)
            return trans((PrimitiveType)type);
        else if(type instanceof ArrayType)
            return trans((ArrayType)type);
        else if(type instanceof ClassType)
            return trans((ClassType)type);
        else {
            assert false;
            return null;
        }
    }

    private void print(GlobalSymbolTable gst) {
        /*
        appendNewLine("Primitives: ");
        indent();
        for(PrimitiveSymbol ps : gst.primitives.values())
            print(ps);
        unindent();
        */
        appendNewLine("Classes: ");
        indent();
        for(ClassSymbol cs : gst.classes.values()) {
            if (cs.name.equals("string") || cs.name.equals("null"))
                continue;
            print(cs);
        }
        unindent();
        appendNewLine("Global Variables: ");
        indent();
        for(VariableSymbol vs : gst.variables.values())
            print(vs);
        unindent();
        appendNewLine("Functions: ");
        indent();
        for(FunctionSymbol fs : gst.functions.values()) {
            if(fs.name.equals("print") || fs.name.equals("println") || fs.name.equals("getString")
                    || fs.name.equals("getInt") || fs.name.equals("toString"))
                continue;
            print(fs);
        }
        unindent();
    }
    private void print(SymbolTable st) {
        if(st == null) {
            appendNewLine("null");
        } else {
            if(st.variables.size() + st.functions.size() + st.children.size() == 0)
                appendNewLine("empty");
            else {
                if(st.variables.size() > 0) {
                    appendNewLine("Variables: ");
                    indent();
                    for (VariableSymbol vs : st.variables.values())
                        print(vs);
                    unindent();
                }
                if(st.functions.size() > 0) {
                    appendNewLine("Functions: ");
                    indent();
                    for (FunctionSymbol fs : st.functions.values())
                        print(fs);
                    unindent();
                }
                if(st.functions.size() == 0) {
                    for (SymbolTable c : st.children) {
                        appendNewLine("Block:");
                        indent();
                        print(c);
                        unindent();
                    }
                }
            }
        }
    }
    private void print(PrimitiveSymbol ps) {
        appendNewLine(ps.name);
    }
    private void print(ClassSymbol cs) {
        appendNewLine(cs.name + "(class)");
        indent();
        appendNewLine("Members: ");
        indent();
        print(cs.classSymbolTable);
        unindent();
        unindent();
    }
    private void print(FunctionSymbol sf) {
        appendNewLine(sf.name + "(function)");
        indent();
        appendNewLine("Parameters: ");
        indent();
        for(int i = 0; i < sf.parameterNames.size(); i++) {
            appendNewLine(sf.parameterNames.get(i));
            appendCurrentLine("(" + trans(sf.parameterTypes.get(i)) + ")");
        }
        unindent();
        appendNewLine("Block: ");
        indent();
        print(sf.functionSymbolTable);
        unindent();
        unindent();
    }
    private void print(VariableSymbol vs) {
        appendNewLine(vs.name);
        appendCurrentLine("(" + trans(vs.type) + ")");
    }
}
