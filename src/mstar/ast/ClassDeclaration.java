package mstar.ast;

import mstar.symbol.ClassSymbol;

import java.util.List;

public class ClassDeclaration extends AstNode {
    public String name = null;
    public List<VariableDeclaration> fields;
    public List<FuncDeclaration> methods;
    public FuncDeclaration constructor;

    public ClassSymbol symbol;

    public String toString() {
        return name + "\n";
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
