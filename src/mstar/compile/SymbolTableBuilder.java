package mstar.compile;

import mstar.ast.*;
import mstar.symbol.*;

import java.util.LinkedList;
import java.util.List;

/*

    build the symbol table, and check use before declaration error

 */
public class SymbolTableBuilder implements IAstVisitor {
    public ErrorRecorder errorRecorder;
    public GlobalSymbolTable globalSymbolTable;
    public SymbolTable currentSymbolTable;
    private String name;

    public SymbolTableBuilder(ErrorRecorder errorRecorder) {
        this.errorRecorder = errorRecorder;
        this.globalSymbolTable = new GlobalSymbolTable();
        this.currentSymbolTable = globalSymbolTable;
    }
    private void enter(SymbolTable symbolTable) {
        currentSymbolTable = symbolTable;
    }
    private void leave() {
        currentSymbolTable = currentSymbolTable.parent;
        assert(currentSymbolTable != null);
    }
    private VariableType resolveVariableType(TypeNode node) {
        if(node instanceof PrimitiveTypeNode) {
            PrimitiveSymbol symbol = globalSymbolTable.getPrimitiveSymbol(((PrimitiveTypeNode) node).name);
            if(symbol != null)
                return new PrimitiveType(symbol.name, symbol);
            else
                return null;
        } else if(node instanceof ClassTypeNode) {
            ClassSymbol symbol = globalSymbolTable.getClassSymbol(((ClassTypeNode) node).className);
            if(symbol != null)
                return new ClassType(symbol.name, symbol);
            else
                return null;
        } else if(node instanceof ArrayTypeNode) {
            ArrayTypeNode oldArray = (ArrayTypeNode)node;
            VariableType baseType;
            if(oldArray.dimension == 1) {
                baseType = resolveVariableType(oldArray.baseType);
            } else {
                ArrayTypeNode newArray = new ArrayTypeNode();
                newArray.baseType = oldArray.baseType;
                newArray.dimension = oldArray.dimension - 1;
                baseType = resolveVariableType(newArray);
            }
            if(baseType != null)
                return new ArrayType(baseType);
            else
                return null;
        } else {
            assert false;
            return null;
        }
    }

    private VariableSymbol resolveVariableSymbol(String name, SymbolTable symbolTable) {
        VariableSymbol symbol = symbolTable.getVariableSymbol(name);
        if(symbol != null) {
            return symbol;
        } else {
            if(symbolTable.parent != null)
                return resolveVariableSymbol(name, symbolTable.parent);
            else
                return null;
        }
    }
    private VariableSymbol resolveVariableSymbol(String name) {
        return resolveVariableSymbol(name, currentSymbolTable);
    }
    private FunctionSymbol resolveFunctionSymbol(String name, SymbolTable symbolTable) {
        FunctionSymbol symbol = symbolTable.getFunctionSymbol(name);
        if(symbol != null) {
            return symbol;
        } else {
            if(symbolTable.parent != null)
                return resolveFunctionSymbol(name, symbolTable.parent);
            else
                return null;
        }
    }
    private FunctionSymbol resolveFunctionSymbol(String name) {
        this.name = name;
        return resolveFunctionSymbol(name, currentSymbolTable);
    }

