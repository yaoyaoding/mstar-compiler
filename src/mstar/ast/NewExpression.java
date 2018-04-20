package mstar.ast;

import java.util.List;

public class NewExpression extends Expression {
    public TypeNode typeNode;
    public List<Expression> exprDimensions;
    public int restDemension;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append("new " + typeNode.toFString(""));
        sb.append(" ");
        for(Expression e : exprDimensions)
            sb.append("[" + e.toFString("") + "]");
        for(int i = 0; i < restDemension; i++)
            sb.append("[]");
        return sb.toString();
    }
}
