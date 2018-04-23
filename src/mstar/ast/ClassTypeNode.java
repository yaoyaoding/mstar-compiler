package mstar.ast;

public class ClassTypeNode extends TypeNode{
    public String className = null;

    public ClassTypeNode(){ }
    public ClassTypeNode(String className){
        this.className = className;
    }
    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
