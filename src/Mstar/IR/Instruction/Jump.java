package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Register;

import java.util.Collection;
import java.util.LinkedList;

public class Jump extends IRInstruction {
    public BasicBlock targetBB;

    public Jump(BasicBlock bb, BasicBlock targetBB) {
        super(bb);
        this.targetBB = targetBB;
    }

    @Override
    Collection<Register> getUseRegs() {
        return new LinkedList<>();
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
