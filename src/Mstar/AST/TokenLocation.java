package Mstar.AST;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;

public class TokenLocation {
    public final int row;
    public final int column;

    public TokenLocation(int row, int column) {
        this.row = row;
        this.column = column;
    }
    public TokenLocation(Token token) {
        row = token.getLine();
        column = token.getCharPositionInLine();
    }
    public TokenLocation(ParserRuleContext ctx) {
        this(ctx.start);
    }
    public TokenLocation(AstNode node) {
        this.row = node.location.row;
        this.column = node.location.column;
    }

    @Override
    public String toString() {
        return "(" + row + "," + column + ")";
    }
}
