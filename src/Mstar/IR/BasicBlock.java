package Mstar.IR;

import Mstar.IR.Instruction.CJump;
import Mstar.IR.Instruction.IRInstruction;
import Mstar.IR.Instruction.Jump;
import Mstar.IR.Instruction.Return;

import java.util.LinkedList;

public class BasicBlock {
    public String hint;
    public Function function;
    public IRInstruction head;
    public IRInstruction tail;

    public LinkedList<BasicBlock> frontiers = null;
    public LinkedList<BasicBlock> successors = null;

    public BasicBlock(Function function, String hint) {
        this.function = function;
        this.hint = hint;
        this.frontiers = new LinkedList<>();
        this.successors = new LinkedList<>();
        try {
            function.basicblocks.add(this);
        } catch (Exception e) {
            throw e;
        }
    }

    public boolean isEnded() {
        return tail instanceof Return || tail instanceof Jump || tail instanceof CJump;
    }

    public void prepend(IRInstruction inst) {
        head.prepend(inst);
    }
    public void append(IRInstruction inst) {
        if(tail instanceof CJump || tail instanceof Jump || tail instanceof Return)
            return;
        if (head == null) {
            inst.prev = inst.next = null;
            head = tail = inst;
        } else {
            tail.append(inst);
        }
    }

    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
