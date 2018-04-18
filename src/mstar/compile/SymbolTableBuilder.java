package mstar.compile;

import mstar.ast.*;

public class SymbolTableBuilder implements IAstVisitor {
    public void visit(Program node) {
    }

    public void visit(FuncDeclaration node) { }
    public void visit(ClassDeclaration node) { }
    public void visit(VariableDeclaration node) { }

    public void visit(Statement node) { }
    public void visit(ForStatement node) { }
    public void visit(WhileStatement node) { }
    public void visit(IfStatement node) { }
    public void visit(BreakStatement node) { }
    public void visit(ReturnStatement node) { }
    public void visit(BlockStatement node) { }
    public void visit(VarDeclStatement node) { }
    public void visit(ExprStatement node) { }

    public void visit(Expression node) { }
    public void visit(IntLiteral node) { }
    public void visit(BoolLiteral node) { }
    public void visit(StringLiteral node) { }
    public void visit(NullLiteral node) { }
    public void visit(Identifier node) { }
    public void visit(FuncCallExpression node) { }
    public void visit(NewExpression node) { }
    public void visit(UnaryExpression node) { }
    public void visit(MemberExpression node) { }
    public void visit(BinaryExpression node) { }
    public void visit(TernaryExpression node) { }
    public void visit(AssignExpression node) { }
}
