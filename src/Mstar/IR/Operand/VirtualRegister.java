package Mstar.IR.Operand;

import Mstar.IR.IIRVisitor;

public class VirtualRegister extends Register {
    public String hint;
    public PhysicalRegister allocatedPhysicalRegister;
    public Memory spillPlace = null;

    public VirtualRegister(String hint) {
        this.hint = hint;
        this.allocatedPhysicalRegister = null;
    }
    public VirtualRegister(String hint, PhysicalRegister physicalRegister) {
        this.hint = hint;
        this.allocatedPhysicalRegister = physicalRegister;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
