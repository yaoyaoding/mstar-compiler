package mstar.ast;

import java.util.*;

public class Program extends AstNode {
    public List<FuncDeclaration> functions;
    public List<ClassDeclaration> classes;
    public List<VariableDeclaration> globalVariables;

    public Program() {
        this.functions = new LinkedList<>();
        this.classes = new LinkedList<>();
        this.globalVariables = new LinkedList<>();
    }
    @Override
    public String toFString(String indent) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Functions:\n");
        for(FuncDeclaration f : functions)
            stringBuilder.append(f.toFString(indent + indentInc));
        stringBuilder.append("Classes:\n");
        for(ClassDeclaration c : classes)
            stringBuilder.append(c.toFString(indent + indentInc));
        stringBuilder.append("Global Variables:\n");
        for(VariableDeclaration v : globalVariables)
            stringBuilder.append(indent + indentInc + v.toFString("") + "\n");
        return stringBuilder.toString();
    }
    public void accept(IAstVisitor visitor) {
        visitor.visit(this);
    }
}
