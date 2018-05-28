package Mstar.IR.Operand;

import Mstar.IR.IIRVisitor;

public class VirtualRegister extends Register {
    public String hint;
    public Memory spillPlace;

    public VirtualRegister(String hint) {
        this.hint = hint;
        this.spillPlace = new StackSlot(hint + "slot");
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
