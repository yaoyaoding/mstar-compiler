package mstar.ast;

import java.util.List;

public class MemberExpression extends Expression {
    public Expression object;
    public String fieldName;
    public FuncCallExpression methodCall;
}
