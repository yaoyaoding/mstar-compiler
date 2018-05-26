package Mstar.IR.Instruction;

import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Register;

import java.util.Collection;
import java.util.LinkedList;

public class Pop extends IRInstruction {
    public Address dest;

    @Override
    Collection<Register> getUseRegs() {
        return new LinkedList<>();
    }

    @Override
    Collection<Register> getDefRegs() {
        return getRegs(dest);
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