    private void registerClass(ClassDeclaration classDeclaration) {
        if(globalSymbolTable.getClassSymbol(classDeclaration.name) != null) {
            errorRecorder.addRecord(classDeclaration.location, "the class has been defined");
            return;
        }
        ClassSymbol symbol = new ClassSymbol();
        symbol.name = classDeclaration.name;
        symbol.location = classDeclaration.location;
        symbol.classSymbolTable = new SymbolTable(globalSymbolTable);
        globalSymbolTable.putClassSymbol(symbol.name, symbol);
    }
    private void registerClassFunctions(ClassDeclaration classDeclaration) {
        ClassSymbol symbol = globalSymbolTable.getClassSymbol(classDeclaration.name);
        enter(symbol.classSymbolTable);
        registerFunction(classDeclaration.constructor, symbol);
        for(FuncDeclaration d : classDeclaration.methods)
            registerFunction(d, symbol);
        leave();
    }
    private void defineClassFields(ClassDeclaration classDeclaration) {
        ClassSymbol symbol = globalSymbolTable.getClassSymbol(classDeclaration.name);
        enter(symbol.classSymbolTable);
        for(VariableDeclaration d : classDeclaration.fields)
            defineVariable(d);
        leave();
    }
    private void defineClassFunctions(ClassDeclaration classDeclaration) {
        ClassSymbol symbol = globalSymbolTable.getClassSymbol(classDeclaration.name);
        enter(symbol.classSymbolTable);
        defineFunction(classDeclaration.constructor, symbol);
        for(FuncDeclaration d : classDeclaration.methods)
            defineFunction(d, symbol);
        leave();
    }
    private void registerFunction(FuncDeclaration funcDeclaration, ClassSymbol classSymbol) {
        if(currentSymbolTable.getFunctionSymbol(funcDeclaration.name) != null) {
            errorRecorder.addRecord(funcDeclaration.location, "the function has been defined");
            return;
        }
        FunctionSymbol symbol = new FunctionSymbol();
        symbol.name = funcDeclaration.name;
        symbol.location = funcDeclaration.location;
        symbol.returnType = resolveVariableType(funcDeclaration.retTypeNode);
        if(symbol.returnType == null)
            errorRecorder.addRecord(funcDeclaration.retTypeNode.location, "can not resolve type");
        symbol.functionSymbolTable = null;
        if(classSymbol != null) {
            symbol.parameterNames.add("this");
            symbol.parameterTypes.add(new ClassType(classSymbol.name, classSymbol));
        }
        for(VariableDeclaration d : funcDeclaration.parameters) {
            symbol.parameterNames.add(d.name);
            VariableType type = resolveVariableType(d.typeNode);
            if(type == null) {
                errorRecorder.addRecord(d.location, "can not resolve the type of parameter");
            }
            symbol.parameterTypes.add(type);
        }
        funcDeclaration.symbol = symbol;
        currentSymbolTable.putFunctionSymbol(symbol.name, symbol);
    }
    private void defineVariable(VariableDeclaration d) {
        VariableType type = resolveVariableType(d.typeNode);
        if(type != null) {
            if(currentSymbolTable.getVariableSymbol(d.name) != null) {
                errorRecorder.addRecord(d.location, "the variable has been defined");
            } else {
                if(type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("void")
                        || type instanceof ClassType && ((ClassType) type).name.equals("null"))
                    errorRecorder.addRecord(d.location, "can not define a class with type null or void");
                d.symbol = new VariableSymbol(d.name, type, d.location);
                currentSymbolTable.putVariableSymbol(d.name, d.symbol);
            }
        } else {
            errorRecorder.addRecord(d.typeNode.location, "can not resolve the type");
        }
        if(d.init != null)
            d.init.accept(this);
    }
    private void defineFunction(FuncDeclaration funcDeclaration, ClassSymbol classSymbol) {
        FunctionSymbol functionSymbol = currentSymbolTable.getFunctionSymbol(funcDeclaration.name);

        functionSymbol.functionSymbolTable = new SymbolTable(currentSymbolTable);
        enter(functionSymbol.functionSymbolTable);
        if(classSymbol != null)
            defineVariable(new VariableDeclaration(new ClassTypeNode(classSymbol.name), "this", null));
        for(VariableDeclaration d : funcDeclaration.parameters)
            defineVariable(d);
        for(Statement s : funcDeclaration.body)
            s.accept(this);
        leave();
    }

