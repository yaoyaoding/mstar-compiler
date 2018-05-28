package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Memory;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;
import Mstar.IR.Operand.StackSlot;

import java.util.HashMap;
import java.util.LinkedList;

public class Return extends IRInstruction {
    public Operand src;

    public Return(BasicBlock bb, Operand src) {
        super(bb);
        this.src = src;
    }

    @Override
    public LinkedList<Register> getUseRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        if(src instanceof Memory)
            regs.addAll(((Memory) src).getUseRegs());
        else if(src instanceof Register)
            regs.add((Register) src);
        return regs;
    }

    @Override
    public LinkedList<StackSlot> getStackSlots() {
        return defaultGetStackSlots(src);
    }

    @Override
    public void renameUseReg(HashMap<Register, Register> renameMap) {
        if(src instanceof Register && renameMap.containsKey(src))
            src = renameMap.get(src);
        else if(src instanceof Memory)
            ((Memory) src).renameUseReg(renameMap);
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
