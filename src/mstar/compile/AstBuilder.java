package mstar.compile;

import mstar.ast.*;
import mstar.parser.MstarBaseVisitor;
import mstar.parser.MstarParser;
import mstar.parser.MstarParser.*;

import java.util.LinkedList;
import java.util.List;


public class AstBuilder extends MstarBaseVisitor<Object> {
    public Program program;
    public ErrorReporter errorReporter;

    public AstBuilder(ErrorReporter errorReporter) {
        this.program = new Program();
        this.errorReporter = errorReporter;
    }

    @Override public Object visitCompilationUnit(MstarParser.CompilationUnitContext ctx) {
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
    @Override public Object visitFunctionDeclaration(FunctionDeclarationContext ctx) {
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
        List<Object> members = (List<Object>)visitClassBody(ctx.classBody());
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
    @Override public Object visitClassBody(ClassBodyContext ctx) {
        List<Object> members = new LinkedList<Object>();
        for(ClassBodyDeclarationContext c : ctx.classBodyDeclaration())
            members.add(visitClassBodyDeclaration(c));
        return members;
    }
    @Override public Object visitConstructorDeclaration(ConstructorDeclarationContext ctx) {
        FuncDeclaration constructor = new FuncDeclaration();
        constructor.typeNode = null;
        constructor.name = ctx.IDENTIFIER().getSymbol().getText();
        constructor.parameters = (List<VariableDeclaration>)visitParameterList(ctx.parameterList());
        constructor.body = (List<Statement>)visitFunctionBody(ctx.functionBody());
        return constructor;
    }
    @Override public Object visitMethodDeclaration(MethodDeclarationContext ctx) {
        FuncDeclaration method = new FuncDeclaration();
        method.typeNode = (TypeNode)visitType(ctx.type());
        method.name = ctx.IDENTIFIER().getSymbol().getText();
        method.parameters = (List<VariableDeclaration>)visitParameterList(ctx.parameterList());
        method.body = (List<Statement>)visitFunctionBody(ctx.functionBody());
        return method;
    }
    @Override public Object visitFieldDeclaration(FieldDeclarationContext ctx) {
        List<VariableDeclaration> fields = new LinkedList<VariableDeclaration>();
        List<VariableDeclaration> untyped_fields = (List<VariableDeclaration>)visitVariableDeclarators(ctx.variableDeclarators());
        TypeNode typeNode = (TypeNode)visitType(ctx.type());
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
    @Override public Object visitVariableDeclarators(VariableDeclaratorsContext ctx) {
        List<VariableDeclaration> declarations = new LinkedList<VariableDeclaration>();
        for(VariableDeclaratorContext c : ctx.variableDeclarator()) {
            declarations.add((VariableDeclaration) visitVariableDeclarator(c));
        }
        return declarations;
    }
    @Override public Object visitVariableDeclarator(MstarParser.VariableDeclaratorContext ctx) {
        VariableDeclaration declaration = new VariableDeclaration();
        declaration.typeNode = null;
        declaration.name = ctx.IDENTIFIER().getSymbol().getText();
        if(ctx.expression() == null)
            declaration.init = null;
        else
            declaration.init = (Expression)ctx.expression().accept(this);
        return declaration;
    }

}
