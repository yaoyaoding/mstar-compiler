package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Collection;

public class CJump extends IRInstruction {
    public enum CompareOp {
        E, NE, G, GE, L, LE
    }
    public CompareOp op;
    public BasicBlock thenBB;
    public BasicBlock elseBB;
    public Operand src1;
    public Operand src2;

    public CJump(BasicBlock bb, Operand src1, CompareOp op, Operand src2, BasicBlock thenBB, BasicBlock elseBB) {
        super(bb);
        this.op = op;
        this.thenBB = thenBB;
        this.elseBB = elseBB;
        this.src1 = src1;
        this.src2 = src2;
    }

    @Override
    Collection<Register> getUseRegs() {
        return null;
    }

    @Override
    Collection<Register> getDefRegs() {
        return null;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
