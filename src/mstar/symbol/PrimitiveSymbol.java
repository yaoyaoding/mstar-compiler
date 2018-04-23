package mstar.symbol;

import mstar.ast.TokenLocation;

public class PrimitiveSymbol extends TypeSymbol {
    public String name;     //  symbol name and primitive type name is the same
    public TokenLocation locataion;

    public PrimitiveSymbol() { }
    public PrimitiveSymbol(String name) {
        this.name = name;
        this.locataion = new TokenLocation(0, 0);
    }
}
