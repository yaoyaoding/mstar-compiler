package mstar.ast;

public class WhileStatement extends Statement {
    public Expression condition = null;
    public Statement body = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return indent + "while(" + condition.toFString("") + ")\n"
                + body.toFString(indent + indentInc);
    }
}
