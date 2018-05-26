package Mstar.AST;

public class UnaryExpression extends Expression {
    public String op;   //  can be v++, v--, ++v, --v, ~, !
    public Expression expression;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}

