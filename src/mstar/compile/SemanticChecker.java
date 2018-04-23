package mstar.compile;

import mstar.ast.*;
import mstar.symbol.*;

public class SemanticChecker implements IAstVisitor {
    GlobalSymbolTable globalSymbolTable;
    ErrorRecorder errorRecorder;
    FunctionSymbol currentFunction;
    int loopCount;

    public SemanticChecker(GlobalSymbolTable globalSymbolTable, ErrorRecorder errorRecorder) {
        this.globalSymbolTable = globalSymbolTable;
        this.errorRecorder = errorRecorder;
        this.loopCount = 0;
    }
    @Override
    public void visit(Program node) {
        for(VariableDeclaration d : node.globalVariables)
            d.accept(this);
        for(FuncDeclaration d: node.functions)
            d.accept(this);
        for(ClassDeclaration d : node.classes)
            d.accept(this);
        if(globalSymbolTable.functions.get("main") == null)
            errorRecorder.addRecord(node.location, "main function has not been found");
    }

    @Override
    public void visit(FuncDeclaration node) {
        currentFunction = node.symbol;
        for(Statement s : node.body)
            s.accept(this);
    }

    @Override
    public void visit(ClassDeclaration node) {
        for(FuncDeclaration d : node.methods)
            d.accept(this);
        node.constructor.accept(this);
    }

    @Override
    public void visit(VariableDeclaration node) {
        if(node.init != null) {
            if(!node.symbol.type.match(node.init.type)) {
                errorRecorder.addRecord(node.init.location, "type conflict with the defined variable");
            }
        }
    }

    @Override
    public void visit(TypeNode node) { }

    @Override
    public void visit(ArrayTypeNode node) { }

    @Override
    public void visit(PrimitiveTypeNode node) { }

    @Override
    public void visit(ClassTypeNode node) { }

    @Override
    public void visit(Statement node) {
        assert false;
    }

    @Override
    public void visit(ForStatement node) {
        node.initStatement.accept(this);
        node.condition.accept(this);
        node.updateStatement.accept(this);
        loopCount++;
        node.updateStatement.accept(this);
        loopCount--;
    }

    @Override
    public void visit(WhileStatement node) {
        node.condition.accept(this);
        loopCount++;
        node.body.accept(this);
        loopCount--;
    }

    @Override
    public void visit(IfStatement node) {
        node.condition.accept(this);
        node.thenStatement.accept(this);
        if(node.elseStatement != null)
            node.elseStatement.accept(this);
    }

    @Override
    public void visit(BreakStatement node) {
        if(loopCount == 0) {
            errorRecorder.addRecord(node.location, "there is not an outer loop statement");
        }
    }

    @Override
    public void visit(ReturnStatement node) {
        VariableType requiredType = currentFunction.returnType;
        VariableType returnedType;
        if(node.retExpression == null)
            returnedType = new PrimitiveType("void", globalSymbolTable.getPrimitiveSymbol("void"));
        else
            returnedType = node.retExpression.type;
        if(!requiredType.match(returnedType))
            errorRecorder.addRecord(node.location, "the returned type is conflict with required type");
    }

    @Override
    public void visit(BlockStatement node) {
        for(Statement s : node.statements)
            s.accept(this);
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
        node.modifiable = true;
    }

    @Override
    public void visit(LiteralExpression node) {
        node.modifiable = false;
    }

    @Override
    public void visit(ArrayExpression node) {
        node.address.accept(this);
        node.index.accept(this);
        node.modifiable = true;
    }

    @Override
    public void visit(FuncCallExpression node) {
        int parameterCount = node.functionSymbol.parameterTypes.size();
        if(node.arguments.size() != parameterCount) {
            errorRecorder.addRecord(node.location, "the number of requried arguments is different from given arguments");
        } else {
            for (int i = 0; i < parameterCount; i++) {
                if(!node.arguments.get(i).type.match(node.functionSymbol.parameterTypes.get(i)))
                    errorRecorder.addRecord(node.arguments.get(i).location, "the type of this parameter is conflict with required type");
            }
        }
        if(node.functionSymbol.returnType instanceof PrimitiveType) {
            node.modifiable = false;
        } else {
            node.modifiable = true;
        }
    }