    @Override
    public void visit(Program node) {
        for(ClassDeclaration d : node.classes)
            registerClass(d);
        for(ClassDeclaration d : node.classes)
            registerClassFunctions(d);
        for(FuncDeclaration d : node.functions)
            registerFunction(d, null);
        for(ClassDeclaration d : node.classes)
            defineClassFields(d);
        for(Declaration d : node.declarations) {
            if(d instanceof VariableDeclaration)
                defineVariable((VariableDeclaration)d);
            else if(d instanceof ClassDeclaration)
                defineClassFunctions((ClassDeclaration)d);
            else
                defineFunction((FuncDeclaration) d, null);
        }
        /*
        for(VariableDeclaration d : node.globalVariables)
            defineVariable(d);
        for(ClassDeclaration d : node.classes)
            defineClassFunctions(d);
        for(FuncDeclaration d : node.functions)
            defineFunction(d, null);
        */
    }

    @Override
    public void visit(Declaration node) {
        assert false;
    }

    @Override public void visit(FuncDeclaration node) { }
    @Override public void visit(ClassDeclaration node) { }
    @Override public void visit(VariableDeclaration node) {
        defineVariable(node);
    }

    @Override public void visit(TypeNode node) { }
    @Override public void visit(ArrayTypeNode node) { }
    @Override public void visit(PrimitiveTypeNode node) { }

    @Override public void visit(ClassTypeNode node) { }

    @Override
    public void visit(Statement node) {
        assert false;
    }

    @Override
    public void visit(ForStatement node) {
        if(node.initStatement != null) node.initStatement.accept(this);
        if(node.condition != null) node.condition.accept(this);
        if(node.updateStatement != null) node.updateStatement.accept(this);
        node.body.accept(this);
    }

    @Override
    public void visit(WhileStatement node) {
        node.condition.accept(this);
        node.body.accept(this);
    }

    @Override
    public void visit(IfStatement node) {
        node.condition.accept(this);
        node.thenStatement.accept(this);
        if(node.elseStatement != null)
            node.elseStatement.accept(this);
    }

    @Override
    public void visit(ContinueStatement node) {
    }

    @Override
    public void visit(BreakStatement node) {
    }

    @Override
    public void visit(ReturnStatement node) {
        if(node.retExpression != null)
            node.retExpression.accept(this);
    }

    @Override
    public void visit(BlockStatement node) {
        SymbolTable symbolTable = new SymbolTable(currentSymbolTable);
        enter(symbolTable);
        for(Statement s : node.statements)
            s.accept(this);
        leave();
    }

    @Override
    public void visit(VarDeclStatement node) {
        node.declaration.accept(this);
    }

    @Override
    public void visit(ExprStatement node) {
        node.expression.accept(this);
    }

    @Override
    public void visit(Expression node) {
        assert false;
    }

    @Override
    public void visit(Identifier node) {
        VariableSymbol symbol = resolveVariableSymbol(node.name);
        if(symbol == null) {
            errorRecorder.addRecord(node.location, "can not resolve variable '" + node.name + "'");
            node.type = null;
            return;
        }
        node.symbol = symbol;
        node.type = symbol.type;
    }

    @Override
    public void visit(LiteralExpression node) {
        switch(node.typeName) {
            case "int":
                node.type = new PrimitiveType("int", globalSymbolTable.getPrimitiveSymbol("int"));
                break;
            case "null":
                node.type = new ClassType("null", globalSymbolTable.getClassSymbol("null"));
                break;
            case "bool":
                node.type = new PrimitiveType("bool", globalSymbolTable.getPrimitiveSymbol("bool"));
                break;
            case "string":
                node.type = new ClassType("string", globalSymbolTable.getClassSymbol("string"));
            default:
                assert false;
        }
    }

    @Override
    public void visit(ArrayExpression node) {
        node.address.accept(this);
        node.index.accept(this);
        if(node.address.type instanceof ArrayType)
            node.type = ((ArrayType) node.address.type).baseType;
        else {
            node.type = null;
            errorRecorder.addRecord(node.location, "array index expression with an no-array object");
        }
    }

