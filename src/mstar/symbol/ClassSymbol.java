package mstar.symbol;

import mstar.ast.TokenLocation;

public class ClassSymbol extends TypeSymbol {
    public String name;     //  symbol name and class name are the same
    public TokenLocation location;
    public SymbolTable classSymbolTable;

}
