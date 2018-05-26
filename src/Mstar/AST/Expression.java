package Mstar.AST;

import Mstar.Symbol.VariableType;

public abstract class Expression extends AstNode {
    public VariableType type;
    public boolean modifiable;
}
