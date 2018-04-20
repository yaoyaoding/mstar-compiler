package mstar.ast;

public class VarDeclStatement extends Statement {
    public VariableDeclaration declaration;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return indent + declaration.toFString("") + ";\n";
    }
}
