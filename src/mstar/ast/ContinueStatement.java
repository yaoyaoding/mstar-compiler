package mstar.ast;

public class ContinueStatement extends Statement {
    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

    @Override public String toFString(String indent) { return indent + "continue;\n"; }
}
