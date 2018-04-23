package mstar.ast;


import mstar.symbol.VariableSymbol;

public class VariableDeclaration extends AstNode {
    public TypeNode typeNode = null;
    public String name = null;
    public Expression init = null;

    public VariableSymbol symbol;

    public VariableDeclaration() {}
    public VariableDeclaration(TypeNode typeNode, String name, Expression init) {
        this.typeNode = typeNode;
        this.name = name;
        this.init = init;
        this.symbol = null;
    }
    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
