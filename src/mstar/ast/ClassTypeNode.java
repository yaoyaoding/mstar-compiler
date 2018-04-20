package mstar.ast;

public class ClassTypeNode extends TypeNode{
    public String className = null;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override public String toFString(String indent) { return indent + className; }
}
