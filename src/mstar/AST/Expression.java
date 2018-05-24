package mstar.AST;

import mstar.Symbol.VariableType;

public abstract class Expression extends AstNode {
    public VariableType type;
    public boolean modifiable;
}
