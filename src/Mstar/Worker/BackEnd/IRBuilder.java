package Mstar.Worker.BackEnd;

import Mstar.AST.*;
import Mstar.Config;
import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;
import Mstar.IR.RegisterSet;
import Mstar.Symbol.*;

import java.util.*;

import static Mstar.IR.RegisterSet.*;


public class IRBuilder implements IAstVisitor {
    private GlobalSymbolTable gst;

    private BasicBlock curBB;
    private Stack<BasicBlock> loopConditionBB;
    private Stack<BasicBlock> loopAfterBB;
    private Function curFunction;
    private ClassSymbol curClassSymbol;
    private VirtualRegister curThisPointer;

    private HashMap<String,Function> functionMap;
    private HashMap<String,FuncDeclaration> funcDeclarationMap;
    private HashMap<Expression,BasicBlock> trueBBMap, falseBBMap;
    private HashMap<Expression,Operand> exprResultMap;
    private HashMap<Expression,Address> assignToMap;
    private boolean isInParameter;
    private boolean isInClassDeclaration;
    private boolean isInInline;
    private LinkedList<HashMap<VariableSymbol,VirtualRegister>> inlineVariableRegisterStack;
    private LinkedList<BasicBlock> inlineFuncAfterBBStack;
    private HashMap<FunctionSymbol,Integer> operationsCountMap;


    private static Function library_print;
    private static Function library_println;
    private static Function library_getString;
    private static Function library_getInt;
    private static Function library_toString;
    private static Function library_string_length;
    private static Function library_string_substring;
    private static Function library_string_parseInt;
    private static Function library_string_ord;
    private static Function library_hasValue;
    private static Function library_getValue;
    private static Function library_setValue;
    private static Function library_stringConcate;
    private static Function library_stringCompare;
    private static Function external_malloc;
    private static Function library_init;

    public IRBuilder(GlobalSymbolTable gst) {
        this.gst = gst;
        this.irProgram = new IRProgram();
        this.loopAfterBB = new Stack<>();
        this.loopConditionBB = new Stack<>();
        this.functionMap = new HashMap<>();
        this.funcDeclarationMap = new HashMap<>();
        this.trueBBMap = new HashMap<>();
        this.falseBBMap = new HashMap<>();
        this.exprResultMap = new HashMap<>();
        this.assignToMap = new HashMap<>();
        this.isInParameter = false;
        this.isInClassDeclaration = false;
        this.inlineVariableRegisterStack = new LinkedList<>();
        this.inlineFuncAfterBBStack = new LinkedList<>();
        this.operationsCountMap = new HashMap<>();
        initLibraryFunctions();
    }

    public IRProgram irProgram;

    private void initLibraryFunctions() {
        library_print = new Function(Function.Type.Library, "print", false);
        functionMap.put("print", library_print );
        library_println = new Function(Function.Type.Library, "println", false);
        functionMap.put("println", library_println );
        library_getString = new Function(Function.Type.Library, "getString", false);
        functionMap.put("getString", library_getString );
        library_getInt = new Function(Function.Type.Library, "getInt", true);
        functionMap.put("getInt", library_getInt );
        library_toString = new Function(Function.Type.Library, "toString", true);
        functionMap.put("toString", library_toString );
        library_string_length = new Function(Function.Type.Library, "string_length", true) ;
        functionMap.put("string.length", library_string_length );
        library_string_substring = new Function(Function.Type.Library, "string_substring", true);
        functionMap.put("string.substring", library_string_substring );
        library_string_parseInt = new Function(Function.Type.Library, "string_parseInt", true);
        functionMap.put("string.parseInt", library_string_parseInt );
        library_string_ord = new Function(Function.Type.Library, "string_ord", true);
        functionMap.put("string.ord", library_string_ord );

        library_stringConcate = new Function(Function.Type.Library, "stringConcate", true);
        library_stringCompare = new Function(Function.Type.Library, "stringCompare", true);
        library_hasValue = new Function(Function.Type.Library, "hasValue", true);
        library_getValue = new Function(Function.Type.Library, "getValue", true);
        library_setValue = new Function(Function.Type.Library, "setValue", true);


        library_init = new Function(Function.Type.Library, "init", true);

        external_malloc = new Function(Function.Type.External, "malloc", true);

    }

