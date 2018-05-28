package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Memory;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;
import Mstar.IR.Operand.StackSlot;

import java.util.HashMap;
import java.util.LinkedList;

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
        if(src1 instanceof Memory)
            ((Memory) src1).renameUseReg(renameMap);
        else if(src1 instanceof Register && renameMap.containsKey(src1))
            src1 = renameMap.get(src1);
        if(src2 instanceof Memory)
            ((Memory) src2).renameUseReg(renameMap);
        else if(src2 instanceof Register && renameMap.containsKey(src2))
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
