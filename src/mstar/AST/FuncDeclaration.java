package mstar.AST;

import mstar.Symbol.FunctionSymbol;

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

    public static FuncDeclaration defaultConstructor(String name) {
        FuncDeclaration constructor = new FuncDeclaration();
        constructor.retTypeNode = new PrimitiveTypeNode("void");
        constructor.name = name;
        constructor.parameters = new LinkedList<>();
        constructor.body = new LinkedList<>();
        return constructor;
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