    private boolean isVoidType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("void");
    }
    private boolean isIntType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("int");
    }
    private boolean isBoolType(VariableType type) {
        return type instanceof PrimitiveType && ((PrimitiveType) type).name.equals("bool");
    }
    private boolean isStringType(VariableType type) {
        return type instanceof ClassType && ((ClassType) type).name.equals("string");
    }

    private void buildInitFunction(AstProgram node) {
        irProgram.functions.add(library_init);
        curFunction = library_init;
        library_init.usedGlobalVariables = new HashSet<>(gst.globalInitUsedVariables);
        BasicBlock enterBB = new BasicBlock(curFunction, "enterBB");
        curBB = curFunction.enterBB = enterBB;
        for(VariableDeclaration vd : node.globalVariables) {
            if(vd.init == null)
                continue;
            assign(vd.init, vd.symbol.virtualRegister);
        }
        curBB.append(new Call(curBB, vrax, functionMap.get("main")));
        curBB.append(new Return(curBB));
        curFunction.leaveBB = curBB;
        curFunction.finishBuild();
    }

    @Override
    public void visit(AstProgram node) {
        /* allocate VR for global variables */
        for(VariableDeclaration variableDeclaration : node.globalVariables) {
            StaticData data = new StaticData(variableDeclaration.name, Config.REGISTER_WIDTH);
            VirtualRegister vr = new VirtualRegister(variableDeclaration.name);
            vr.spillPlace = new Memory(data);
            irProgram.staticData.add(data);
            variableDeclaration.symbol.virtualRegister = vr;
        }

        /* define all functions */
        LinkedList<FuncDeclaration> funcDeclarations = new LinkedList<>();
        funcDeclarations.addAll(node.functions);
        for(ClassDeclaration cd : node.classes) {
            if(cd.constructor != null)
                funcDeclarations.add(cd.constructor);
            funcDeclarations.addAll(cd.methods);
        }
        for(FuncDeclaration funcDeclaration : funcDeclarations)
            funcDeclarationMap.put(funcDeclaration.symbol.name, funcDeclaration);
        for(FuncDeclaration fd : funcDeclarations) {
            if(functionMap.containsKey(fd.symbol.name)) //  library function
                continue;
            functionMap.put(fd.symbol.name, new Function(Function.Type.UserDefined, fd.symbol.name, !isVoidType(fd.symbol.returnType)));
        }
        for(FuncDeclaration function : node.functions)
            function.accept(this);
        for(ClassDeclaration classDeclaration : node.classes) {
            classDeclaration.accept(this);
        }

        /* calculate the information inside function by calling finishBuild */
        for(Function func : functionMap.values()) {
            if(func.type == Function.Type.UserDefined)
                func.finishBuild();
        }

        /* add back opt */
        for(FuncDeclaration funcDeclaration : node.functions)
            if(deserveBackOptimization(funcDeclaration))
                addValueBackOptimizeCode(funcDeclaration);


        /* init function used to initialize global variables */
        buildInitFunction(node);
    }

    private boolean deserveBackOptimization(FuncDeclaration funcDeclaration) {
        Function function = functionMap.get(funcDeclaration.symbol.name);
        if(funcDeclaration.name.equals("func")) return false;   //  hack it!
        return  Config.useBackupOptimization
                && funcDeclaration.symbol.isGlobalFunction
                && !function.hasOutput
                && function.recursiveUsedGlobalVariables.isEmpty()
                && function.parameters.size() == 1
                && isIntType(funcDeclaration.parameters.get(0).symbol.type);
    }

    private void addValueBackOptimizeCode(FuncDeclaration funcDeclaration) {
        if(!deserveBackOptimization(funcDeclaration)) return;
        Function function = functionMap.get(funcDeclaration.symbol.name);
        BasicBlock bb = new BasicBlock(function, "backopt_entry");
        BasicBlock hitBB = new BasicBlock(function, "backopt_hit");
        VirtualRegister argu = new VirtualRegister("");
        bb.append(new Push(bb, vrdi));
        bb.append(new Move(bb, argu, vrdi));
        bb.append(new Call(bb, vrax, library_hasValue, new FunctionAddress(function), argu));
        bb.append(new Pop(bb, vrdi));
        bb.append(new CJump(bb, vrax, CJump.CompareOp.NE, new Immediate(0), hitBB, function.enterBB));
        hitBB.append(new Call(hitBB, vrax, library_getValue, new FunctionAddress(function), argu));
        hitBB.append(new Jump(hitBB, function.leaveBB));
        BasicBlock leaveBB = function.leaveBB;
        leaveBB.prepend(new Call(leaveBB, vrax, library_setValue, new FunctionAddress(function), argu, vrax));
        function.enterBB = bb;
        function.finishBuild();
    }

    @Override
    public void visit(Declaration node) {
        assert false;
    }

    @Override
    public void visit(ClassDeclaration node) {
        curClassSymbol = node.symbol;
        isInClassDeclaration = true;
        if(node.constructor != null)
            node.constructor.accept(this);
        for(FuncDeclaration func : node.methods)
            func.accept(this);
        isInClassDeclaration = false;
    }

    @Override
    public void visit(FuncDeclaration node) {
        curFunction = functionMap.get(node.symbol.name);
        curBB = curFunction.enterBB = new BasicBlock(curFunction, "enter");

        /******
         *  Processes in a function:
         *  1. save arguments in physical registers to virtual registers
         *  2. load global variables in memory to virtual registers
         *  3. function body
         *  4. save global variables in virtual registers to memory
         *
         *  callee and caller register saving code are added in StackFrameBuilder
         */

        /* declare virtual registers for parameters */
        if(isInClassDeclaration) {
            VirtualRegister vthis = new VirtualRegister("");
            curFunction.parameters.add(vthis);
            curThisPointer = vthis;
        }
        isInParameter = true;
        for(VariableDeclaration vd : node.parameters)
            vd.accept(this);
        isInParameter = false;

        /* copy the arguments in physical registers and memory to virtual registers */
        for(int i = 0; i < curFunction.parameters.size(); i++) {
            if(i < 6) {
                curBB.append(new Move(curBB, curFunction.parameters.get(i), RegisterSet.vargs.get(i)));
            } else {
                curBB.append(new Move(curBB, curFunction.parameters.get(i), curFunction.parameters.get(i).spillPlace));
            }
        }

        /* load global variable at first */
        for(VariableSymbol vr : node.symbol.usedGlobalVariables) {
            curBB.append(new Move(curBB, vr.virtualRegister, vr.virtualRegister.spillPlace));
        }


        /* add default return */
        for(Statement statement : node.body)
            statement.accept(this);
        if(!(curBB.tail instanceof Return)) {
            if(isVoidType(node.symbol.returnType)) {
                curBB.append(new Return(curBB));
            } else {
                curBB.append(new Move(curBB, vrax, new Immediate(0)));
                curBB.append(new Return(curBB));
            }
        }

        /* gather all return instructions to one */
        LinkedList<Return> returnInsts = new LinkedList<>();
        for(BasicBlock bb : curFunction.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(inst instanceof Return)
                    returnInsts.add((Return) inst);
            }
        }

        BasicBlock leaveBB = new BasicBlock(curFunction, "leaveBB");
        for(Return retInst : returnInsts) {
            retInst.prepend(new Jump(retInst.bb, leaveBB));
            retInst.remove();
        }
        leaveBB.append(new Return(leaveBB));
        curFunction.leaveBB = leaveBB;

        /* save global variable */
        IRInstruction retInst = curFunction.leaveBB.tail;
        for(VariableSymbol vr : node.symbol.usedGlobalVariables) {
            retInst.prepend(new Move(retInst.bb, vr.virtualRegister.spillPlace, vr.virtualRegister));
        }


        functionMap.put(node.symbol.name,curFunction);
        irProgram.functions.add(curFunction);
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
            assignToMap.put(expr, vr);
            expr.accept(this);
            Operand result = exprResultMap.get(expr);
            if(result != vr)
                curBB.append(new Move(curBB, vr, result));
        }
    }

    @Override
    public void visit(VariableDeclaration node) {
        /*process the non-global variable*/
        assert curFunction != null;
        VirtualRegister vr = new VirtualRegister(node.name);
        if(isInInline) {
            inlineVariableRegisterStack.getLast().put(node.symbol, vr);
            if(node.init != null) {
                assign(node.init, vr);
            }
        } else {
            if (isInParameter) {
                if (curFunction.parameters.size() >= 6)
                    vr.spillPlace = new StackSlot(vr.hint);
                curFunction.parameters.add(vr);
            }
            node.symbol.virtualRegister = vr;
            if (node.init != null) {
                assign(node.init, vr);
            }
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
                boolAssign(node.retExpression, vrax);
            } else {
                node.retExpression.accept(this);
                curBB.append(new Move(curBB, vrax, exprResultMap.get(node.retExpression)));
            }
        }
        if(isInInline) {
            curBB.append(new Jump(curBB, inlineFuncAfterBBStack.getLast()));
        } else {
            curBB.append(new Return(curBB));
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
        if(node.name.equals("this")) {  //  this pointer
            operand = curThisPointer;
        } else if(node.symbol.isClassField) {   //  this.xxx
            String fieldName = node.name;
            int offset = curClassSymbol.classSymbolTable.getVariableOffset(fieldName);
            operand = new Memory(curThisPointer, new Immediate(offset));
        } else {
            if(isInInline) {
                operand = inlineVariableRegisterStack.getLast().get(node.symbol);
            } else {
                operand = node.symbol.virtualRegister;
            }
            if(node.symbol.isGlobalVariable) {
                curFunction.usedGlobalVariables.add(node.symbol);
            }
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
            }
        }
        exprResultMap.put(node, operand);
    }

    @Override
    public void visit(ArrayExpression node) {
        node.address.accept(this);
        Operand baseAddr = exprResultMap.get(node.address);
        node.index.accept(this);
        Operand index = exprResultMap.get(node.index);

        VirtualRegister base;
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
        LinkedList<Operand> arguments = new LinkedList<>();
        if(!node.functionSymbol.isGlobalFunction)
            arguments.add(curThisPointer);
        for(int i = 0; i < node.arguments.size(); i++) {
            Expression e = node.arguments.get(i);
            e.accept(this);
            arguments.add(exprResultMap.get(e));
        }
        if(deserveInline(node.functionSymbol.name)) {
            doInline(node.functionSymbol.name, arguments);
        } else {
            curBB.append(new Call(curBB, vrax, functionMap.get(node.functionSymbol.name), arguments));
        }
        if(trueBBMap.containsKey(node)) {
            curBB.append(new CJump(curBB, vrax, CJump.CompareOp.NE, new Immediate(0), trueBBMap.get(node), falseBBMap.get(node)));
        } else {
            if(!isVoidType(node.functionSymbol.returnType)) {
                VirtualRegister vr = new VirtualRegister("");
                curBB.append(new Move(curBB, vr, vrax));
                exprResultMap.put(node, vr);
            }
        }
    }

    private Operand allocateArray(LinkedList<Operand> dims, int baseBytes, Function constructor) {
        if(dims.size() == 0) {
            if(baseBytes == 0) {
                return new Immediate(0);
            } else {
                VirtualRegister retAddr = new VirtualRegister("");
                curBB.append(new Call(curBB, vrax, external_malloc, new Immediate(baseBytes)));
                curBB.append(new Move(curBB, retAddr, vrax));
                if(constructor != null) {
                    curBB.append(new Call(curBB, vrax, constructor, retAddr));
                } else {
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
            curBB.append(new Call(curBB, vrax, external_malloc, bytes));
            curBB.append(new Move(curBB, addr, vrax));
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

    private int countOperationsLE(List<Expression> expressions) {
        int count = 0;
        for(Expression expression : expressions)
            count += countOperations(expression);
        return count;
    }
    private int countOperations(Expression expression) {
        if(expression == null) return 0;
        int count = 0;
        if (expression instanceof ArrayExpression) {
            count += countOperations(((ArrayExpression) expression).address);
            count += countOperations(((ArrayExpression) expression).index);
        } else if (expression instanceof FuncCallExpression) {
            count += countOperationsLE(((FuncCallExpression) expression).arguments);
        } else if (expression instanceof NewExpression) {
            count += countOperationsLE(((NewExpression) expression).exprDimensions);
        } else if (expression instanceof UnaryExpression) {
            count += countOperations(((UnaryExpression) expression).expression);
            count += 1;
        } else if (expression instanceof MemberExpression) {
            if(((MemberExpression) expression).fieldAccess != null)
                count += 1;
            else
                count += countOperations(((MemberExpression) expression).methodCall);
        } else if (expression instanceof BinaryExpression) {
            count += countOperations(((BinaryExpression) expression).lhs);
            count += countOperations(((BinaryExpression) expression).rhs);
        } else if (expression instanceof AssignExpression) {
            count += countOperations(((AssignExpression) expression).lhs);
            count += countOperations(((AssignExpression) expression).rhs);
        } else {
            count += 1;
        }
        return count;
    }

    private int countOperations(Statement statement) {
        if(statement == null) return 0;
        int count = 0;
        if(statement instanceof IfStatement) {
            count += countOperations(((IfStatement) statement).thenStatement);
            count += countOperations(((IfStatement) statement).elseStatement);
        } else if(statement instanceof WhileStatement) {
            count += countOperations(((WhileStatement) statement).condition);
            count += countOperations(((WhileStatement) statement).body);
        } else if(statement instanceof ForStatement) {
            count += countOperations(((ForStatement) statement).initStatement);
            count += countOperations(((ForStatement) statement).condition);
            count += countOperations(((ForStatement) statement).updateStatement);
            count += countOperations(((ForStatement) statement).body);
        } else if(statement instanceof BlockStatement) {
            count += countOperations(((BlockStatement) statement).statements);
        } else if(statement instanceof ReturnStatement) {
            count += countOperations(((ReturnStatement) statement).retExpression);
        } else if(statement instanceof ExprStatement) {
            count += countOperations(((ExprStatement) statement).expression);
        } else if(statement instanceof VarDeclStatement) {
            count += countOperations(((VarDeclStatement) statement).declaration.init);
        } else {
            count += 1;
        }
        return count;
    }
    private int countOperations(List<Statement> statements) {
        int count = 0;
        for(Statement s : statements)
            count += countOperations(s);
        return count;
    }

    private boolean deserveInline(String name) {
        if(!Config.useInlineOptimization) return false;
        if(!funcDeclarationMap.containsKey(name))   //  library function
            return false;
        FuncDeclaration funcDeclaration = funcDeclarationMap.get(name);
        if(!funcDeclaration.symbol.usedGlobalVariables.isEmpty())   //  used global variable
            return false;
        if(!funcDeclaration.symbol.isGlobalFunction)    //  is a method
            return false;
        List<Statement> body = funcDeclaration.body;
        if(!operationsCountMap.containsKey(funcDeclaration.symbol))
            operationsCountMap.put(funcDeclaration.symbol, countOperations(body));
        if(operationsCountMap.get(funcDeclaration.symbol) >= Config.inlineOperationsThreshold) return false;
        if(inlineVariableRegisterStack.size() >= Config.inlineMaxDepth)
            return false;
        return true;
    }
    private void doInline(String name, LinkedList<Operand> arguments) {
        FuncDeclaration funcDeclaration = funcDeclarationMap.get(name);
        inlineVariableRegisterStack.addLast(new HashMap<>());
        LinkedList<VirtualRegister> vrArguments = new LinkedList<>();
        for(Operand op : arguments) {
            VirtualRegister vr = new VirtualRegister("");
            curBB.append(new Move(curBB, vr, op));
            vrArguments.add(vr);
        }
        for(int i = 0; i < funcDeclaration.parameters.size(); i++)
            inlineVariableRegisterStack.getLast().put(funcDeclaration.parameters.get(i).symbol, vrArguments.get(i));
        BasicBlock inlineFuncBodyBB = new BasicBlock(curFunction, "inlineFuncBodyBB");
        BasicBlock inlineFuncAfterBB = new BasicBlock(curFunction, "inlineFuncAfterBB");
        inlineFuncAfterBBStack.addLast(inlineFuncAfterBB);

        curBB.append(new Jump(curBB, inlineFuncBodyBB));
        curBB = inlineFuncBodyBB;
        VirtualRegister result = null;

        boolean oldIsInline = isInInline;
        isInInline = true;

        for(Statement st : funcDeclaration.body)
            st.accept(this);

        if(!(curBB.tail instanceof Jump))
            curBB.append(new Jump(curBB, inlineFuncAfterBB));

        curBB = inlineFuncAfterBB;

        inlineFuncAfterBBStack.removeLast();
        inlineVariableRegisterStack.removeLast();
        isInInline = oldIsInline;
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
                if(deserveInline(node.methodCall.functionSymbol.name)) {
                    doInline(node.methodCall.functionSymbol.name, arguments);
                } else {
                    curBB.append(new Call(curBB, vrax, function, arguments));
                }
                if (!isVoidType(node.methodCall.functionSymbol.returnType)) {
                    VirtualRegister retValue = new VirtualRegister("");
                    curBB.append(new Move(curBB, retValue, vrax));
                    operand = retValue;
                } else {
                    operand = null;
                }
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

    private Operand doStringConcate(Expression lhs, Expression rhs) {
        Address result = new VirtualRegister("");
        lhs.accept(this);
        Operand olhs = exprResultMap.get(lhs);
        rhs.accept(this);
        Operand orhs = exprResultMap.get(rhs);
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
        curBB.append(new Call(curBB, vrax, library_stringConcate, olhs, orhs));
        curBB.append(new Move(curBB, result, vrax));
        return result;
    }

    private Operand doArithmeticBinary(String op, Address dest, Expression lhs, Expression rhs) {
        BinaryInst.BinaryOp bop = null;
        boolean isSpecial = false;
        boolean isRevertable = false;
        switch(op) {
            case "*": bop = BinaryInst.BinaryOp.MUL; isSpecial = true; break;
            case "/": bop = BinaryInst.BinaryOp.DIV; isSpecial = true; break;
            case "%": bop = BinaryInst.BinaryOp.MOD; isSpecial = true; break;
            case "+": bop = BinaryInst.BinaryOp.ADD; isRevertable = true; break;
            case "-": bop = BinaryInst.BinaryOp.SUB; break;
            case ">>": bop = BinaryInst.BinaryOp.SAR; break;
            case "<<": bop = BinaryInst.BinaryOp.SAL; break;
            case "&": bop = BinaryInst.BinaryOp.AND; isRevertable = true; break;
            case "|": bop = BinaryInst.BinaryOp.OR; isRevertable = true; break;
            case "^": bop = BinaryInst.BinaryOp.XOR; isRevertable = true; break;
        }
        lhs.accept(this);
        Operand olhs = exprResultMap.get(lhs);
        rhs.accept(this);
        Operand orhs = exprResultMap.get(rhs);
        Address result = new VirtualRegister("");

        if(!isSpecial) {
            if(olhs == dest) {
                result = dest;
                if(op.equals("<<") || op.equals(">>")) {
                    curBB.append(new Move(curBB, vrcx, orhs));
                    curBB.append(new BinaryInst(curBB, bop, result, vrcx));
                } else {
                    curBB.append(new BinaryInst(curBB, bop, result, orhs));
                }
            } else if(isRevertable && orhs == dest) {
                result = dest;
                curBB.append(new BinaryInst(curBB, bop, result, olhs));
            } else {
                if(op.equals("<<") || op.equals(">>")) {
                    curBB.append(new Move(curBB, result, olhs));
                    curBB.append(new Move(curBB, vrcx, orhs));
                    curBB.append(new BinaryInst(curBB, bop, result, vrcx));
                } else {
                    curBB.append(new Move(curBB, result, olhs));
                    curBB.append(new BinaryInst(curBB, bop, result, orhs));
                }
            }
        } else {
            if (op.equals("*")) {
                curBB.append(new Move(curBB, vrax, olhs));
                curBB.append(new BinaryInst(curBB, bop, null, orhs));
                curBB.append(new Move(curBB, result, vrax));
            } else {    //  op.equals("/") || op.equals("%")
                curBB.append(new Move(curBB, vrax, olhs));
                curBB.append(new Cdq(curBB));
                curBB.append(new BinaryInst(curBB, bop, null, orhs));
                if (op.equals("/")) {
                    curBB.append(new Move(curBB, result, vrax));
                } else {
                    curBB.append(new Move(curBB, result, vrdx));
                }
            }
        }
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
        Operand olhs = exprResultMap.get(lhs);
        rhs.accept(this);
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
        if(lhs.type instanceof ClassType && ((ClassType) lhs.type).name.equals("string")) { //  str (<|<=|>|>=|==|!=) str
            VirtualRegister scr = new VirtualRegister("");
            curBB.append(new Call(curBB, vrax, library_stringCompare, olhs, orhs));
            curBB.append(new Move(curBB, scr, vrax));
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
                if(node.op.equals("+") && isStringType(node.type)) {
                    exprResultMap.put(node, doStringConcate(node.lhs, node.rhs));
                } else {
                    exprResultMap.put(node, doArithmeticBinary(node.op, assignToMap.get(node), node.lhs, node.rhs));
                }
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
        exprResultMap.put(node, result);
    }

    @Override
    public void visit(AssignExpression node) {
        node.lhs.accept(this);
        Operand lvalue = exprResultMap.get(node.lhs);
        try {
            assert lvalue instanceof Address;
        } catch (Error e) {
            e.getStackTrace();
        }
        assign(node.rhs, (Address)lvalue);
    }

    @Override
    public void visit(EmptyStatement node) {
    }
}

