package mstar.ast;

public class EmptyStatement extends Statement {

    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }
}
