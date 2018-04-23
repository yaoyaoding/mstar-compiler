package mstar.symbol;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class SymbolTable {
    public Map<String,VariableSymbol> variables;
    public Map<String,FunctionSymbol> functions;
    public SymbolTable parent;
    public List<SymbolTable> children;


    public SymbolTable(SymbolTable parent) {
        this.variables = new LinkedHashMap<>();
        this.functions = new LinkedHashMap<>();
        this.parent = parent;
        this.children = new LinkedList<>();
    }
    public VariableSymbol getVariableSymbol(String name) {
        return variables.get(name);
    }
    public void putVariableSymbol(String name, VariableSymbol variableSymbol) {
        variables.put(name, variableSymbol);
    }
    public FunctionSymbol getFunctionSymbol(String name) { return functions.get(name); }
    public void putFunctionSymbol(String name, FunctionSymbol symbol) {
        functions.put(name, symbol);
    }
}
