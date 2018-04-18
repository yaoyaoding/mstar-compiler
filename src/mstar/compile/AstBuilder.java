package mstar.compile;

import mstar.ast.*;
import mstar.parser.MstarBaseVisitor;
import mstar.parser.MstarParser.*;

import java.util.LinkedList;
import java.util.List;

import static mstar.parser.MstarParser.*;


public class AstBuilder extends MstarBaseVisitor<Object> {
    public Program program;
    public ErrorReporter errorReporter;

    public AstBuilder(ErrorReporter errorReporter) {
        this.program = new Program();
        this.errorReporter = errorReporter;
    }

    @Override public Object visitCompilationUnit(CompilationUnitContext ctx) {
        for(GlobalDeclarationContext c : ctx.globalDeclaration()) {
            Object dec = visitGlobalDeclaration(c);
            if(dec instanceof FuncDeclaration) {
                program.functions.add((FuncDeclaration) dec);
            } else if(dec instanceof VariableDeclaration) {
                program.globalVariables.add((VariableDeclaration) dec);
            } else {
                program.classes.add((ClassDeclaration) dec);
            }
        }
        return null;
    }
    @Override public FuncDeclaration visitFunctionDeclaration(FunctionDeclarationContext ctx) {
        FuncDeclaration funcDeclaration = new FuncDeclaration();
        funcDeclaration.typeNode = (TypeNode)visitType(ctx.type());
        funcDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        funcDeclaration.parameters = (List<VariableDeclaration>)visitParameterList(ctx.parameterList());
        funcDeclaration.body = (List<Statement>)visitFunctionBody(ctx.functionBody());
        return funcDeclaration;
    }
    @Override public Object visitClassDeclaration(ClassDeclarationContext ctx) {
        ClassDeclaration classDeclaration = new ClassDeclaration();
        classDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        List<Object> members = visitClassBody(ctx.classBody());
        for(Object obj : members) {
            if(obj instanceof VariableDeclaration)
                classDeclaration.fields.add((VariableDeclaration)obj);
            else {
                FuncDeclaration f = (FuncDeclaration) obj;
                if (f.typeNode == null) { //  constructor
                    if(!f.name.equals(classDeclaration.name))
                        errorReporter.addRecord("class constructor must have the same name with class name");
                    else if(classDeclaration.constructor != null)
                        errorReporter.addRecord("class can only have one constructor");
                    else
                        classDeclaration.constructor = f;
                }else{
                    classDeclaration.methods.add(f);
                }
            }
        }
        return classDeclaration;
    }
    @Override public List<Object> visitClassBody(ClassBodyContext ctx) {
        List<Object> members = new LinkedList<Object>();
        for(ClassBodyDeclarationContext c : ctx.classBodyDeclaration())
            members.add(visitClassBodyDeclaration(c));
        return members;
    }
    @Override public FuncDeclaration visitConstructorDeclaration(ConstructorDeclarationContext ctx) {
        FuncDeclaration constructor = new FuncDeclaration();
        constructor.typeNode = null;
        constructor.name = ctx.IDENTIFIER().getSymbol().getText();
        constructor.parameters = (List<VariableDeclaration>)visitParameterList(ctx.parameterList());
        constructor.body = (List<Statement>)visitFunctionBody(ctx.functionBody());
        return constructor;
    }
    @Override public FuncDeclaration visitMethodDeclaration(MethodDeclarationContext ctx) {
        FuncDeclaration method = new FuncDeclaration();
        method.typeNode = (TypeNode)visitType(ctx.type());
        method.name = ctx.IDENTIFIER().getSymbol().getText();
        method.parameters = (List<VariableDeclaration>)visitParameterList(ctx.parameterList());
        method.body = (List<Statement>)visitFunctionBody(ctx.functionBody());
        return method;
    }
    @Override public List<VariableDeclaration> visitFieldDeclaration(FieldDeclarationContext ctx) {
        List<VariableDeclaration> fields = new LinkedList<VariableDeclaration>();
        List<VariableDeclaration> untyped_fields = visitVariableDeclarators(ctx.variableDeclarators());
        TypeNode typeNode = visitType(ctx.type());
        for(VariableDeclaration v : untyped_fields) {
            if(v.init != null) {
                errorReporter.addRecord("field of class can not have the initial value");
            } else {
                VariableDeclaration field = new VariableDeclaration();
                field.typeNode = typeNode;
                field.name = v.name;
                field.init = null;
                fields.add(field);
            }
        }
        return fields;
    }

