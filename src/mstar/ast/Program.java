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
    public void accept(IAstVisitor visitor) {
        visitor.visit(this);
    }
}