    @Override
    public void visit(FuncCallExpression node) {
        FunctionSymbol functionSymbol = resolveFunctionSymbol(node.functionName);
        if(functionSymbol == null) {
            errorRecorder.addRecord(node.location, "can not resolve function '" + node.functionName + "'");
            return;
        }
        for(Expression e : node.arguments)
            e.accept(this);
        node.type = functionSymbol.returnType;
        node.functionSymbol = functionSymbol;
    }

    @Override
    public void visit(NewExpression node) {
        for(Expression e : node.exprDimensions)
            e.accept(this);
        int dimension = node.exprDimensions.size() + node.restDemension;
        node.type = resolveVariableType(node.typeNode);
        if(node.type == null) {
            errorRecorder.addRecord(node.typeNode.location, "can not resolve the type");
            node.type = null;
            return;
        }
        for (int i = 0; i < dimension; i++)
            node.type = new ArrayType(node.type);
    }

    @Override
    public void visit(MemberExpression node) {
        node.object.accept(this);
        if(node.object.type instanceof PrimitiveType) {
            errorRecorder.addRecord(node.object.location, "the expression is not a class instance");
            node.type = null;
            return;
        }
        if(node.object.type instanceof ArrayType) {
            ArrayType arrayType = (ArrayType)node.object.type;
            if(node.methodCall == null || !node.methodCall.functionName.equals("size")) {
                errorRecorder.addRecord(node.methodCall.location, "array type can only call size method");
                node.type = null;
            } else {
                node.type = new PrimitiveType("int", globalSymbolTable.getPrimitiveSymbol("int"));
            }
        } else {
            ClassType classType = (ClassType) node.object.type;
            if (node.fieldAccess != null) {
                node.fieldAccess.symbol = resolveVariableSymbol(node.fieldAccess.name, classType.symbol.classSymbolTable);
                if (node.fieldAccess.symbol == null) {
                    errorRecorder.addRecord(node.fieldAccess.location,
                            "class '" + classType.name + "' has not field '" + node.fieldAccess.name + "'");
                    node.type = null;
                    return;
                }
                node.fieldAccess.type = node.fieldAccess.symbol.type;
                node.type = node.fieldAccess.type;
            } else {
                node.methodCall.functionSymbol = resolveFunctionSymbol(node.methodCall.functionName, classType.symbol.classSymbolTable);
                if (node.methodCall.functionSymbol == null) {
                    errorRecorder.addRecord(node.methodCall.location,
                            "class '" + classType.name + "' has not method '" + node.fieldAccess.name + "'");
                    node.type = null;
                    return;
                }
                node.methodCall.type = node.methodCall.functionSymbol.returnType;
                node.type = node.methodCall.type;
                for (Expression e : node.methodCall.arguments)
                    e.accept(this);
            }
        }
    }

    @Override
    public void visit(UnaryExpression node) {
        node.expression.accept(this);
        node.type = node.expression.type;
    }

    private boolean isRelationOperator(String op) {
        switch(op) {
            case "==": case "!=": case "<": case "<=": case ">": case ">=":
                return true;
            default:
                return false;
        }
    }
    @Override
    public void visit(BinaryExpression node) {
        node.lhs.accept(this);
        node.rhs.accept(this);
        if(isRelationOperator(node.op))
            node.type = new PrimitiveType("bool", globalSymbolTable.getPrimitiveSymbol("bool"));
        else
            node.type = node.lhs.type;
    }

    @Override
    public void visit(TernaryExpression node) {
        node.condition.accept(this);
        node.exprTrue.accept(this);
        node.exprFalse.accept(this);
        node.type = node.exprTrue.type;
    }

    @Override
    public void visit(AssignExpression node) {
        node.lhs.accept(this);
        node.rhs.accept(this);
        node.type = new PrimitiveType("void", globalSymbolTable.getPrimitiveSymbol("void"));
    }
}
