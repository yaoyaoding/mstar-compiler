package mstar.ast;

import java.util.List;

public class BlockStatement extends Statement {
    public List<Statement> statements;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
