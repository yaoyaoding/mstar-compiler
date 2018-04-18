package mstar.ast;

import java.util.List;

public class NewExpression extends Expression {
    public TypeNode typeNode;
    public List<Expression> exprDimensions;
    public int restDemension;
}
