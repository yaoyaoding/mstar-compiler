package mstar.ast;

import mstar.symbol.VariableType;

public abstract class Expression extends AstNode {
    public VariableType type;
    public boolean modifiable;
}
