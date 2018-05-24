package mstar.AST;

public class ForStatement extends Statement {
    public Statement initStatement = null;
    public Expression condition = null;
    public Statement updateStatement = null;
    public Statement body = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
