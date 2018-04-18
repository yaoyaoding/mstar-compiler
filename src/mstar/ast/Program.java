package mstar.ast;

import java.util.*;

public class Program {
    public List<FuncDeclaration> functions;
    public List<ClassDeclaration> classes;
    public List<VariableDeclaration> globalVariables;

    public Program() {
        this.functions = new LinkedList<FuncDeclaration>();
        this.classes = new LinkedList<ClassDeclaration>();
        this.globalVariables = new LinkedList<VariableDeclaration>();
    }
    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("Functions:\n");
        for(FuncDeclaration f : functions)
            stringBuilder.append(f);
        stringBuilder.append("Classes:\n");
        for(ClassDeclaration c : classes)
            stringBuilder.append(c);
        stringBuilder.append("Global Variables:\n");
        for(VariableDeclaration v : globalVariables)
            stringBuilder.append(v);
        return stringBuilder.toString();
    }
    public void accept(IAstVisitor visitor) {
        visitor.visit(this);
    }
}
