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
    public boolean isGlobalFunction;
    public boolean withSideEffect;
    public HashSet<FunctionSymbol> calleeSet;

    private HashSet<FunctionSymbol> visited;

    public FunctionSymbol() {
        this.parameterTypes = new LinkedList<>();
        this.parameterNames = new LinkedList<>();
        this.usedGlobalVariables = new HashSet<>();
        this.calleeSet = new HashSet<>();
        this.visited = new HashSet<>();
    }

    private void dfsSideEffect(FunctionSymbol fs) {
        if(withSideEffect) return;
        if(visited.contains(fs)) return;
        visited.add(fs);
        for(FunctionSymbol sfs : fs.calleeSet) {
            if(sfs.withSideEffect) {
                withSideEffect = true;
                break;
            }
        }
    }

    private boolean isPrimitiveType(VariableType vt) {
        return vt instanceof PrimitiveType;
    }

    public void finish() {
        for(VariableType vt : parameterTypes) {
            if(!isPrimitiveType(vt))
                withSideEffect = true;
        }
        visited.clear();
        dfsSideEffect(this);
    }
}
