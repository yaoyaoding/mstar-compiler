package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Collection;
import java.util.LinkedList;

public class Return extends IRInstruction {
    public Operand src;

    public Return(BasicBlock bb, Operand src) {
        super(bb);
        this.src = src;
    }

    @Override
    Collection<Register> getUseRegs() {
        return getRegs(src);
    }

    @Override
    Collection<Register> getDefRegs() {
        return new LinkedList<>();
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
