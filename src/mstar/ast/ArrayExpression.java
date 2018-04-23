package mstar.ast;

public class ArrayExpression extends Expression {
    public Expression address;
    public Expression index;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
