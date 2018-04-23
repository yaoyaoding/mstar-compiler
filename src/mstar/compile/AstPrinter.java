package mstar.compile;

import mstar.ast.*;

import java.io.PrintStream;

public class AstPrinter implements IAstVisitor {
    StringBuilder stringBuilder;
    String curIndent;
    String incIndent;

    public AstPrinter() {
        stringBuilder = new StringBuilder();
        curIndent = "";
        incIndent = "  ";
    }
    public String toString() {
        return stringBuilder.toString();
    }
    public void printTo(PrintStream out) {
        out.println(toString());
    }

    private void indent() {
        curIndent = curIndent + incIndent;
    }
    private void unindent() {
        curIndent = curIndent.substring(0, curIndent.length() - incIndent.length());
    }
    private void appendNewLine(String s) {
        if(stringBuilder.length() != 0)
            stringBuilder.append("\n");
        stringBuilder.append(curIndent);
        stringBuilder.append(s);
    }
    private void appendCurrentLine(String s) {
        stringBuilder.append(s);
    }

    @Override
    public void visit(Program node) {
        appendNewLine("Functions:");
        indent();
        for(FuncDeclaration f : node.functions)
            visit(f);
        unindent();
        appendNewLine("Classes:");
        indent();
        for(ClassDeclaration c : node.classes)
            visit(c);
        unindent();
        appendNewLine("Global Variables:");
        indent();
        for(VariableDeclaration v : node.globalVariables) {
            appendNewLine("");
            visit(v);
        }
        unindent();
    }

    @Override
    public void visit(Declaration node) {
        assert false;
    }

    @Override
    public void visit(FuncDeclaration node) {
        appendNewLine("function: " + node.name );
        if(node.retTypeNode != null) {     //  not constructor
            appendNewLine("return type: ");
            node.retTypeNode.accept(this);
        }
        appendNewLine("parameters:");
        for(VariableDeclaration vd : node.parameters) {
            visit(vd);
            appendCurrentLine(",");
        }
        appendNewLine("body:");
        indent();
        for(Statement s : node.body)
            s.accept(this);
        unindent();
    }

    @Override
    public void visit(ClassDeclaration node) {
        appendNewLine("class: " + node.name);
        appendNewLine("constructor:");
        indent();
        visit(node.constructor);
        unindent();
        appendNewLine("fields:");
        indent();
        for(VariableDeclaration vd : node.fields) {
            appendNewLine("");
            visit(vd);
        }
        unindent();
        appendNewLine("methods:");
        indent();
        for(FuncDeclaration fd : node.methods)
            visit(fd);
        unindent();
    }

    @Override
    public void visit(VariableDeclaration node) {
        if(node.typeNode != null) {
            node.typeNode.accept(this);
            appendCurrentLine(" ");
        }
        appendCurrentLine(node.name);
        if(node.init != null) {
            appendCurrentLine(" = ");
            node.init.accept(this);
        }
    }

    @Override
    public void visit(TypeNode node) {
    }

    @Override
    public void visit(ArrayTypeNode node) {
        visit(node.baseType);
        for(int i = 0; i < node.dimension; i++)
            appendCurrentLine("[]");
    }

    @Override
    public void visit(PrimitiveTypeNode node) {
        appendCurrentLine(node.name);
    }

    @Override
    public void visit(ClassTypeNode node) {
        appendCurrentLine(node.className);
    }

    @Override
    public void visit(Statement node) {
        assert(false);
    }

    @Override
    public void visit(ForStatement node) {
        appendNewLine("for:");
        indent();
        appendNewLine("init statement:");
        indent();
        if(node.initStatement != null)
            node.initStatement.accept(this);
        unindent();
        appendNewLine("condition: ");
        if(node.condition != null)
            node.condition.accept(this);
        appendNewLine("update statement: ");
        indent();
        if(node.updateStatement != null)
            node.updateStatement.accept(this);
        unindent();
        appendNewLine("body:");
        indent();
        node.body.accept(this);
        unindent();
        unindent();
    }

    @Override
    public void visit(WhileStatement node) {
        appendNewLine("while:");
        indent();
        appendNewLine("condition: ");
        node.condition.accept(this);
        appendNewLine("body: ");
        indent();
        node.body.accept(this);
        unindent();
        unindent();
    }

