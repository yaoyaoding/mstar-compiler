package mstar.symbol;

import java.util.Map;

public class SymbolTable {
    Map<String,Symbol> symbols;

    static public SymbolTable mstarDefaultSymbolTable() {
        return new SymbolTable();
    }
}
