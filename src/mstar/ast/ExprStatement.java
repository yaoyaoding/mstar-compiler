package mstar.ast;


public class ExprStatement extends Statement {
    public Expression expression = null;

    public ExprStatement() {
    }
    public ExprStatement(Expression expression) {
        this.expression = expression;
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return indent + expression.toFString("") + "\n";
    }
}
