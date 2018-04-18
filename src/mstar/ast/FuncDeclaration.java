package mstar.ast;

import java.util.LinkedList;
import java.util.List;

public class FuncDeclaration {
    public TypeNode typeNode = null;
    public String name = null;
    public List<VariableDeclaration> parameters = new LinkedList<VariableDeclaration>();
    public List<Statement> body = new LinkedList<Statement>();

    public String toString() {
        return name + "\n";
    }
}
