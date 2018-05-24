package mstar.AST;

public class TernaryExpression extends Expression {
    public Expression condition;
    public Expression exprTrue;
    public Expression exprFalse;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
