package mstar.ast;

import mstar.symbol.VariableType;

import java.util.List;

public class NewExpression extends Expression {
    public TypeNode typeNode;
    public List<Expression> exprDimensions;
    public int restDemension;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
