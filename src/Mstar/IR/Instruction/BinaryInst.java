package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Collection;

public class BinaryInst extends IRInstruction {
    public enum BinaryOp {
        ADD, SUB, MUL, DIV, MOD, SHL, SHR, AND, OR, XOR
    }
    public BinaryOp op;
    public Address dest;
    public Operand src;

    public BinaryInst(BasicBlock bb, BinaryOp op, Address dest, Operand src) {
        super(bb);
        this.op = op;
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
