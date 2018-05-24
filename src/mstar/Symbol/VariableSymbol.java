package mstar.Symbol;

import mstar.AST.TokenLocation;

public class VariableSymbol {
    public String name;         //  Symbol name
    public VariableType type;   //  type of variable
    public TokenLocation location;

    public VariableSymbol() {}
    public VariableSymbol(String name, VariableType type, TokenLocation location) {
        this.name = name;
        this.type = type;
        this.location = location;
    }
}
