package mstar.ast;

public class VariableDeclaration extends AstNode {
    public TypeNode typeNode = null;
    public String name = null;
    public Expression init = null;
}
