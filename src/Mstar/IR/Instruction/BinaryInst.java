package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.*;

import java.util.HashMap;
import java.util.LinkedList;

import static Mstar.Worker.BackEnd.IRBuilder.vrax;
import static Mstar.Worker.BackEnd.IRBuilder.vrdx;

public class BinaryInst extends IRInstruction {
    public enum BinaryOp {
        ADD, SUB, MUL, DIV, MOD, SAL, SAR, AND, OR, XOR
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
    public void renameUseReg(HashMap<Register, Register> renameMap) {
        if(src instanceof Memory) {
            src = ((Memory) src).copy();
            ((Memory) src).renameUseReg(renameMap);
        }
        else if(src instanceof Register && renameMap.containsKey(src))
            src = renameMap.get(src);
        if(dest instanceof Memory) {
            dest = ((Memory) dest).copy();
            ((Memory) dest).renameUseReg(renameMap);
        } else if(dest instanceof Register && renameMap.containsKey(dest))
            dest = renameMap.get(dest);
    }

    @Override
    public void renameDefReg(HashMap<Register, Register> renameMap) {
        if(dest instanceof Register && renameMap.containsKey(dest))
            dest = renameMap.get(dest);
    }

    @Override
    public LinkedList<Register> getUseRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        if(src instanceof Memory)
            regs.addAll(((Memory) src).getUseRegs());
        else if(src instanceof Register)
            regs.add((Register) src);
        if(dest instanceof Memory)
            regs.addAll(((Memory) dest).getUseRegs());
        else if(dest instanceof Register)
            regs.add((Register) dest);
        if(op == BinaryOp.MUL) {
            if(!regs.contains(vrax))
                regs.add(vrax);
        } else if(op == BinaryOp.DIV || op == BinaryOp.MOD) {
            if(!regs.contains(vrax))
                regs.add(vrax);
            if(!regs.contains(vrdx))
                regs.add(vrdx);
        }
        return regs;
    }

    @Override
    public LinkedList<StackSlot> getStackSlots() {
        return defaultGetStackSlots(dest, src);
    }

    @Override
    public LinkedList<Register> getDefRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        if(dest instanceof Register)
            regs.add((Register) dest);
        if(op == BinaryOp.MUL || op == BinaryOp.DIV || op == BinaryOp.MOD) {
            if(!regs.contains(vrax))
                regs.add(vrax);
            if(!regs.contains(vrdx))
                regs.add(vrdx);
        }
        return regs;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
