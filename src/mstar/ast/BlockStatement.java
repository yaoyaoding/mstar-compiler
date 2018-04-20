package mstar.ast;

import java.util.List;

public class BlockStatement extends Statement {
    public List<Statement> statements;

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override
    public String toFString(String indent) {
        StringBuilder sb = new StringBuilder();
        for(Statement s : statements) {
            sb.append(s.toFString(indent+indentInc));
        }
        return sb.toString();
    }
}
