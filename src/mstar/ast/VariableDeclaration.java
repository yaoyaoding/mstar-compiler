package mstar.ast;

public class VariableDeclaration extends AstNode {
    public TypeNode typeNode = null;
    public String name = null;
    public Expression init = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        if(typeNode != null)
            sb.append(typeNode.toFString("") + " ");
        sb.append(name);
        if(init != null)
            sb.append(" = " + init.toFString(""));
        return sb.toString();
    }
}
