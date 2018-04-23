package mstar.ast;

import mstar.symbol.VariableType;

import java.util.*;

public class Program extends AstNode {
    public List<FuncDeclaration> functions;
    public List<ClassDeclaration> classes;
    public List<VariableDeclaration> globalVariables;
    public List<Declaration> declarations;

    public Program() {
        this.functions = new LinkedList<>();
        this.classes = new LinkedList<>();
        this.globalVariables = new LinkedList<>();
        this.declarations = new LinkedList<>();
    }
    public void add(FuncDeclaration d) {
        functions.add(d);
        declarations.add(d);
    }
    public void add(ClassDeclaration d) {
        classes.add(d);
        declarations.add(d);
    }
    public void addAll(List<VariableDeclaration> d) {
        globalVariables.addAll(d);
        declarations.addAll(d);
    }
    public void accept(IAstVisitor visitor) {
        visitor.visit(this);
    }
}
