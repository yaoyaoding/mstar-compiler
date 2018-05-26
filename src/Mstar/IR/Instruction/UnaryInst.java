package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Register;

import java.util.Collection;

public class UnaryInst extends IRInstruction {
    public enum UnaryOp {
        NEG, NOT, INC, DEC
    }
    public UnaryOp op;
    public Address dest;

    public UnaryInst(BasicBlock bb, UnaryOp op, Address dest) {
        super(bb);
        this.op = op;
        this.dest = dest;
    }

    @Override
    Collection<Register> getUseRegs() {
        return getRegs(dest);
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
