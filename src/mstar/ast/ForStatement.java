package mstar.ast;

public class ForStatement extends Statement {
    public Statement initStatement = null;
    public Expression condition = null;
    public Statement updateStatement = null;
    public Statement body = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent + "for(");
        if(initStatement != null) {
            sb.append(initStatement.toFString(""));
            sb.deleteCharAt(sb.length() - 1);
        }
        sb.append(";");
        if(condition != null)
            sb.append(condition.toFString(""));
        sb.append(";");
        if(updateStatement != null) {
            sb.append(updateStatement.toFString(""));
            sb.deleteCharAt(sb.length() - 1);
        }
        sb.append(")\n");
        if(body instanceof BlockStatement)
            sb.append(body.toFString(indent));
        else
            sb.append(body.toFString(indent + indentInc));
        return sb.toString();
    }
}
