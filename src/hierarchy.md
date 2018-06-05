# The Structure of the Program Representation 

### Abstract Syntax Tree
    AstNode
        Program
        Declaration
            FuncDeclaration
            ClassDeclaration
            VariableDeclaration
        TypeNode
            ArrayTypeNode
            PrimitiveTypeNode
            ClassTypeNode
        Statement
            ForStatement
            WhileStatement
            IfStatement
            BreakStatement
            ReturnStatement
            BlockStatement
            VarDeclStatement
            ExprStatement
            EmptyStatement
        Expression
            IntLiteral
            BoolLiteral
            StringLiteral
            NullLiteral
            Identifier
            ArrayExpression
            FuncCallExpression
            NewExpression
            UnaryExpression
            MemberExpression
            BinaryExpression
            TernaryExpression
            AssignExpression
            
### Symbol Table Structure
    ClassSymbol
    PrimitiveSymbol
    FunctionSymbol
    VariableSymbol
    VariableType
        PrimitiveType
        ClassType
        ArrayType
    SymbolTable

### Intermediate Representation
    IRProgram
    Function
    BasicBlock
    Operand
        Address
            Register
                VirtualRegister
                PhysicalRegister
            Memory
                StackSlot
        Constant
            Immediate
            StaticData
    IRInstruction
        BinaryInst:     dest op= src (op = +,-,*,/,%,<<,>>,&,^,|,lea)
        UnaryInst:      dest = op dest (op = ~, -, inc, dec)
        Move:           dest = src
        Push:           src
        Pop:            dest
        CJump:          cond, trueBB, falseBB
        Jump:           targetBB
        Lea:            dest, mem
        Return:         src
        Allocate:       dest, size
        Call:           func(arg1,arg2,...,argn)
IRBuilder: AST -> IR(with VR, MEM, IMM，SD)

SSAOptimizer: IR(with VR, MEM, IMM) -> IR(with, VR, MEM, IMM)

StackAllocator: IR(with VR, MEM, IMM) -> IR(with VR, MEM, IMM) with VR's StackSlot info

RegisterAllocator: IR(with VR, MEM, IMM) -> IR(with )

