package mstar.AST;

public class WhileStatement extends Statement {
    public Expression condition = null;
    public Statement body = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
