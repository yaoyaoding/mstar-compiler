package mstar.ast;

public class ArrayTypeNode extends TypeNode {
    public TypeNode baseType = null;
    public int dimension = -1;

    @Override
    public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(baseType.toFString(""));
        for(int i = 0; i < dimension; i++)
            stringBuilder.append("[]");
        return stringBuilder.toString();
    }
}
