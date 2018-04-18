package mstar.ast;

import mstar.symbol.VariableType;

public class Expression {
    VariableType type;

    public void accept(IAstVisitor visitor) {
        visitor.visit(this);
    }
}
