package mstar.compile;

import mstar.ast.*;
import mstar.parser.MstarBaseVisitor;
import mstar.parser.MstarParser.*;

import java.util.LinkedList;
import java.util.List;

import static mstar.parser.MstarParser.*;


public class AstBuilder extends MstarBaseVisitor<Object> {
    public Program program;
    public ErrorRecorder errorRecorder;

    public AstBuilder(ErrorRecorder errorRecorder) {
        this.program = new Program();
        this.program.location = new TokenLocation(0,0);
        this.errorRecorder = errorRecorder;
    }

    @Override public Object visitCompilationUnit(CompilationUnitContext ctx) {
        for(GlobalDeclarationContext c : ctx.globalDeclaration()) {
            if(c.classDeclaration() != null)
                program.classes.add(visitClassDeclaration(c.classDeclaration()));
            else if(c.functionDeclaration() != null)
                program.functions.add(visitFunctionDeclaration(c.functionDeclaration()));
            else
                program.globalVariables.addAll(visitVariableDeclaration(c.variableDeclaration()));
        }
        return null;
    }
    @Override public FuncDeclaration visitFunctionDeclaration(FunctionDeclarationContext ctx) {
        FuncDeclaration funcDeclaration = new FuncDeclaration();
        funcDeclaration.retTypeNode = visitType(ctx.type());
        funcDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        funcDeclaration.parameters = visitParameterList(ctx.parameterList());
        funcDeclaration.body = visitStatementList(ctx.functionBody().statementList());
        funcDeclaration.location = funcDeclaration.retTypeNode.location;
        return funcDeclaration;
    }
    @Override public ClassDeclaration visitClassDeclaration(ClassDeclarationContext ctx) {
        ClassDeclaration classDeclaration = new ClassDeclaration();
        classDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        classDeclaration.location = new TokenLocation(ctx);
        classDeclaration.methods = new LinkedList<>();
        classDeclaration.fields = new LinkedList<>();

        //  constructor
        for(ConstructorDeclarationContext c : ctx.constructorDeclaration()) {
            if(classDeclaration.constructor == null)
                classDeclaration.constructor = visitConstructorDeclaration(ctx.constructorDeclaration(0));
            else
                errorRecorder.addRecord(new TokenLocation(c), "class can have at most one constructor");
        }
        if(classDeclaration.constructor == null)
            classDeclaration.constructor = FuncDeclaration.defaultConstructor(classDeclaration.name);

        //  fields
        for(FieldDeclarationContext c : ctx.fieldDeclaration()) {
            classDeclaration.fields.addAll(visitFieldDeclaration(c));
        }

        //  methods
        for(FunctionDeclarationContext c : ctx.functionDeclaration()) {
            classDeclaration.methods.add(visitFunctionDeclaration(c));
        }

        return classDeclaration;
    }
    @Override public FuncDeclaration visitConstructorDeclaration(ConstructorDeclarationContext ctx) {
        FuncDeclaration constructor = new FuncDeclaration();
        constructor.location = new TokenLocation(ctx);
        constructor.retTypeNode = null;
        constructor.name = ctx.IDENTIFIER().getSymbol().getText();
        constructor.parameters = visitParameterList(ctx.parameterList());
        constructor.body = visitStatementList(ctx.functionBody().statementList());
        constructor.location = new TokenLocation(ctx);
        return constructor;
    }
    @Override public List<VariableDeclaration> visitFieldDeclaration(FieldDeclarationContext ctx) {
        List<VariableDeclaration> fields = new LinkedList<>();
        List<VariableDeclaration> untyped_fields = visitVariableDeclarators(ctx.variableDeclarators());
        TypeNode typeNode = visitType(ctx.type());
        for(VariableDeclaration v : untyped_fields) {
            VariableDeclaration field = new VariableDeclaration();
            field.location = new TokenLocation(v);
            field.typeNode = typeNode;
            field.name = v.name;
            field.init = v.init;
            fields.add(field);
        }
        return fields;
    }

