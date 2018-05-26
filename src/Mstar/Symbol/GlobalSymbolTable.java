package Mstar.Symbol;

import Mstar.AST.TokenLocation;

import java.util.LinkedHashMap;
import java.util.Map;

public class GlobalSymbolTable extends SymbolTable {
    public Map<String,ClassSymbol> classes;
    public Map<String,PrimitiveSymbol> primitives;

    public GlobalSymbolTable() {
        super(null);
        classes = new LinkedHashMap<>();
        primitives = new LinkedHashMap<>();
        addMstarDefaultTypes();
    }

    public void putPrimitiveSymbol(String name, PrimitiveSymbol symbol) {
        primitives.put(name, symbol);
    }
    public PrimitiveSymbol getPrimitiveSymbol(String name) {
        return primitives.get(name);
    }
    public ClassSymbol getClassSymbol(String name) {
        return classes.get(name);
    }
    public void putClassSymbol(String name, ClassSymbol symbol) {
        classes.put(name, symbol);
    }

    private VariableType voidType() {
        return new PrimitiveType("void", primitives.get("void"));
    }
    private VariableType intType() {
        return new PrimitiveType("int", primitives.get("int"));
    }
    private VariableType stringType() {
        return new ClassType("string", classes.get("string"));
    }
    private FunctionSymbol stringLength() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "String.length";
        f.location = new TokenLocation(0, 0);
        f.parameterTypes.add(stringType());
        f.parameterNames.add("this");
        f.returnType = intType();
        return f;
    }
    private FunctionSymbol stringSubstring() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "string.substring";
        f.returnType = stringType();
        f.location = new TokenLocation(0, 0);
        f.parameterTypes.add(stringType());
        f.parameterNames.add("this");
        f.parameterTypes.add(intType());
        f.parameterNames.add("left");
        f.parameterTypes.add(intType());
        f.parameterNames.add("right");
        return f;
    }
    private FunctionSymbol stringParseInt() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "string.parseInt";
        f.location = new TokenLocation(0, 0);
        f.returnType = intType();
        f.parameterTypes.add(stringType());
        f.parameterNames.add("this");
        return f;
    }
    private FunctionSymbol stringOrd() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "string.ord";
        f.location = new TokenLocation(0, 0);
        f.returnType = intType();
        f.parameterTypes.add(stringType());
        f.parameterNames.add("this");
        f.parameterTypes.add(intType());
        f.parameterNames.add("pos");
        return f;
    }
    private FunctionSymbol globalPrint() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "print";
        f.returnType = voidType();
        f.location = new TokenLocation(0, 0);
        f.parameterTypes.add(stringType());
        f.parameterNames.add("str");
        return f;
    }
    private FunctionSymbol globalPrintln() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "println";
        f.returnType = voidType();
        f.location = new TokenLocation(0 ,0);
        f.parameterTypes.add(stringType());
        f.parameterNames.add("str");
        return f;
    }
    private FunctionSymbol globalGetString() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "getString";
        f.returnType = stringType();
        f.location = new TokenLocation(0, 0);
        return f;
    }
    private FunctionSymbol globalGetInt() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "getInt";
        f.returnType = intType();
        f.location = new TokenLocation(0, 0);
        return f;
    }
    private FunctionSymbol globalToString() {
        FunctionSymbol f = new FunctionSymbol();
        f.name = "toString";
        f.returnType = stringType();
        f.location = new TokenLocation(0, 0);
        f.parameterTypes.add(intType());
        f.parameterNames.add("i");
        return f;
    }
    private void addDefaultPrimitives() {
        primitives.put("int", new PrimitiveSymbol("int"));
        primitives.put("void", new PrimitiveSymbol("void"));
        primitives.put("bool", new PrimitiveSymbol("bool"));
    }
    private void addDefaultNull() {
        ClassSymbol nullSymbol = new ClassSymbol();
        nullSymbol.name = "null";
        nullSymbol.location = new TokenLocation(0,0);
        nullSymbol.classSymbolTable = new SymbolTable(this);
        putClassSymbol("null", nullSymbol);
    }
    private void addDefaultString() {
        ClassSymbol stringClass = new ClassSymbol();
        putClassSymbol("string", stringClass);
        SymbolTable st = new SymbolTable(this);
        st.putFunctionSymbol("length", stringLength());
        st.putFunctionSymbol("substring", stringSubstring());
        st.putFunctionSymbol("parseInt", stringParseInt());
        st.putFunctionSymbol("ord", stringOrd());
        stringClass.name = "string";
        stringClass.location = new TokenLocation(0, 0);
        stringClass.classSymbolTable = st;
    }
    private void addDefaultFunctions() {
        putFunctionSymbol("print", globalPrint());
        putFunctionSymbol("println", globalPrintln());
        putFunctionSymbol("getString", globalGetString());
        putFunctionSymbol("getInt", globalGetInt());
        putFunctionSymbol("toString", globalToString());
    }
    private void addMstarDefaultTypes() {
        addDefaultPrimitives();
        addDefaultNull();
        addDefaultString();
        addDefaultFunctions();
    }
}
