package mstar.ast;

import org.antlr.v4.runtime.Token;

public class NullLiteral extends Expression {

    public NullLiteral(Token token) {
        this.location = new TokenLocation(token);
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return "null";
    }
}