    @Override public TypeNode visitType(TypeContext ctx) {
        if(ctx.empty() == null) {     //  atom type
            return visitAtomType(ctx.atomType());
        } else {    //  array type
            ArrayTypeNode arrayTypeNode = new ArrayTypeNode();
            arrayTypeNode.location = new TokenLocation(ctx);
            arrayTypeNode.baseType = visitAtomType(ctx.atomType());
            arrayTypeNode.dimension = ctx.empty().size();
            return arrayTypeNode;
        }
    }
    @Override public PrimitiveTypeNode visitPrimitiveType(PrimitiveTypeContext ctx) {
        PrimitiveTypeNode primitiveTypeNode = new PrimitiveTypeNode();
        primitiveTypeNode.location = new TokenLocation(ctx);
        primitiveTypeNode.primitiveType = ctx.token.getText();
        return primitiveTypeNode;
    }
    @Override public TypeNode visitAtomType(AtomTypeContext ctx) {
        if(ctx.primitiveType() != null)
            return visitPrimitiveType(ctx.primitiveType());
        else
            return visitClassType(ctx.classType());
    }
    @Override public ClassTypeNode visitClassType(ClassTypeContext ctx) {
        ClassTypeNode classTypeNode = new ClassTypeNode();
        classTypeNode.location = new TokenLocation(ctx);
        classTypeNode.className = ctx.IDENTIFIER().getSymbol().getText();
        return classTypeNode;
    }
    @Override public List<VariableDeclaration> visitParameterList(ParameterListContext ctx) {
        List<VariableDeclaration> parameters = new LinkedList<>();
        if(ctx != null) {
            for (ParameterContext c : ctx.parameter()) {
                parameters.add((VariableDeclaration) c.accept(this));
            }
        }
        return parameters;
    }
    @Override public VariableDeclaration visitParameter(ParameterContext ctx) {
        VariableDeclaration variableDeclaration = new VariableDeclaration();
        variableDeclaration.location = new TokenLocation(ctx);
        variableDeclaration.typeNode = (TypeNode)ctx.type().accept(this);
        variableDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        variableDeclaration.init = null;
        return variableDeclaration;
    }
    @Override public List<Statement> visitStatementList(StatementListContext ctx) {
        List<Statement> statements = new LinkedList<>();
        if(ctx.statement() != null) {
            for (StatementContext c : ctx.statement()) {
                if(c instanceof VarDeclStatementContext) {
                    statements.addAll(visitVarDeclStatement((VarDeclStatementContext) c));
                } else {
                    statements.add((Statement) c.accept(this));
                }
            }
        }
        return statements;
    }
    @Override public Statement visitIfStatement(IfStatementContext ctx) {
        IfStatement ifStatement = new IfStatement();
        ifStatement.location = new TokenLocation(ctx);
        ifStatement.condition = (Expression)ctx.expression().accept(this);
        ifStatement.thenStatement = (Statement)ctx.statement(0).accept(this);
        if(ctx.statement(1) != null)
            ifStatement.elseStatement = (Statement)ctx.statement(1).accept(this);
        return ifStatement;
    }
    @Override public Statement visitWhileStatement(WhileStatementContext ctx) {
        WhileStatement whileStatement = new WhileStatement();
        whileStatement.location = new TokenLocation(ctx);
        whileStatement.condition = (Expression)ctx.expression().accept(this);
        whileStatement.body = (Statement)ctx.statement().accept(this);
        return whileStatement;
    }
    @Override public Statement visitForStatement(ForStatementContext ctx) {
        ForStatement forStatement = new ForStatement();
        forStatement.location = new TokenLocation(ctx);
        if(ctx.expression(0) != null)
            forStatement.initStatement = new ExprStatement((Expression)ctx.expression(0).accept(this));
        if(ctx.expression(1) != null)
            forStatement.condition = (Expression)ctx.expression(1).accept(this);
        if(ctx.expression(2) != null)
            forStatement.updateStatement = new ExprStatement((Expression)ctx.expression(2).accept(this));
        forStatement.body = (Statement)ctx.statement().accept(this);
        return forStatement;
    }
    @Override public BreakStatement visitBreakStatement(BreakStatementContext ctx) {
        BreakStatement breakStatement = new BreakStatement();
        breakStatement.location = new TokenLocation(ctx);
        return breakStatement;
    }
    @Override public ContinueStatement visitContinueStatement(ContinueStatementContext ctx) {
        ContinueStatement continueStatement = new ContinueStatement();
        continueStatement.location = new TokenLocation(ctx);
        return continueStatement;
    }
    @Override public ReturnStatement visitReturnStatement(ReturnStatementContext ctx) {
        ReturnStatement returnStatement = new ReturnStatement();
        returnStatement.location = new TokenLocation(ctx);
        if(ctx.expression() != null)
            returnStatement.retExpression = (Expression)ctx.expression().accept(this);
        return returnStatement;
    }
    @Override public List<Statement> visitVarDeclStatement(VarDeclStatementContext ctx) {
        List<VariableDeclaration> declarations = visitVariableDeclaration(ctx.variableDeclaration());
        List<Statement> statements = new LinkedList<>();
        for(VariableDeclaration declaration : declarations) {
            VarDeclStatement statement = new VarDeclStatement();
            statement.location = new TokenLocation(declaration);
            statement.declaration = declaration;
            statements.add(statement);
        }
        return statements;
    }
    @Override public Statement visitExprStatement(ExprStatementContext ctx) {
        ExprStatement exprStatement = new ExprStatement();
        exprStatement.location = new TokenLocation(ctx);
        exprStatement.expression = (Expression)ctx.expression().accept(this);
        return exprStatement;
    }
    @Override public Statement visitBlockStatement(BlockStatementContext ctx) {
        BlockStatement blockStatement = new BlockStatement();
        blockStatement.location = new TokenLocation(ctx);
        blockStatement.statements = visitStatementList(ctx.statementList());
        return blockStatement;
    }
    @Override public EmptyStatement visitEmptyStatement(EmptyStatementContext ctx) {
        EmptyStatement emptyStatement = new EmptyStatement();
        emptyStatement.location = new TokenLocation(ctx);
        return emptyStatement;
    }
    @Override public List<VariableDeclaration> visitVariableDeclaration(VariableDeclarationContext ctx) {
        TypeNode typeNode = visitType(ctx.type());
        List<VariableDeclaration> declarations = visitVariableDeclarators(ctx.variableDeclarators());
        for(VariableDeclaration c : declarations)
            c.typeNode = typeNode;
        return declarations;
    }
    @Override public List<VariableDeclaration> visitVariableDeclarators(VariableDeclaratorsContext ctx) {
        List<VariableDeclaration> declarations = new LinkedList<>();
        for(VariableDeclaratorContext c : ctx.variableDeclarator()) {
            declarations.add(visitVariableDeclarator(c));
        }
        return declarations;
    }
    @Override public VariableDeclaration visitVariableDeclarator(VariableDeclaratorContext ctx) {
        VariableDeclaration declaration = new VariableDeclaration();
        declaration.location = new TokenLocation(ctx);
        declaration.typeNode = null;
        declaration.name = ctx.IDENTIFIER().getSymbol().getText();
        if(ctx.expression() == null)
            declaration.init = null;
        else
            declaration.init = (Expression)ctx.expression().accept(this);
        return declaration;
    }
    @Override public Expression visitPrimaryExpression(PrimaryExpressionContext ctx) {
        if(ctx.token == null)
            return (Expression)ctx.expression().accept(this);
        else
            return new LiteralExpression(ctx.token);
        switch(ctx.token.getType()) {
            case THIS:
                return new Identifier(ctx.token);
            case INT_LITERAL:
                return new IntLiteral(ctx.token);
            case STRING_LITERAL:
                return new StringLiteral(ctx.token);
            case BOOL_LITERAL:
                return new BoolLiteral(ctx.token);
            case NULL_LITERAL:
                return new NullLiteral(ctx.token);
            default:    //  Identifier
                return new Identifier(ctx.token);
        }
    }
    @Override public Expression visitBinaryExpression(BinaryExpressionContext ctx) {
        BinaryExpression expression = new BinaryExpression();
        expression.location = new TokenLocation(ctx);
        expression.op = ctx.bop.getText();
        expression.lhs = (Expression)ctx.expression(0).accept(this);
        expression.rhs = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitArrayExpreesion(ArrayExpreesionContext ctx) {
        ArrayExpression expression = new ArrayExpression();
        expression.location = new TokenLocation(ctx);
        expression.address = (Expression)ctx.expression(0).accept(this);
        expression.index = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitNewExpression(NewExpressionContext ctx) { return visitCreator(ctx.creator()); }
    @Override public Expression visitAssignExpression(AssignExpressionContext ctx) {
        AssignExpression expression = new AssignExpression();
        expression.location = new TokenLocation(ctx);
        expression.lhs = (Expression)ctx.expression(0).accept(this);
        expression.rhs = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitUnaryExpression(UnaryExpressionContext ctx) {
        UnaryExpression expression = new UnaryExpression();
        expression.location = new TokenLocation(ctx);
        if(ctx.postfix != null) {
            if(ctx.postfix.getText().equals("++"))
                expression.op = "v++";
            else
                expression.op = "v--";
        } else {
            switch(ctx.prefix.getText()) {
                case "++":
                    expression.op = "++v";
                    break;
                case "--":
                    expression.op = "--v";
                    break;
                default:
                    expression.op = ctx.prefix.getText();
            }
        }
        expression.expression = (Expression)ctx.expression().accept(this);
        return expression;
    }
    @Override public Expression visitTernaryExpression(TernaryExpressionContext ctx) {
        TernaryExpression expression = new TernaryExpression();
        expression.location = new TokenLocation(ctx);
        expression.condition = (Expression)ctx.expression(0).accept(this);
        expression.expr1= (Expression)ctx.expression(1).accept(this);
        expression.expr2= (Expression)ctx.expression(2).accept(this);
        return expression;
    }
    @Override public Expression visitMemberExpression(MemberExpressionContext ctx) {
        MemberExpression expression = new MemberExpression();
        expression.location = new TokenLocation(ctx);
        expression.object = (Expression)ctx.expression().accept(this);
        if(ctx.IDENTIFIER() != null) {
            expression.fieldName = ctx.IDENTIFIER().getSymbol().getText();
        } else {
            expression.methodCall = visitFunctionCall(ctx.functionCall());
        }
        return expression;
    }
    @Override public FuncCallExpression visitFuncCallExpression(FuncCallExpressionContext ctx) {
        return visitFunctionCall(ctx.functionCall());
    }
    @Override public Expression visitCreator(CreatorContext ctx) {
        NewExpression newExpression = new NewExpression();
        newExpression.location = new TokenLocation(ctx);
        newExpression.typeNode = visitAtomType(ctx.atomType());
        newExpression.exprDimensions = new LinkedList<>();
        if(ctx.expression() != null) {
            for(ExpressionContext c : ctx.expression()) {
                newExpression.exprDimensions.add((Expression)c.accept(this));
            }
        }
        if(ctx.empty() != null)
            newExpression.restDemension = ctx.empty().size();
        else
            newExpression.restDemension = 0;
        return newExpression;
    }
    @Override public FuncCallExpression visitFunctionCall(FunctionCallContext ctx) {
        FuncCallExpression expression = new FuncCallExpression();
        expression.location = new TokenLocation(ctx);
        expression.functionName = ctx.IDENTIFIER().getSymbol().getText();
        expression.arguments = new LinkedList<>();
        if( ctx.expression() != null) {
            for (ExpressionContext c : ctx.expression())
                expression.arguments.add((Expression) c.accept(this));
        }
        return expression;
    }
}