    @Override
    public void visit(NewExpression node) {
        for(Expression e : node.exprDimensions)
            e.accept(this);
        node.modifiable = true;
    }

    @Override
    public void visit(MemberExpression node) {
        node.object.accept(this);
        if(node.methodCall != null) {
            node.methodCall.accept(this);
            node.modifiable = node.methodCall.modifiable;
        } else {
            node.modifiable = true;
        }
    }

    private boolean isStringType(VariableType type) {
        return type instanceof ClassType && ((ClassType) type).name.equals("string");
    }

    private boolean isIntType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("int");

    }

    private boolean isBoolType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("bool");
    }


    @Override
    public void visit(UnaryExpression node) {
        node.expression.accept(this);
        boolean modifiableError = false;
        boolean typeError = false;
        boolean isInt = isIntType(node.expression.type);
        boolean isBool = isBoolType(node.expression.type);
        switch(node.op) {
            case "v++": case "v--":
                if(!node.expression.modifiable)
                    modifiableError = true;
                if(!isInt)
                    typeError = true;
                node.modifiable = false;
                break;
            case "++v": case "--v":
                if(!node.expression.modifiable)
                    modifiableError = true;
                if(!isInt)
                    typeError = true;
                node.modifiable = true;
                break;
            case "!":
                if(!isBool)
                    typeError = true;
                node.modifiable = false;
                break;
            case "~":
                if(!isInt)
                    typeError = true;
                node.modifiable = false;
                break;
            default:
                assert false;
        }
        if(typeError) {
            errorRecorder.addRecord(node.location, "the type can not do this unary process ");
        } else if(modifiableError) {
            errorRecorder.addRecord(node.location, "the expression is not modifiable");
        }
    }

    @Override
    public void visit(BinaryExpression node) {
        node.lhs.accept(this);
        node.rhs.accept(this);
        if(!node.lhs.type.match(node.rhs.type)) {
            errorRecorder.addRecord(node.location, "type conflict of the binary operands");
        } else {
            boolean isInt = isIntType(node.lhs.type);
            boolean isBool = isBoolType(node.lhs.type);
            boolean isString = isStringType(node.lhs.type);
            boolean typeError = false;
            switch(node.op) {
                //  only for int
                case "*": case "/": case "%": case "-": case "<<": case ">>": case "&": case "|": case "^":
                    if(!isInt)
                        typeError = true;
                    break;
                //  for string and int
                case "<=": case ">": case "<": case ">=": case "+":
                    if(!isInt && !isString)
                        typeError = true;
                    break;
                //  for bool
                case "&&": case "||":
                    if(!isBool)
                        typeError = true;
                    break;
                //  for anything
                case "==": case "!=":
                    break;
                default:
                    assert false;
            }
            if(typeError) {
                errorRecorder.addRecord(node.location, "the type can not do this operation");
            }
        }
        node.modifiable = false;
    }

    @Override
    public void visit(TernaryExpression node) {
        node.condition.accept(this);
        if(!isBoolType(node.condition.type)) {
            errorRecorder.addRecord(node.location, "condition of ternary must be a boolean type expression");
        }
        node.exprTrue.accept(this);
        node.exprFalse.accept(this);
        if(!node.exprTrue.type.match(node.exprFalse.type))
            errorRecorder.addRecord(node.exprTrue.location, "expressions of true case and false case must be coherent");
        node.modifiable = false;
    }

    @Override
    public void visit(AssignExpression node) {
        node.lhs.accept(this);
        node.rhs.accept(this);
        if(!node.lhs.type.match(node.rhs.type))
            errorRecorder.addRecord(node.lhs.location, "type conflict between lhs and rhs of the assign expression");
        if(!node.lhs.modifiable)
            errorRecorder.addRecord(node.location, "lhs of assign expression is not modifiable");
        node.modifiable = false;
    }
}
