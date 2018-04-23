package mstar.ast;

public class UnaryExpression extends Expression {
    public String op;
    public Expression expression;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
