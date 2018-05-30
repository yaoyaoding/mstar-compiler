package Mstar.Symbol;

import Mstar.AST.TokenLocation;
import Mstar.IR.Function;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;

public class FunctionSymbol {
    public String name;
    public TokenLocation location;
    public VariableType returnType;
    public List<VariableType> parameterTypes;
    public List<String> parameterNames;
    public SymbolTable functionSymbolTable;
    public HashSet<VariableSymbol> usedGlobalVariables;

    public FunctionSymbol() {
        this.parameterTypes = new LinkedList<>();
        this.parameterNames = new LinkedList<>();
        this.usedGlobalVariables = new HashSet<>();
    }
}
