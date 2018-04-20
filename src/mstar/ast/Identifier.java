package mstar.ast;

import org.antlr.v4.runtime.Token;

public class Identifier extends Expression {
    public String name;

    public Identifier(Token token) {
        this.name = token.getText();
        this.location = new TokenLocation(token);
    }

    @Override
    public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return name;
    }
}
