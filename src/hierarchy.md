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
        Register
            VirtualRegister
            PhysicalRegister
        Immediate
        StackSlot
        StaticData
        Memory
    IRInstruction
        BinaryInst:     dest op= src (op = +,-,*,/,%,<<,>>,&,^,|,lea)
        UnaryInst:      dest = op dest (op = ~, -, inc, dec)
        Move:           dest = src
        Push:           src
        Pop:            dest
        Syscall:        syscall
        CJump:          cond, trueBB, falseBB
        Jump:           targetBB
        Allocate:       dest, size
        Call:           func(arg1,arg2,...,argn)
    
