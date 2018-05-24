package mstar.AST;

public class AssignExpression extends Expression {
    public Expression lhs;
    public Expression rhs;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
