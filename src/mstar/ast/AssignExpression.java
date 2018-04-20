package mstar.ast;

public class AssignExpression extends Expression {
    public Expression lhs;
    public Expression rhs;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return "(" + lhs.toFString("") + ")=(" + rhs.toFString("")  + ")";
    }
}
