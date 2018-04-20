package mstar.ast;

public class ArrayExpression extends Expression {
    public Expression address;
    public Expression index;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return "(" + address.toFString("") + ")" + "[" + index.toFString("") + "]";
    }
}
