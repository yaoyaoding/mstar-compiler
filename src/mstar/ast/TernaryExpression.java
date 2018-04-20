package mstar.ast;

public class TernaryExpression extends Expression {
    public Expression condition;
    public Expression expr1;
    public Expression expr2;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return "(" + condition.toFString("") + ")" + "?"
             + "(" + expr1.toFString("") + ")" + ":"
             + "(" + expr2.toFString("") + ")";
    }
}
