package Mstar.Worker.BackEnd;

import Mstar.AST.*;
import Mstar.Config;
import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;
import Mstar.Symbol.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.Stack;

public class IRBuilder implements IAstVisitor {
    private GlobalSymbolTable gst;
    private BasicBlock curBB;
    private Stack<BasicBlock> loopConditionBB;
    private Stack<BasicBlock> loopAfterBB;
    private Function curFunction;
    private ClassSymbol curClassSymbol;
    private VirtualRegister curThisPointer;
    private HashMap<String,Function> functionMap;
    private HashMap<Expression,BasicBlock> trueBBMap, falseBBMap;
    private HashMap<Expression,Operand> exprResultMap;
    private boolean isInParameter;
    private boolean isInClassDeclaration;


    private Function library_print;
    private Function library_println;
    private Function library_getString;
    private Function library_getInt;
    private Function library_toString;
    private Function library_string_length;
    private Function library_string_substring;
    private Function library_string_parseInt;
    private Function library_string_ord;
    private Function library_stringConcate;
    private Function library_stringCompare;
    private Function external_malloc;
    private Function library_init;

    public IRProgram irProgram;

    private void initLibraryFunctions() {
        library_print = new Function(Function.Type.Library, "print");
        functionMap.put("print", library_print );
        library_println = new Function(Function.Type.Library, "println");
        functionMap.put("println", library_println );
        library_getString = new Function(Function.Type.Library, "getString");
        functionMap.put("getString", library_getString );
        library_getInt = new Function(Function.Type.Library, "getInt");
        functionMap.put("getInt", library_getInt );
        library_toString = new Function(Function.Type.Library, "toString");
        functionMap.put("toString", library_toString );
        library_string_length = new Function(Function.Type.Library, "string_length") ;
        functionMap.put("string.length", library_string_length );
        library_string_substring = new Function(Function.Type.Library, "string_substring");
        functionMap.put("string.substring", library_string_substring );
        library_string_parseInt = new Function(Function.Type.Library, "string_parseInt");
        functionMap.put("string.parseInt", library_string_parseInt );
        library_string_ord = new Function(Function.Type.Library, "string_ord");
        functionMap.put("string.ord", library_string_ord );

        library_stringConcate = new Function(Function.Type.Library, "stringConcate");
        library_stringCompare = new Function(Function.Type.Library, "stringCompare");

        library_init = new Function(Function.Type.Library, "init");

        external_malloc = new Function(Function.Type.External, "malloc");

    }
    public IRBuilder(GlobalSymbolTable gst) {
        this.gst = gst;
        this.irProgram = new IRProgram();
        this.loopAfterBB = new Stack<>();
        this.loopConditionBB = new Stack<>();
        this.functionMap = new HashMap<>();
        this.trueBBMap = new HashMap<>();
        this.falseBBMap = new HashMap<>();
        this.exprResultMap = new HashMap<>();
        this.isInParameter = false;
        this.isInClassDeclaration = false;
        initLibraryFunctions();
    }

