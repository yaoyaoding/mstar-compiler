package Mstar.Symbol;

import Mstar.AST.TokenLocation;

public class ClassSymbol extends TypeSymbol {
    public String name;     //  Symbol name and class name are the same
    public TokenLocation location;
    public SymbolTable classSymbolTable;

}
