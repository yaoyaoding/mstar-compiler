package mstar.ast;

public class IfStatement extends Statement {
    public Expression condition;
    public Statement thenStatement;
    public Statement elseStatement;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent + "if(" + condition.toFString("") + ")\n");
        sb.append(thenStatement.toFString(indent + indentInc));
        if(elseStatement != null) {
            sb.append(indent + "else\n");
            sb.append(elseStatement.toFString(indent + indentInc));
        }
        return sb.toString();
    }
}
