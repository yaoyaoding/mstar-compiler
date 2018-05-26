package Mstar.IR.Operand;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;

public class Immediate extends Constant {
    public int value;

    public Immediate(int value) {
        this.value = value;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
