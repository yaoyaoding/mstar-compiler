package Mstar.AST;

public class VarDeclStatement extends Statement {
    public VariableDeclaration declaration;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
