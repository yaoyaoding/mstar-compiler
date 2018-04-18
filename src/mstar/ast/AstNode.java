package mstar.ast;

public abstract class AstNode {
    public abstract void accept(IAstVisitor visitor);
    public abstract String toFormatString(String indent);
}
