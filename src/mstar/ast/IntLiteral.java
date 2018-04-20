package mstar.ast;

import org.antlr.v4.runtime.Token;

public class IntLiteral extends Expression {
    public int value;

    public IntLiteral(Token token) {
        this.value = Integer.valueOf(token.getText());
        this.location = new TokenLocation(token);
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return Integer.valueOf(value).toString();
    }
}

