package mstar.symbol;

import mstar.ast.TokenLocation;

public class VariableSymbol {
    public String name;         //  symbol name
    public VariableType type;   //  type of variable
    public TokenLocation location;

    public VariableSymbol() {}
    public VariableSymbol(String name, VariableType type, TokenLocation location) {
        this.name = name;
        this.type = type;
        this.location = location;
    }
}
