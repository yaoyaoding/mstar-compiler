package Mstar.AST;

import Mstar.Symbol.FunctionSymbol;

import java.util.LinkedList;
import java.util.List;

public class FuncDeclaration extends Declaration {
    public TypeNode retTypeNode = null;
    public String name = null;
    public List<VariableDeclaration> parameters;
    public List<Statement> body;

    public FunctionSymbol symbol;

    public String toString() {
        return name + "\n";
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
