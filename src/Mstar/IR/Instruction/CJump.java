package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.*;

import java.util.HashMap;
import java.util.LinkedList;

import static Mstar.IR.Instruction.CJump.CompareOp.*;

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

    public BasicBlock doCompare() {
        assert src1 instanceof Immediate && src2 instanceof Immediate;
        int v1 = ((Immediate) src1).value;
        int v2 = ((Immediate) src2).value;
        boolean r;
        switch(op) {
            case NE: r = v1 != v2; break;
            case LE: r = v1 <= v2; break;
            case GE: r = v1 >= v2; break;
            case L: r = v1 < v2; break;
            case G: r = v1 > v2; break;
            case E: r = v1 == v2; break;
            default: r = false; assert false;
        }
        return r ? thenBB : elseBB;
    }

    public CompareOp getReverseCompareOp() {
        switch(op) {
            case E: return E;
            case G: return LE;
            case L: return GE;
            case GE: return L;
            case LE: return G;
            case NE: return NE;
            default: assert false; return E;
        }
    }

    @Override
    public LinkedList<Register> getUseRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        LinkedList<Operand> srcs = new LinkedList<>();
        srcs.add(src1);
        srcs.add(src2);
        for(Operand src : srcs) {
            if(src instanceof Memory)
                regs.addAll(((Memory) src).getUseRegs());
            else if(src instanceof Register)
                regs.add((Register) src);
        }
        return regs;
    }

    @Override
    public LinkedList<StackSlot> getStackSlots() {
        return defaultGetStackSlots(src1, src2);
    }

    @Override
    public void renameUseReg(HashMap<Register, Register> renameMap) {
        if(src1 instanceof Memory) {
            src1 = ((Memory) src1).copy();
            ((Memory) src1).renameUseReg(renameMap);
        } else if(src1 instanceof Register && renameMap.containsKey(src1))
            src1 = renameMap.get(src1);
        if(src2 instanceof Memory) {
            src2 = ((Memory) src2).copy();
            ((Memory) src2).renameUseReg(renameMap);
        } else if(src2 instanceof Register && renameMap.containsKey(src2))
            src2 = renameMap.get(src2);
    }

    @Override
    public void renameDefReg(HashMap<Register, Register> renameMap) {
    }

    @Override
    public LinkedList<Register> getDefRegs() {
        return new LinkedList<>();
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
