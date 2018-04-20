package mstar.ast;

import java.util.LinkedList;
import java.util.List;

public class FuncDeclaration extends AstNode {
    public TypeNode retTypeNode = null;
    public String name = null;
    public List<VariableDeclaration> parameters;
    public List<Statement> body;

    public String toString() {
        return name + "\n";
    }

    public static FuncDeclaration defaultConstructor(String name) {
        FuncDeclaration constructor = new FuncDeclaration();
        constructor.retTypeNode = null;
        constructor.name = name;
        constructor.parameters = new LinkedList<>();
        constructor.body = new LinkedList<>();
        return constructor;
    }
    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent + "function: " + name + "\n");
        if(retTypeNode != null)     //  not constructor
            sb.append(indent + "return type:" + retTypeNode.toFString("") + "\n");
        sb.append(indent + "parameters:");
        for(VariableDeclaration vd : parameters) {
            sb.append(vd.toFString("") + ",");
        }
        sb.append("\n");
        sb.append(indent + "body:\n");
        for(Statement s : body) {
            sb.append(s.toFString(indent + indentInc));
        }
        return sb.toString();
    }
}
