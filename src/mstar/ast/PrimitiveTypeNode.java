package mstar.ast;

public class PrimitiveTypeNode extends TypeNode {
    public String primitiveType = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override public String toFString(String indent) { return indent + primitiveType; } }
