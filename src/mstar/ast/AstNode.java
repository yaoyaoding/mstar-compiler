package mstar.ast;

public abstract class AstNode {
    protected final String indentInc = "  ";
    public TokenLocation location = null;
    public abstract void accept(IAstVisitor visitor);
    public abstract String toFString(String indent);
}
