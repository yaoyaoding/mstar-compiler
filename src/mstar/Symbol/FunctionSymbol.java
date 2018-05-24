package mstar.Symbol;

import mstar.AST.TokenLocation;

import java.util.LinkedList;
import java.util.List;

public class FunctionSymbol {
    public String name;
    public TokenLocation location;
    public VariableType returnType;
    public List<VariableType> parameterTypes;
    public List<String> parameterNames;
    public SymbolTable functionSymbolTable;

    public FunctionSymbol() {
        this.parameterTypes = new LinkedList<>();
        this.parameterNames = new LinkedList<>();
    }
}
