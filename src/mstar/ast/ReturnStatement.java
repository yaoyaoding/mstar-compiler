package mstar.ast;

public class ReturnStatement extends Statement {
    public Expression retExpression = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return indent + "return" + " " + (retExpression == null ? "" : retExpression.toFString("")) + "\n";
    }
}
