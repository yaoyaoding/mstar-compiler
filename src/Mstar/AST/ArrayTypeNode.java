package Mstar.AST;

public class ArrayTypeNode extends TypeNode {
    public TypeNode baseType = null;
    public int dimension = -1;

    @Override
    public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
