package Mstar.AST;

public class BinaryExpression extends Expression {
    public String op;
    public Expression lhs;
    public Expression rhs;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}