    @Override public TypeNode visitType(TypeContext ctx) {
        if(ctx.empty().isEmpty()) {     //  atom type
            return visitAtomType(ctx.atomType());
        } else {    //  array type
            ArrayTypeNode arrayTypeNode = new ArrayTypeNode();
            arrayTypeNode.baseType = visitAtomType(ctx.atomType());
            arrayTypeNode.dimension = ctx.empty().size();
            return arrayTypeNode;
        }
    }
    @Override public PrimitiveTypeNode visitPrimitiveType(PrimitiveTypeContext ctx) {
        PrimitiveTypeNode primitiveTypeNode = new PrimitiveTypeNode();
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
        classTypeNode.className = ctx.IDENTIFIER().getSymbol().getText();
        return classTypeNode;
    }
    @Override public List<VariableDeclaration> visitParameterList(ParameterListContext ctx) {
        List<VariableDeclaration> parameters = new LinkedList<>();
        for(ParameterContext c : ctx.parameter()) {
            parameters.add((VariableDeclaration)c.accept(this));
        }
        return parameters;
    }
    @Override public VariableDeclaration visitParameter(ParameterContext ctx) {
        VariableDeclaration variableDeclaration = new VariableDeclaration();
        variableDeclaration.typeNode = (TypeNode)ctx.type().accept(this);
        variableDeclaration.name = ctx.IDENTIFIER().getSymbol().getText();
        variableDeclaration.init = null;
        return variableDeclaration;
    }
    @Override public List<Statement> visitStatementList(StatementListContext ctx) {
        List<Statement> statements = new LinkedList<>();
        for(StatementContext c : ctx.statement()) {
            statements.add((Statement)c.accept(this));
        }
        return statements;
    }
    @Override public Statement visitIfStatement(IfStatementContext ctx) {
        IfStatement ifStatement = new IfStatement();
        ifStatement.condition = (Expression)ctx.expression().accept(this);
        ifStatement.thenStatement = (Statement)ctx.statement(0).accept(this);
        if(ctx.statement(1) != null)
            ifStatement.elseStatement = (Statement)ctx.statement(1).accept(this);
        return ifStatement;
    }
    @Override public Statement visitWhileStatement(WhileStatementContext ctx) {
        WhileStatement whileStatement = new WhileStatement();
        whileStatement.condition = (Expression)ctx.expression().accept(this);
        whileStatement.body = (Statement)ctx.statement().accept(this);
        return whileStatement;
    }
    @Override public Statement visitForStatement(ForStatementContext ctx) {
        ForStatement forStatement = new ForStatement();
        if(ctx.expression(0) != null)
            forStatement.initStatement = new ExprStatement((Expression)ctx.expression(0).accept(this));
        if(ctx.expression(1) != null)
            forStatement.condition = (Expression)ctx.expression(1).accept(this);
        if(ctx.expression(2) != null)
            forStatement.updateStatement = new ExprStatement((Expression)ctx.expression(2).accept(this));
        return forStatement;
    }
    @Override public BreakStatement visitBreakStatement(BreakStatementContext ctx) {
        return new BreakStatement();
    }
    @Override public ContinueStatement visitContinueStatement(ContinueStatementContext ctx) {
        return new ContinueStatement();
    }
    @Override public ReturnStatement visitReturnStatement(ReturnStatementContext ctx) {
        ReturnStatement returnStatement = new ReturnStatement();
        if(ctx.expression() != null)
            returnStatement.retExpression = (Expression)ctx.expression().accept(this);
        return returnStatement;
    }
    @Override public List<Statement> visitVarDeclStatement(VarDeclStatementContext ctx) {
        List<VariableDeclaration> declarations = visitVariableDeclaration(ctx.variableDeclaration());
        List<Statement> statements = new LinkedList<>();
        for(VariableDeclaration declaration : declarations) {
            VarDeclStatement statement = new VarDeclStatement();
            statement.declaration = declaration;
        }
        return statements;
    }
    @Override public Statement visitExprStatement(ExprStatementContext ctx) {
        ExprStatement exprStatement = new ExprStatement();
        exprStatement.expression = (Expression)ctx.expression().accept(this);
        return exprStatement;
    }
    @Override public Statement visitBlockStatement(BlockStatementContext ctx) {
        BlockStatement blockStatement = new BlockStatement();
        blockStatement.statements = visitStatementList(ctx.statementList());
        return blockStatement;
    }
    @Override public EmptyStatement visitEmptyStatement(EmptyStatementContext ctx) {
        return new EmptyStatement();
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
            declarations.add((VariableDeclaration) visitVariableDeclarator(c));
        }
        return declarations;
    }
    @Override public Object visitVariableDeclarator(VariableDeclaratorContext ctx) {
        VariableDeclaration declaration = new VariableDeclaration();
        declaration.typeNode = null;
        declaration.name = ctx.IDENTIFIER().getSymbol().getText();
        if(ctx.expression() == null)
            declaration.init = null;
        else
            declaration.init = (Expression)ctx.expression().accept(this);
        return declaration;
    }
    @Override public Expression visitPrimaryExpression(PrimaryExpressionContext ctx) {
        switch(ctx.token.getType()) {
            case THIS:
                return new Identifier(ctx.token.getText());
            case INT_LITERAL:
                return new IntLiteral(Integer.valueOf(ctx.token.getText()));
            case STRING_LITERAL:
                return new StringLiteral(ctx.token.getText());
            case BOOL_LITERAL:
                return new BoolLiteral(ctx.token.getText());
            case NULL_LITERAL:
                return new NullLiteral();
            case IDENTIFIER:
                return new Identifier(ctx.token.getText());
            default:    //  '(' expression ')'
                return (Expression)ctx.expression().accept(this);
        }
    }
    @Override public Expression visitBinaryExpression(BinaryExpressionContext ctx) {
        BinaryExpression expression = new BinaryExpression();
        expression.op = ctx.bop.getText();
        expression.lhs = (Expression)ctx.expression(0).accept(this);
        expression.rhs = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitArrayExpreesion(ArrayExpreesionContext ctx) {
        ArrayExpression expression = new ArrayExpression();
        expression.array = (Expression)ctx.expression(0).accept(this);
        expression.index = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitNewExpression(NewExpressionContext ctx) {
        return visitCreator(ctx.creator());
    }
    @Override public Expression visitAssignExpression(AssignExpressionContext ctx) {
        AssignExpression expression = new AssignExpression();
        expression.op = ctx.bop.getText();
        expression.lhs = (Expression)ctx.expression(0).accept(this);
        expression.rhs = (Expression)ctx.expression(1).accept(this);
        return expression;
    }
    @Override public Expression visitUnaryExpression(UnaryExpressionContext ctx) {
        UnaryExpression expression = new UnaryExpression();
        if(ctx.postfix != null) {
            if(ctx.postfix.getText().equals("++"))
                expression.op = "a++";
            else
                expression.op = "a--";
        } else {
            if(ctx.prefix.getText().equals("++"))
                expression.op = "++a";
            else if(ctx.prefix.getText().equals("--"))
                expression.op = "--a";
            else
                expression.op = ctx.prefix.getText();
        }
        expression.expression = (Expression)ctx.expression().accept(this);
        return expression;
    }
    @Override public Expression visitTernaryExpression(TernaryExpressionContext ctx) {
        TernaryExpression expression = new TernaryExpression();
        expression.condition = (Expression)ctx.expression(0).accept(this);
        expression.expr1= (Expression)ctx.expression(1).accept(this);
        expression.expr2= (Expression)ctx.expression(2).accept(this);
        return expression;
    }
    @Override public Expression visitMemberExpression(MemberExpressionContext ctx) {
        MemberExpression expression = new MemberExpression();
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
        newExpression.typeNode = visitAtomType(ctx.atomType());
        if(ctx.expression() != null) {
            newExpression.exprDimensions = new LinkedList<>();
            for(ExpressionContext c : ctx.expression()) {
                newExpression.exprDimensions.add((Expression)c.accept(this));
            }
        } else {
            newExpression.exprDimensions = null;
        }
        if(ctx.empty() != null)
            newExpression.restDemension = ctx.empty().size();
        else
            newExpression.restDemension = 0;
        return newExpression;
    }
    @Override public FuncCallExpression visitFunctionCall(FunctionCallContext ctx) {
        FuncCallExpression expression = new FuncCallExpression();
        expression.functionName = ctx.IDENTIFIER().getSymbol().getText();
        expression.arguments = new LinkedList<>();
        if( ctx.expression() != null) {
            for (ExpressionContext c : ctx.expression())
                expression.arguments.add((Expression) c.accept(this));
        }
        return expression;
    }
}
