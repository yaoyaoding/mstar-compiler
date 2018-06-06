package Mstar.Worker.FrontEnd;

import Mstar.AST.*;
import Mstar.Symbol.PrimitiveType;
import Mstar.Symbol.VariableSymbol;
import Mstar.Symbol.VariableType;

import java.util.HashMap;
import java.util.HashSet;

/* this is a data oriented optimization */
public class CommonAssignEliminator implements IAstVisitor {
    AstProgram astProgram;

    //  for assign optimization
    private boolean on;
    private HashSet<VariableSymbol> assignDependencySet;
    private HashMap<Long, Identifier> hashCommonSubexpressionMap;

    public CommonAssignEliminator(AstProgram astProgram) {
        this.astProgram = astProgram;
        this.assignDependencySet = new HashSet<>();
        this.hashCommonSubexpressionMap = new HashMap<>();
        this.on = false;
    }

    public void run() {
        System.err.println("Doing Common Assign Eliminator");
        for(FuncDeclaration funcDeclaration : astProgram.functions) {
            funcDeclaration.accept(this);
        }
    }

    private Long expressionHashCode(Expression expression) {
        long mod = 1000000007;
        if(expression instanceof BinaryExpression) {
            Long lhash = expressionHashCode(((BinaryExpression) expression).lhs);
            Long rhash = expressionHashCode(((BinaryExpression) expression).rhs);
            Long ohash = (long) ((BinaryExpression) expression).op.hashCode();
            if(lhash < 0) return (long)-1;
            if(rhash < 0) return (long)-1;
            return ((lhash * 107 + ohash) % mod * 97 + rhash) % mod;
        } else if(expression instanceof Identifier) {
            return ((Identifier) expression).symbol.hashCode() % mod;
        } else if(expression instanceof LiteralExpression) {
            if(((LiteralExpression) expression).typeName.equals("bool")) {
                if(((LiteralExpression) expression).value.equals("true"))
                    return (long) 327;
                else
                    return (long) 123;
            } else if(((LiteralExpression) expression).typeName.equals("int")) {
                return Long.valueOf(((LiteralExpression) expression).value) + 13;
            } else {
                return (long)-1;
            }
        } else {
            return (long)-1;
        }
    }

    private void addDependencySet(Expression expression) {
        if(expression instanceof BinaryExpression) {
            addDependencySet(((BinaryExpression) expression).lhs);
            addDependencySet(((BinaryExpression) expression).rhs);
        } else if(expression instanceof Identifier) {
            assignDependencySet.add(((Identifier) expression).symbol);
        }
    }

    @Override public void visit(AstProgram node) { }
    @Override public void visit(Declaration node) { }
    @Override public void visit(ClassDeclaration node) { }
    @Override public void visit(VariableDeclaration node) { }
    @Override public void visit(TypeNode node) { }
    @Override public void visit(ArrayTypeNode node) { }
    @Override public void visit(PrimitiveTypeNode node) { }
    @Override public void visit(ClassTypeNode node) { }
    @Override public void visit(Statement node) { }

    @Override
    public void visit(FuncDeclaration node) {
        for(Statement s : node.body)
            s.accept(this);
    }

    @Override
    public void visit(ForStatement node) {
        node.body.accept(this);
    }

    @Override
    public void visit(WhileStatement node) {
        node.body.accept(this);
    }

    @Override
    public void visit(IfStatement node) {
        node.thenStatement.accept(this);
        if(node.elseStatement != null)
            node.elseStatement.accept(this);
    }

    @Override public void visit(ContinueStatement node) { }

    @Override public void visit(BreakStatement node) { }

    @Override public void visit(ReturnStatement node) { }

    private boolean isPrimitiveType(VariableType type) {
        return type instanceof PrimitiveType;
    }


    @Override
    public void visit(BlockStatement node) {
        on = true;
        assignDependencySet.clear();
        hashCommonSubexpressionMap.clear();
        for(Statement s : node.statements) {
            if(s instanceof VarDeclStatement) {
                VariableDeclaration vd = ((VarDeclStatement) s).declaration;
                if(isPrimitiveType(vd.symbol.type)) {
                    if(vd.init != null) {
                        Long hashcode = expressionHashCode(vd.init);
                        if(hashcode < 0) continue;
                        Identifier dest = hashCommonSubexpressionMap.get(hashcode);
                        if(dest != null) {
                            System.err.println("replaceing ");
                            AstPrinter astPrinter = new AstPrinter();
                            vd.init.accept(astPrinter);
                            astPrinter.printTo(System.err);
                            System.err.println("with " + dest.name);
                            vd.init = dest;
                        }
                    }
                }
                if(assignDependencySet.contains(vd.symbol)) {
                    assignDependencySet.clear();
                    hashCommonSubexpressionMap.clear();
                    return;
                } else {
                    if(vd.init == null) continue;
                    Long hashcode = expressionHashCode(vd.init);
                    if(hashcode >= 0) {
                        Identifier identifier = new Identifier(null);
                        identifier.symbol = vd.symbol;
                        identifier.name = vd.name;
                        hashCommonSubexpressionMap.put(hashcode, identifier);
                        addDependencySet(vd.init);
                        System.err.println("hash code " + hashcode);
                    }
                }
            } else {
                return;
            }
        }
    }

    @Override
    public void visit(VarDeclStatement node) {

    }

    @Override public void visit(ExprStatement node) { }

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
