package mstar.ast;

public abstract class AstNode {
    public TokenLocation location = null;
    public abstract void accept(IAstVisitor visitor);
}
