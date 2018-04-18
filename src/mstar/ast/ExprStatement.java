package mstar.ast;


public class ExprStatement extends Statement {
    public Expression expression = null;

    public ExprStatement() {
    }
    public ExprStatement(Expression expression) {
        this.expression = expression;
    }
}
