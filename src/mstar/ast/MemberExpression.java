package mstar.ast;

import java.util.List;

public class MemberExpression extends Expression {
    public Expression object;
    public String fieldName;
    public FuncCallExpression methodCall;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        if(fieldName != null)
            return "(" + object.toFString("") + ")" + "." + fieldName;
        else
            return "(" + object.toFString("") + ")" + "." + methodCall.toFString("");
    }
}
