package mstar.ast;

import java.util.LinkedList;
import java.util.List;

public class ClassDeclaration {
    public String name = null;
    public List<VariableDeclaration> fields = new LinkedList<VariableDeclaration>();
    public List<FuncDeclaration> methods = new LinkedList<FuncDeclaration>();
    public FuncDeclaration constructor = new FuncDeclaration();

    public String toString() {
        return name + "\n";
    }
}
