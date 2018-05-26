package Mstar.AST;

public class ReturnStatement extends Statement {
    public Expression retExpression = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
