package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Memory;
import Mstar.IR.Operand.Register;

import java.util.Collection;
import java.util.LinkedList;

public class Lea extends IRInstruction {
    public Address dest;
    public Memory src;

    public Lea(BasicBlock bb, Address dest, Memory src) {
        super(bb);
        this.dest = dest;
        this.src = src;
    }
    @Override
    Collection<Register> getUseRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        regs.addAll(getRegs(src.base));
        regs.addAll(getRegs(src.index));
        return regs;
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
