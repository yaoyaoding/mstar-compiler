package Mstar.AST;

public class IfStatement extends Statement {
    public Expression condition;
    public Statement thenStatement;
    public Statement elseStatement;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
