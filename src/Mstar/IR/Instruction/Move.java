package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Collection;

public class Move extends IRInstruction {
    public Address dest;
    public Operand src;

    public Move(BasicBlock bb, Address dest, Operand src) {
        super(bb);
        this.dest = dest;
        this.src = src;
    }

    @Override
    Collection<Register> getUseRegs() {
        return getRegs(src);
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
