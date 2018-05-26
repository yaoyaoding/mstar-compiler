package Mstar.AST;


public class ExprStatement extends Statement {
    public Expression expression = null;

    public ExprStatement() {
    }
    public ExprStatement(Expression expression) {
        this.expression = expression;
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
