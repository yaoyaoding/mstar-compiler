package mstar.ast;

public class BinaryExpression extends Expression {
    public String op;
    public Expression lhs;
    public Expression rhs;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return "(" + lhs.toFString("") + ")" + op + "(" + rhs.toFString("")+ ")";
    }
}