    private boolean isVoidType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("void");
    }
    private boolean isBoolType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("bool");
    }

    private void buildInitFunction(AstProgram node) {
        irProgram.functions.add(library_init);
        curFunction = library_init;
        BasicBlock enterBB = new BasicBlock(curFunction, "enterBB");
        curBB = curFunction.enterBB = enterBB;
        for(VariableDeclaration vd : node.globalVariables) {
            if(vd.init == null)
                continue;
            assign(vd.init, vd.symbol.virtualRegister.spillPlace);
        }
        VirtualRegister result = new VirtualRegister("");
        curBB.append(new Call(curBB, result, functionMap.get("main")));
        curBB.append(new Return(curBB, result));
        curFunction.leaveBB = curBB;
    }

    @Override
    public void visit(AstProgram node) {
        for(VariableDeclaration variableDeclaration : node.globalVariables) {
            StaticData data = new StaticData(variableDeclaration.name, Config.REGISTER_WIDTH);
            VirtualRegister vr = new VirtualRegister(variableDeclaration.name);
            vr.spillPlace = new Memory(data);
            irProgram.staticData.add(data);
            variableDeclaration.symbol.virtualRegister = vr;
        }
        LinkedList<FuncDeclaration> funcDeclarations = new LinkedList<>();
        funcDeclarations.addAll(node.functions);
        for(ClassDeclaration cd : node.classes) {
            if(cd.constructor != null)
                funcDeclarations.add(cd.constructor);
            funcDeclarations.addAll(cd.methods);
        }
        for(FuncDeclaration fd : funcDeclarations) {
            if(functionMap.containsKey(fd.symbol.name)) //  library function
                continue;
            functionMap.put(fd.symbol.name, new Function(Function.Type.UserDefined, fd.symbol.name));
        }
        for(FuncDeclaration function : node.functions)
            function.accept(this);
        for(ClassDeclaration classDeclaration : node.classes) {
            curClassSymbol = classDeclaration.symbol;
            isInClassDeclaration = true;
            classDeclaration.accept(this);
            isInClassDeclaration = false;
        }

        buildInitFunction(node);
    }

    @Override
    public void visit(Declaration node) {
        assert false;
    }

    @Override
    public void visit(FuncDeclaration node) {
        curFunction = functionMap.get(node.symbol.name);
        curBB = curFunction.enterBB = new BasicBlock(curFunction, "enter");
        isInParameter = true;
        if(isInClassDeclaration)
            curFunction.parameters.add(new VirtualRegister("this"));
        for(VariableDeclaration vd : node.parameters) {
            vd.accept(this);
        }
        isInParameter = false;
        if(isInClassDeclaration) {
            curThisPointer = curFunction.parameters.get(0);
        }
        for(Statement statement : node.body)
            statement.accept(this);
        if(!(curBB.tail instanceof Return)) {
            if(isVoidType(node.symbol.returnType)) {
                curBB.append(new Return(curBB, null));
            } else {
                curBB.append(new Return(curBB, new Immediate(0)));
            }
        }

        LinkedList<Return> returnInsts = new LinkedList<>();
        for(BasicBlock bb : curFunction.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(inst instanceof Return)
                    returnInsts.add((Return) inst);
            }
        }

        if(returnInsts.size() > 1) {
            boolean hasReturnValue = returnInsts.get(0).src != null;
            VirtualRegister vr = new VirtualRegister("return_value");
            BasicBlock leaveBB = new BasicBlock(curFunction, "leave");
            for(Return retInst : returnInsts) {
                if(hasReturnValue)
                    retInst.prepend(new Move(retInst.bb, vr, retInst.src));
                retInst.prepend(new Jump(retInst.bb, leaveBB));
                retInst.remove();
            }
            leaveBB.append(new Return(leaveBB, hasReturnValue ? vr : null));
            curFunction.leaveBB = leaveBB;
        } else {
            curFunction.leaveBB = curBB;
        }

        functionMap.put(node.symbol.name,curFunction);
        irProgram.functions.add(curFunction);
    }

    @Override
    public void visit(ClassDeclaration node) {
        if(node.constructor != null)
            node.constructor.accept(this);
        for(FuncDeclaration func : node.methods)
            func.accept(this);
    }

    private void boolAssign(Expression expr, Address vr) {
        BasicBlock trueBB = new BasicBlock(curFunction, "trueBB");
        BasicBlock falseBB = new BasicBlock(curFunction, "falseBB");
        BasicBlock mergeBB = new BasicBlock(curFunction, "merge");
        trueBBMap.put(expr, trueBB);
        falseBBMap.put(expr, falseBB);
        expr.accept(this);
        trueBB.append(new Move(trueBB, vr, new Immediate(1)));
        falseBB.append(new Move(falseBB, vr, new Immediate(0)));
        trueBB.append(new Jump(trueBB, mergeBB));
        falseBB.append(new Jump(falseBB, mergeBB));
        curBB = mergeBB;
    }

    private void assign(Expression expr, Address vr) {
        if(isBoolType(expr.type))
            boolAssign(expr, vr);
        else {
            expr.accept(this);
            curBB.append(new Move(curBB, vr, exprResultMap.get(expr)));
        }
    }

    @Override
    public void visit(VariableDeclaration node) {
        /*process the non-global variable*/
        assert curFunction != null;
        VirtualRegister vr = new VirtualRegister(node.name);
        if(isInParameter)
            curFunction.parameters.add(vr);
        vr.spillPlace = new StackSlot(node.name);
        node.symbol.virtualRegister = vr;
        if(node.init != null) {
            assign(node.init, vr);
        }
    }

    @Override
    public void visit(TypeNode node) {
        assert false;
    }

    @Override
    public void visit(ArrayTypeNode node) {
        assert false;
    }

    @Override
    public void visit(PrimitiveTypeNode node) {
        assert false;
    }

    @Override
    public void visit(ClassTypeNode node) {
        assert false;
    }

    @Override
    public void visit(Statement node) {
        assert false;
    }

    @Override
    public void visit(ForStatement node) {
        if(node.initStatement != null) {
            node.initStatement.accept(this);
        }
        BasicBlock bodyBB = new BasicBlock(curFunction, "forBodyBB");
        BasicBlock afterBB = new BasicBlock(curFunction, "forAfterBB");
        BasicBlock condBB = node.condition == null ? bodyBB : new BasicBlock(curFunction, "forCondBB");
        BasicBlock updateBB = node.updateStatement == null ? condBB : new BasicBlock(curFunction, "forUpdateBB");
        curBB.append(new Jump(curBB, condBB));
        loopConditionBB.push(condBB);
        loopAfterBB.push(afterBB);
        if(node.condition != null) {
            assert isBoolType(node.condition.type);
            trueBBMap.put(node.condition, bodyBB);
            falseBBMap.put(node.condition, afterBB);
            curBB = condBB;
            node.condition.accept(this);
        }
        curBB = bodyBB;
        node.body.accept(this);
        curBB.append(new Jump(curBB, updateBB));
        if(node.updateStatement != null) {
            curBB = updateBB;
            node.updateStatement.accept(this);
            curBB.append(new Jump(curBB, condBB));
        }
        curBB = afterBB;
        loopAfterBB.pop();
        loopConditionBB.pop();
    }

    @Override
    public void visit(WhileStatement node) {
        BasicBlock condBB = new BasicBlock(curFunction, "whileCondBB");
        BasicBlock bodyBB = new BasicBlock(curFunction, "whileBodyBB");
        BasicBlock afterBB = new BasicBlock(curFunction, "whileAfterBB");
        curBB.append(new Jump(curBB, condBB));
        loopConditionBB.push(condBB);
        loopAfterBB.push(afterBB);
        curBB = condBB;
        assert isBoolType(node.condition.type);
        trueBBMap.put(node.condition, bodyBB);
        falseBBMap.put(node.condition, afterBB);
        node.condition.accept(this);
        curBB = bodyBB;
        node.body.accept(this);
        curBB.append(new Jump(curBB, condBB));
        curBB = afterBB;
        loopConditionBB.pop();
        loopAfterBB.pop();
    }

    @Override
    public void visit(IfStatement node) {
        BasicBlock thenBB = new BasicBlock(curFunction, "ifThenBB");
        BasicBlock afterBB = new BasicBlock(curFunction, "ifAfterBB");
        BasicBlock elseBB = node.elseStatement == null ? afterBB :
                new BasicBlock(curFunction, "ifElseBB");
        trueBBMap.put(node.condition, thenBB);
        falseBBMap.put(node.condition, elseBB);
        node.condition.accept(this);
        curBB = thenBB;
        node.thenStatement.accept(this);
        curBB.append(new Jump(curBB, afterBB));
        if(node.elseStatement != null) {
            curBB = elseBB;
            node.elseStatement.accept(this);
            curBB.append(new Jump(curBB, afterBB));
        }
        curBB = afterBB;
    }

    @Override
    public void visit(ContinueStatement node) {
        curBB.append(new Jump(curBB, loopConditionBB.peek()));
    }

    @Override
    public void visit(BreakStatement node) {
        curBB.append(new Jump(curBB, loopAfterBB.peek()));
    }

    @Override
    public void visit(ReturnStatement node) {
        if(node.retExpression != null) {
            if(isBoolType(node.retExpression.type)) {
                VirtualRegister vr = new VirtualRegister("single_ret");
                boolAssign(node.retExpression, vr);
                curBB.append(new Return(curBB, vr));
            } else {
                node.retExpression.accept(this);
                curBB.append(new Return(curBB, exprResultMap.get(node.retExpression)));
            }
        } else {
            curBB.append(new Return(curBB, null));
        }
    }

    @Override
    public void visit(BlockStatement node) {
        for(Statement statement : node.statements)
            statement.accept(this);
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
        Operand operand;
        if(node.name.equals("this")) {
            operand = curThisPointer;
        } else if(node.symbol.isClassField) {
            String fieldName = node.name;
            int offset = curClassSymbol.classSymbolTable.getVariableOffset(fieldName);
            operand = new Memory(curThisPointer, new Immediate(offset));
        } else {
            operand = node.symbol.virtualRegister;
        }
        if (trueBBMap.containsKey(node)) {
            curBB.append(new CJump(curBB, operand, CJump.CompareOp.NE,
                    new Immediate(0), trueBBMap.get(node), falseBBMap.get(node)));
        } else {
            exprResultMap.put(node, operand);
        }
    }

    @Override
    public void visit(LiteralExpression node) {
        Operand operand;
        switch(node.typeName) {
            case "int":
                operand = new Immediate(Integer.valueOf(node.value));
                break;
            case "null":
                operand = new Immediate(0);
                break;
            case "bool": {
                curBB.append(new Jump(curBB, node.value.equals("true") ? trueBBMap.get(node) : falseBBMap.get(node)));
                return;
            }
            default:    //case "string":
            {
                StaticData sd = new StaticData("static_string", node.value.substring(1, node.value.length()-1));
                irProgram.staticData.add(sd);
                operand = sd;
//                operand = new Memory(sd);
            }
        }
        exprResultMap.put(node, operand);
    }

    @Override
    public void visit(ArrayExpression node) {
        node.address.accept(this);
        node.index.accept(this);

        VirtualRegister base;
        Operand baseAddr = exprResultMap.get(node.address);
        Operand index = exprResultMap.get(node.index);
        if(baseAddr instanceof Register) {
            base = (VirtualRegister) baseAddr;
        } else {
            base = new VirtualRegister("");
            curBB.append(new Move(curBB, base, baseAddr));
        }
        Memory memory;

        if(index instanceof Immediate) {
            memory = new Memory(base, new Immediate(((Immediate) index).value * Config.REGISTER_WIDTH + Config.REGISTER_WIDTH));
        } else if(index instanceof Register) {
            memory = new Memory(base, (Register) index, Config.REGISTER_WIDTH, new Immediate(Config.REGISTER_WIDTH));
        } else if(index instanceof Memory){
            VirtualRegister vr = new VirtualRegister("");
            curBB.append(new Move(curBB, vr, index));
            memory = new Memory(base, vr, Config.REGISTER_WIDTH, new Immediate(Config.REGISTER_WIDTH));
        } else {
            assert false;
            memory = null;
        }
        if(trueBBMap.containsKey(node))
            curBB.append(new CJump(curBB, memory, CJump.CompareOp.NE, new Immediate(0), trueBBMap.get(node), falseBBMap.get(node)));
        else
            exprResultMap.put(node, memory);
    }

    @Override
    public void visit(FuncCallExpression node) {
        VirtualRegister dest;
        LinkedList<Operand> args = new LinkedList<>();
        if(isVoidType(node.functionSymbol.returnType)) {
            dest = null;
        } else {
            dest = new VirtualRegister("call_ret");
        }

        for(Expression e : node.arguments) {
            e.accept(this);
            Operand arg = exprResultMap.get(e);
            args.add(arg);
        }

        curBB.append(new Call(curBB, dest, functionMap.get(node.functionSymbol.name), args));
        if(trueBBMap.containsKey(node)) {
            curBB.append(new CJump(curBB, dest, CJump.CompareOp.NE, new Immediate(0), trueBBMap.get(node), falseBBMap.get(node)));
        } else {
            exprResultMap.put(node, dest);
        }
    }

    private Operand allocateArray(LinkedList<Operand> dims, int baseBytes, Function constructor) {
        if(dims.size() == 0) {
            if(baseBytes == 0) {
                return new Immediate(0);
            } else {
                VirtualRegister retAddr = new VirtualRegister("");
                curBB.append(new Call(curBB, retAddr, external_malloc, new Immediate(baseBytes)));
                if(constructor != null)
                    curBB.append(new Call(curBB, null, constructor, retAddr));
                else {
                    if(baseBytes == Config.REGISTER_WIDTH) {
                        curBB.append(new Move(curBB, new Memory(retAddr), new Immediate(0)));
                    } else if(baseBytes == Config.REGISTER_WIDTH * 2) {  //  maybe string
                        curBB.append(new BinaryInst(curBB, BinaryInst.BinaryOp.ADD, retAddr, new Immediate(Config.REGISTER_WIDTH)));
                        curBB.append(new Move(curBB, new Memory(retAddr), new Immediate(0)));
                        curBB.append(new BinaryInst(curBB, BinaryInst.BinaryOp.SUB, retAddr, new Immediate(Config.REGISTER_WIDTH)));
                    }
                }
                return retAddr;
            }
        } else {
            VirtualRegister addr = new VirtualRegister("");
            VirtualRegister size = new VirtualRegister("");
            VirtualRegister bytes = new VirtualRegister("");
            curBB.append(new Move(curBB, size, dims.get(0)));
            curBB.append(new Lea(curBB, bytes, new Memory(size, Config.REGISTER_WIDTH, new Immediate(Config.REGISTER_WIDTH))));
            curBB.append(new Call(curBB, addr, external_malloc, bytes));
            curBB.append(new Move(curBB, new Memory(addr), size));
            BasicBlock condBB = new BasicBlock(curFunction, "allocateCondBB");
            BasicBlock bodyBB = new BasicBlock(curFunction, "allocateBodyBB");
            BasicBlock afterBB = new BasicBlock(curFunction, "allocateAfterBB");
            curBB.append(new Jump(curBB, condBB));
            condBB.append(new CJump(condBB, size, CJump.CompareOp.G, new Immediate(0), bodyBB, afterBB));
            curBB = bodyBB;
            if(dims.size() == 1) {
                Operand pointer = allocateArray(new LinkedList<>(), baseBytes, constructor);
                curBB.append(new Move(curBB, new Memory(addr, size, Config.REGISTER_WIDTH), pointer));
            } else {
                LinkedList<Operand> remainDims = new LinkedList<>();
                for(int i = 1; i < dims.size(); i++)
                    remainDims.add(dims.get(i));
                Operand pointer = allocateArray(remainDims, baseBytes, constructor);
                curBB.append(new Move(curBB, new Memory(addr, size, Config.REGISTER_WIDTH), pointer));
            }
            curBB.append(new UnaryInst(curBB, UnaryInst.UnaryOp.DEC, size));
            curBB.append(new Jump(curBB, condBB));
            curBB = afterBB;
            return addr;
        }
    }

    @Override
    public void visit(NewExpression node) {
        Function constructor;
        if(node.restDemension == 0) {
            if(node.type instanceof ClassType) {
                ClassType classType = (ClassType) node.type;
                if(classType.name.equals("string"))
                    constructor = null;
                else {
                    FunctionSymbol fs = classType.symbol.classSymbolTable.getFunctionSymbol(classType.name);
                    if(fs == null)
                        constructor = null;
                    else
                        constructor = functionMap.get(fs.name);
                }
            } else {
                constructor = null;
            }
        } else {
            constructor = null;
        }
        LinkedList<Operand> dims = new LinkedList<>();
        for(Expression expr : node.exprDimensions) {
            expr.accept(this);
            dims.add(exprResultMap.get(expr));
        }
        if(node.restDemension > 0 || node.typeNode instanceof PrimitiveTypeNode ) {
            Operand pointer = allocateArray(dims, 0, null);
            exprResultMap.put(node, pointer);
        } else {
            int bytes;
            if(node.type instanceof ClassType && ((ClassType) node.type).name.equals("string"))
                bytes = Config.REGISTER_WIDTH * 2;
            else
                bytes = node.type.getBytes();
            Operand pointer = allocateArray(dims, bytes, constructor);
            exprResultMap.put(node, pointer);
        }
    }

    @Override
    public void visit(MemberExpression node) {
        VirtualRegister baseAddr = new VirtualRegister("");
        node.object.accept(this);
        curBB.append(new Move(curBB, baseAddr, exprResultMap.get(node.object)));

        if(node.object.type instanceof ArrayType) { //  for size
            exprResultMap.put(node, new Memory(baseAddr));
        } else if(node.object.type instanceof ClassType) {
            ClassType classType = (ClassType) node.object.type;
            Operand operand;
            if(node.fieldAccess != null) {
                String fieldName = node.fieldAccess.name;
                int offset = classType.symbol.classSymbolTable.getVariableOffset(fieldName);
                operand = new Memory(baseAddr, new Immediate(offset));
            } else {
                Function function = functionMap.get(node.methodCall.functionSymbol.name);
                LinkedList<Operand> arguments = new LinkedList<>();
                arguments.add(baseAddr);
                for(Expression expression : node.methodCall.arguments) {
                    expression.accept(this);
                    Operand arg = exprResultMap.get(expression);
                    arguments.add(arg);
                }
                VirtualRegister retValue = isVoidType(node.methodCall.functionSymbol.returnType) ? null : new VirtualRegister("");
                curBB.append(new Call(curBB, retValue, function, arguments));
                operand = retValue;
            }
            if(trueBBMap.containsKey(node)) {
                curBB.append(new CJump(curBB, operand, CJump.CompareOp.NE, new Immediate(0), trueBBMap.get(node), falseBBMap.get(node)));
            } else {
                exprResultMap.put(node, operand);
            }
        } else {
            assert false;
        }
    }

    @Override
    public void visit(UnaryExpression node) {
        if(node.op.equals("!")) {
            trueBBMap.put(node.expression, falseBBMap.get(node));
            falseBBMap.put(node.expression, trueBBMap.get(node));
            node.expression.accept(this);
            return;
        }
        node.expression.accept(this);

        Operand operand = exprResultMap.get(node.expression);
        switch(node.op) {
            case "v++": case "v--": {
                assert operand instanceof Address;
                VirtualRegister oldValue = new VirtualRegister("");
                curBB.append(new Move(curBB, oldValue, operand));
                curBB.append(new UnaryInst(curBB, node.op.equals("v++") ? UnaryInst.UnaryOp.INC : UnaryInst.UnaryOp.DEC, (Address) operand));
                exprResultMap.put(node, oldValue);
            }
            break;
            case "++v": case "--v": {
                assert operand instanceof Address;
                curBB.append(new UnaryInst(curBB, node.op.equals("++v") ? UnaryInst.UnaryOp.INC : UnaryInst.UnaryOp.DEC, (Address) operand));
                exprResultMap.put(node, operand);
            }
            break;
            case "+": {
                exprResultMap.put(node, operand);
            }
            break;
            case "-": case "~":{
                VirtualRegister vr = new VirtualRegister("");
                curBB.append(new Move(curBB, vr, operand));
                curBB.append(new UnaryInst(curBB, node.op.equals("-") ? UnaryInst.UnaryOp.NEG : UnaryInst.UnaryOp.NOT, vr));
                exprResultMap.put(node, vr);
            }
            break;
            default: assert false;
        }
    }


    private Operand doArithmeticBinary(String op, Expression lhs, Expression rhs) {
        lhs.accept(this);
        rhs.accept(this);
        Operand olhs = exprResultMap.get(lhs);
        Operand orhs = exprResultMap.get(rhs);
        VirtualRegister result = new VirtualRegister("");
        if(op.equals("+") && lhs.type instanceof ClassType) {
            VirtualRegister vr;
            if(olhs instanceof Memory && !(olhs instanceof StackSlot)) {
                vr = new VirtualRegister("");
                curBB.append(new Move(curBB, vr, olhs));
                olhs = vr;
            }
            if(orhs instanceof Memory && !(orhs instanceof StackSlot)) {
                vr = new VirtualRegister("");
                curBB.append(new Move(curBB, vr, orhs));
                orhs = vr;
            }
            curBB.append(new Call(curBB, result, library_stringConcate, olhs, orhs));
            return result;
        }

        BinaryInst.BinaryOp bop = null;
        switch(op) {
            case "*": bop = BinaryInst.BinaryOp.MUL; break;
            case "/": bop = BinaryInst.BinaryOp.DIV; break;
            case "%": bop = BinaryInst.BinaryOp.MOD; break;
            case "+": bop = BinaryInst.BinaryOp.ADD; break;
            case "-": bop = BinaryInst.BinaryOp.SUB; break;
            case ">>": bop = BinaryInst.BinaryOp.SHR; break;
            case "<<": bop = BinaryInst.BinaryOp.SHL; break;
            case "&": bop = BinaryInst.BinaryOp.AND; break;
            case "|": bop = BinaryInst.BinaryOp.OR; break;
            case "^": bop = BinaryInst.BinaryOp.XOR; break;
        }
        curBB.append(new Move(curBB, result, olhs));
        if((op.equals("*") || op.equals("/") || op.equals("%")) && !(orhs instanceof Register)) {
            /*
                TODO: to implement a optimization here
             */
            VirtualRegister vr = new VirtualRegister("");
            curBB.append(new Move(curBB, vr, orhs));
            orhs = vr;
        }
        curBB.append(new BinaryInst(curBB, bop, result, orhs));
        return result;
    }
    private void doLogicalBinary(String op, Expression lhs, Expression rhs, BasicBlock trueBB, BasicBlock falseBB) {
        BasicBlock checkSecondBB = new BasicBlock(curFunction, "secondConditionBB");
        if(op.equals("&&")) {
            falseBBMap.put(lhs, falseBB);
            trueBBMap.put(lhs, checkSecondBB);
        } else {
            trueBBMap.put(lhs, trueBB);
            falseBBMap.put(lhs, checkSecondBB);
        }
        lhs.accept(this);
        curBB = checkSecondBB;
        trueBBMap.put(rhs, trueBB);
        falseBBMap.put(rhs, falseBB);
        rhs.accept(this);
    }
    private void doRelationBinary(String op, Expression lhs, Expression rhs, BasicBlock trueBB, BasicBlock falseBB) {
        lhs.accept(this);
        rhs.accept(this);
        Operand olhs = exprResultMap.get(lhs);
        Operand orhs = exprResultMap.get(rhs);

        CJump.CompareOp cop = null;
        switch(op) {
            case ">": cop = CJump.CompareOp.G; break;
            case "<": cop = CJump.CompareOp.L; break;
            case ">=": cop = CJump.CompareOp.GE; break;
            case "<=": cop = CJump.CompareOp.LE; break;
            case "==": cop = CJump.CompareOp.E; break;
            case "!=": cop = CJump.CompareOp.NE; break;
        }
        if(lhs.type instanceof ClassType) { //  str (<|<=|>|>=|==|!=) str
            VirtualRegister scr = new VirtualRegister("");
            curBB.append(new Call(curBB, scr, library_stringCompare, olhs, orhs));
            curBB.append(new CJump(curBB, scr, cop, new Immediate(0), trueBB, falseBB));
        } else {
            if(olhs instanceof Memory && orhs instanceof Memory) {
                VirtualRegister vr = new VirtualRegister("");
                curBB.append(new Move(curBB, vr, olhs));
                olhs = vr;
            }
            curBB.append(new CJump(curBB, olhs, cop, orhs, trueBB, falseBB));
        }
    }

    @Override
    public void visit(BinaryExpression node) {
        switch(node.op) {
            case "*": case "/": case "%": case "+": case "-":
            case ">>": case "<<": case "&": case "|": case "^":
                exprResultMap.put(node, doArithmeticBinary(node.op, node.lhs, node.rhs));
                break;
            case "<": case ">": case "==": case ">=": case "<=": case "!=":
                doRelationBinary(node.op, node.lhs, node.rhs, trueBBMap.get(node), falseBBMap.get(node));
                break;
            case "&&": case "||":
                doLogicalBinary(node.op, node.lhs, node.rhs, trueBBMap.get(node), falseBBMap.get(node));
                break;
            default:
                assert false;
        }
    }

    @Override
    public void visit(TernaryExpression node) {
        BasicBlock thenBB = new BasicBlock(curFunction, "ternaryThenBB");
        BasicBlock elseBB = new BasicBlock(curFunction, "ternaryElseBB");
        BasicBlock mergeBB = new BasicBlock(curFunction, "ternaryMergeBB");
        trueBBMap.put(node.condition, thenBB);
        falseBBMap.put(node.condition, elseBB);
        VirtualRegister result = new VirtualRegister("");
        node.condition.accept(this);
        curBB = thenBB;
        assign(node.exprTrue, result);
        curBB.append(new Jump(curBB, mergeBB));
        curBB = elseBB;
        assign(node.exprFalse, result);
        curBB.append(new Jump(curBB, mergeBB));
        curBB = mergeBB;
    }

    @Override
    public void visit(AssignExpression node) {
        node.lhs.accept(this);
        Operand lvalue = exprResultMap.get(node.lhs);
        assert lvalue instanceof Address;
        assign(node.rhs, (Address)lvalue);
    }
}

