package Mstar.IR.Operand;

import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;

public class StackSlot extends Memory {
    public Function function;
    public String hint;

    public StackSlot(String hint) {
        this.hint = hint;
    }
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
