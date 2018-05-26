package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Collection;
import java.util.LinkedList;

public abstract class IRInstruction {
    public BasicBlock bb;
    public IRInstruction prev;
    public IRInstruction next;

    public IRInstruction() {
        this.bb = null;
    }
    public IRInstruction(BasicBlock bb) {
        this.bb = bb;
    }
    public void prepend(IRInstruction inst) {
        if(prev != null)
            prev.next = inst;
        inst.prev = prev;
        inst.next = this;
        this.prev = inst;
    }
    public void append(IRInstruction inst) {
        if(next != null)
            next.prev = inst;
        inst.next = next;
        inst.prev = this;
        this.next = inst;
    }
    public void remove() {
        if(prev == null && next == null) {
            bb.head = bb.tail = null;
        } else if(prev == null) {
            bb.head = next;
            next.prev = null;
        } else if(next == null) {
            bb.tail = prev;
            prev.next = null;
        } else {
            prev.next = next;
            next.prev = prev;
        }
    }
    abstract Collection<Register> getUseRegs();
    abstract Collection<Register> getDefRegs();
    static Collection<Register> getRegs(Operand operand) {
        LinkedList<Register> regs = new LinkedList<>();
        if(operand instanceof Register)
            regs.add((Register) operand);
        return regs;
    }
    public abstract void accept(IIRVisitor visitor);
}