    @Override
    public void visit(IfStatement node) {
        appendNewLine("if:");
        indent();
        appendNewLine("condition: ");
        node.condition.accept(this);
        appendNewLine("then:");
        indent();
        node.thenStatement.accept(this);
        unindent();
        if(node.elseStatement != null) {
            appendNewLine("else:");
            indent();
            node.elseStatement.accept(this);
            unindent();
        }
        unindent();
    }

    @Override
    public void visit(ContinueStatement node) {
        appendNewLine("continue");
    }

    @Override
    public void visit(BreakStatement node) {
        appendNewLine("break");
    }

    @Override
    public void visit(ReturnStatement node) {
        appendNewLine("return ");
        if(node.retExpression != null)
            node.retExpression.accept(this);
    }

    @Override
    public void visit(BlockStatement node) {
        appendNewLine("{");
        indent();
        for(Statement s : node.statements)
            s.accept(this);
        unindent();
        appendNewLine("}");
    }

    @Override
    public void visit(VarDeclStatement node) {
        appendNewLine("");
        node.declaration.accept(this);
    }

    @Override
    public void visit(ExprStatement node) {
        appendNewLine("");
        node.expression.accept(this);
    }

    @Override
    public void visit(Expression node) {
        assert(false);
    }

    @Override
    public void visit(Identifier node) {
        appendCurrentLine(node.name);
    }

    @Override
    public void visit(LiteralExpression node) {
        appendCurrentLine(node.value);
    }

    @Override
    public void visit(ArrayExpression node) {
        node.address.accept(this);
        appendCurrentLine("[");
        node.index.accept(this);
        appendCurrentLine("]");
    }

    @Override
    public void visit(FuncCallExpression node) {
        appendCurrentLine(node.functionName);
        appendCurrentLine(".(");
        for(Expression e : node.arguments) {
            e.accept(this);
            appendCurrentLine(",");
        }
        appendCurrentLine(")");
    }

    @Override
    public void visit(NewExpression node) {
        appendCurrentLine("new ");
        node.typeNode.accept(this);
        for(Expression e : node.exprDimensions) {
            appendCurrentLine("[");
            e.accept(this);
            appendCurrentLine("]");
        }
        for(int i = 0; i < node.restDemension; i++)
            appendCurrentLine("[]");
    }

    @Override
    public void visit(MemberExpression node) {
        node.object.accept(this);
        appendCurrentLine(".");
        if(node.fieldAccess != null) {
            visit(node.fieldAccess);
        } else {
            visit(node.methodCall);
        }
    }

    @Override
    public void visit(UnaryExpression node) {
        if(node.op.contains("v")) {
            if(node.op.charAt(0) == 'v') {
                appendCurrentLine("(");
                node.expression.accept(this);
                appendCurrentLine(")");
                appendCurrentLine(node.op.substring(1,2));
            } else {
                appendCurrentLine(node.op.substring(0,1));
                appendCurrentLine("(");
                node.expression.accept(this);
                appendCurrentLine(")");
            }
        } else {
            appendCurrentLine(node.op);
            appendCurrentLine("(");
            node.expression.accept(this);
            appendCurrentLine(")");
        }
    }

    @Override
    public void visit(BinaryExpression node) {
        appendCurrentLine("(");
        node.lhs.accept(this);
        appendCurrentLine(")");
        appendCurrentLine("(");
        node.rhs.accept(this);
        appendCurrentLine(")");
    }

    @Override
    public void visit(TernaryExpression node) {
        appendCurrentLine("(");
        node.condition.accept(this);
        appendCurrentLine(")");
        appendCurrentLine("?");
        appendCurrentLine("(");
        node.exprTrue.accept(this);
        appendCurrentLine(")");
        appendCurrentLine(":");
        appendCurrentLine("(");
        node.exprFalse.accept(this);
        appendCurrentLine(")");
    }

    @Override
    public void visit(AssignExpression node) {
        node.lhs.accept(this);
        appendCurrentLine("=");
        appendCurrentLine("(");
        node.rhs.accept(this);
        appendCurrentLine(")");
    }
}
