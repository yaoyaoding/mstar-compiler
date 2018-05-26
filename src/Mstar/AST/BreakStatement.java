package Mstar.AST;

public class BreakStatement extends Statement {
    @Override public void accept(IAstVisitor visitor) { visitor.visit(this); }

}
