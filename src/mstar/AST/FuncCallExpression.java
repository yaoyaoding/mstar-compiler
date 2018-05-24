package mstar.AST;

import mstar.Symbol.FunctionSymbol;

import java.util.List;

public class FuncCallExpression extends Expression {
    public String functionName;
    public List<Expression> arguments;

    public FunctionSymbol functionSymbol;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
