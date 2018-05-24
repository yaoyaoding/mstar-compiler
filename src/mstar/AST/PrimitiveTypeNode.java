package mstar.AST;

public class PrimitiveTypeNode extends TypeNode {
    public String name;

    public PrimitiveTypeNode() { }
    public PrimitiveTypeNode(String name) { this.name = name; }


    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
