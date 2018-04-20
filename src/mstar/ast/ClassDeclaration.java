package mstar.ast;

import java.util.LinkedList;
import java.util.List;

public class ClassDeclaration extends AstNode {
    public String name = null;
    public List<VariableDeclaration> fields;
    public List<FuncDeclaration> methods;
    public FuncDeclaration constructor;

    public String toString() {
        return name + "\n";
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(indent + "class " + name + "\n");
        sb.append(indent + indentInc + "constructor:\n");
        sb.append(constructor.toFString(indent + indentInc + indentInc));
        sb.append(indent + indentInc + "fields:\n");
        for(VariableDeclaration vd : fields)
            sb.append(indent + indentInc + indentInc + vd.toFString("") + "\n");
        sb.append(indent + indentInc + "methods:\n");
        for(FuncDeclaration fd : methods)
            sb.append(fd.toFString(indent + indentInc + indentInc));
        return sb.toString();
    }
}
