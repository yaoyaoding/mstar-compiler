package mstar.ast;

public class UnaryExpression extends Expression {
    public String op;
    public Expression expression;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        if(op.contains("v"))
            return op.replace("v", "(" + expression.toFString("") + ")");
        else
            return op + "(" + expression.toFString("") + ")";
    }
}
