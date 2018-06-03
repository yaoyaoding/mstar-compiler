package Mstar.Worker.FrontEnd;

import Mstar.AST.*;
import Mstar.Symbol.VariableSymbol;

import javax.swing.plaf.nimbus.State;
import java.util.HashMap;
import java.util.HashSet;

public class OutputIrrevelantEliminator implements IAstVisitor {
    private AstProgram astProgram;
    private HashSet<AstNode> astRelevantSet;
    private HashSet<VariableSymbol> symbolRelevantSet;

    public OutputIrrevelantEliminator(AstProgram astProgram) {
        this.astProgram = astProgram;
        this.astRelevantSet = new HashSet<>();
        this.symbolRelevantSet = new HashSet<>();
    }

    public void run() {
        for(FuncDeclaration funcDeclaration : astProgram.functions) {
            processFunction(funcDeclaration);
        }
    }

    private void processFunction(FuncDeclaration funcDeclaration) {
        astRelevantSet.clear();
        symbolRelevantSet.clear();
        int lastSize = -1;
        while(lastSize != astRelevantSet.size() + symbolRelevantSet.size()) {
            lastSize = astRelevantSet.size() + symbolRelevantSet.size();
            funcDeclaration.accept(this);
        }
    }

    private boolean isRelevant(VariableSymbol symbol) {
        return symbolRelevantSet.contains(symbol);
    }

    private boolean isRelevant(AstNode node) {
        return astRelevantSet.contains(node);
    }

    @Override
    public void visit(AstProgram node) { }

    @Override
    public void visit(Declaration node) { }

    @Override
    public void visit(FuncDeclaration node) {
        for(Statement statement : node.body)
            statement.accept(this);
    }

    @Override
    public void visit(ClassDeclaration node) { }
    @Override
    public void visit(VariableDeclaration node) {
        if(isRelevant(node.symbol)) {
            astRelevantSet.add(node);
            if(node.init != null) {
                astRelevantSet.add(node.init);
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
    public void visit(Statement node) { }

    @Override
    public void visit(ForStatement node) {
        if(isRelevant(node.initStatement) || isRelevant(node.condition) || isRelevant(node.body) || isRelevant(node.updateStatement))
            astRelevantSet.add(node);
        if(isRelevant(node)) {
            if(node.initStatement != null) astRelevantSet.add(node.initStatement);
            if(node.condition != null) astRelevantSet.add(node.condition);
            if(node.updateStatement != null) astRelevantSet.add(node.updateStatement);
            if(node.body != null) astRelevantSet.add(node.body);
        }

        if(node.initStatement != null) node.initStatement.accept(this);
        if(node.condition != null) node.condition.accept(this);
        if(node.updateStatement != null) node.updateStatement.accept(this);
        if(node.body != null) node.body.accept(this);
    }

    @Override
    public void visit(WhileStatement node) {
        if(isRelevant(node.condition) || isRelevant(node.body))
            astRelevantSet.add(node);
        if(isRelevant(node)) {
            astRelevantSet.add(node.condition);
            astRelevantSet.add(node.body);
        }

        node.condition.accept(this);
        node.body.accept(this);
    }

    @Override
    public void visit(IfStatement node) {
        if(isRelevant(node.condition) || isRelevant(node.thenStatement) || isRelevant(node.elseStatement))
            astRelevantSet.add(node);
        if(isRelevant(node)) {
            astRelevantSet.add(node.condition);
            astRelevantSet.add(node.thenStatement);
            if(node.elseStatement != null) astRelevantSet.add(node.elseStatement);
        }

        node.condition.accept(this);
        node.thenStatement.accept(this);
        if(node.elseStatement != null) node.elseStatement.accept(this);
    }

    @Override
    public void visit(ContinueStatement node) { }

    @Override
    public void visit(BreakStatement node) { }

    @Override
    public void visit(ReturnStatement node) {
        astRelevantSet.add(node);
        if(node.retExpression != null)
            astRelevantSet.add(node.retExpression);
    }

    @Override
    public void visit(BlockStatement node) {
        boolean has = false;
        for(Statement statement : node.statements) {
            if(isRelevant(statement))
                has = true;
        }
        if(has)
            astRelevantSet.add(node);
        for(Statement statement : node.statements) {
            statement.accept(this);
        }
    }

    @Override
    public void visit(VarDeclStatement node) {
        node.declaration.accept(this);

    }

    @Override
    public void visit(ExprStatement node) {

    }

    @Override
    public void visit(Expression node) {

    }

    @Override
    public void visit(Identifier node) {

    }

    @Override
    public void visit(LiteralExpression node) {

    }

    @Override
    public void visit(ArrayExpression node) {

    }

    @Override
    public void visit(FuncCallExpression node) {

    }

    @Override
    public void visit(NewExpression node) {

    }

    @Override
    public void visit(MemberExpression node) {

    }

    @Override
    public void visit(UnaryExpression node) {

    }

    @Override
    public void visit(BinaryExpression node) {

    }

    @Override
    public void visit(TernaryExpression node) {

    }

    @Override
    public void visit(AssignExpression node) {

    }

    @Override
    public void visit(EmptyStatement node) {

    }
}
