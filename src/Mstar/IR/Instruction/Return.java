package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.*;
import Mstar.Worker.BackEnd.IRBuilder;

import java.util.HashMap;
import java.util.LinkedList;

public class Return extends IRInstruction {

    public Return(BasicBlock bb) {
        super(bb);
    }

    @Override
    public void renameUseReg(HashMap<Register, Register> renameMap) { }

    @Override
    public void renameDefReg(HashMap<Register, Register> renameMap) { }

    @Override
    public LinkedList<Register> getDefRegs() { return new LinkedList<>(); }

    @Override
    public LinkedList<Register> getUseRegs() {
        LinkedList<Register> regs = new LinkedList<>();
        if(bb.function.hasReturnValue)
            regs.add(IRBuilder.vrax);
        return regs;
    }

    @Override
    public LinkedList<StackSlot> getStackSlots() { return new LinkedList<>(); }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
