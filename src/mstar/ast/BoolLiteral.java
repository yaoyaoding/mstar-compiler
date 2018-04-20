package mstar.ast;

import org.antlr.v4.runtime.Token;

public class BoolLiteral extends Expression{
    public boolean value;

    public BoolLiteral(Token token) {
        this.value = token.getText().equals("true");
        this.location = new TokenLocation(token);
    }

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        return Boolean.valueOf(value).toString();
    }
}
