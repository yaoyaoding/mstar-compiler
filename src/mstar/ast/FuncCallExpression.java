package mstar.ast;

import java.util.List;

public class FuncCallExpression extends Expression {
    public String functionName;
    public List<Expression> arguments;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        sb.append(functionName);
        sb.append("(");
        boolean firstExpr = true;
        for(Expression e : arguments) {
            if(!firstExpr)
                sb.append(",");
            else
                firstExpr = false;
            sb.append(e.toFString(""));
        }
        sb.append(")");
        return sb.toString();
    }
}
