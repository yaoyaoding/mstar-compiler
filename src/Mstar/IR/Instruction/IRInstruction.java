package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.*;

import java.util.HashMap;
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
        if(prev == null) {
            inst.next = this;
            this.prev = inst;
            bb.head = inst;
        } else {
            prev.next = inst;
            inst.prev = prev;
            inst.next = this;
            this.prev = inst;
        }
    }
    public void append(IRInstruction inst) {
        if(next == null) {
            this.next = inst;
            inst.prev = this;
            bb.tail = inst;
        } else {
            inst.next = this.next;
            this.next.prev = inst;
            this.next = inst;
            inst.prev = this;
        }
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
    public void replace(IRInstruction newInst) {
        if(prev == null && next == null) {
            bb.head = bb.tail = newInst;
            newInst.prev = newInst.next = null;
        } else if(prev == null) {
            bb.head = newInst;
            newInst.prev = null;
            this.next.prev = newInst;
            newInst.next = this.next;
        } else if(next == null) {
            newInst.prev = this.prev;
            this.prev.next = newInst;
            bb.tail = newInst;
            newInst.next = null;
        } else {
            newInst.prev = this.prev;
            this.prev.next = newInst;
            newInst.next = this.next;
            this.next.prev = newInst;
        }
    }
    public abstract void renameUseReg(HashMap<Register, Register> renameMap);
    public abstract void renameDefReg(HashMap<Register, Register> renameMap);
    public abstract LinkedList<Register> getDefRegs();
    public abstract LinkedList<Register> getUseRegs();
    public abstract LinkedList<StackSlot> getStackSlots();

    LinkedList<StackSlot> defaultGetStackSlots(Operand... operands) {
        LinkedList<StackSlot> slots = new LinkedList<>();
        for(Operand operand : operands)
            if(operand instanceof StackSlot)
                slots.add((StackSlot) operand);
        return slots;
    }

    public abstract void accept(IIRVisitor visitor);
}
