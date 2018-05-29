package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;

public class IRCorrector implements IIRVisitor {
    IRProgram irProgram;

    @Override
    public void visit(IRProgram program) {
        this.irProgram = program;
        for(Function f : program.functions)
            f.accept(this);
    }

    @Override
    public void visit(Function function) {
        for(BasicBlock bb : function.basicblocks) {
            bb.accept(this);
        }
    }

    @Override
    public void visit(BasicBlock basicBlock) {
        for(IRInstruction inst = basicBlock.head; inst != null; inst = inst.next)
            inst.accept(this);
    }

    @Override
    public void visit(VirtualRegister operand) {

    }

    @Override
    public void visit(PhysicalRegister operand) {

    }

    @Override
    public void visit(Memory operand) {

    }

    @Override
    public void visit(StackSlot operand) {

    }

    @Override
    public void visit(Constant operand) {

    }

    @Override
    public void visit(Immediate operand) {

    }

    @Override
    public void visit(StaticData operand) {

    }

    @Override
    public void visit(BinaryInst inst) {

    }

    @Override
    public void visit(UnaryInst inst) {

    }

    @Override
    public void visit(Move inst) {
        if(inst.src instanceof Memory && inst.dest instanceof Memory) {
            VirtualRegister vr = new VirtualRegister("");
            inst.prepend(new Move(inst.bb, vr, inst.src));
            inst.src = vr;
        }
    }

    @Override
    public void visit(Push inst) {

    }

    @Override
    public void visit(Pop inst) {

    }

    @Override
    public void visit(CJump inst) {

    }

    @Override
    public void visit(Jump inst) {

    }

    @Override
    public void visit(Lea inst) {

    }

    @Override
    public void visit(Return inst) {

    }

    @Override
    public void visit(Call inst) {

    }

    @Override
    public void visit(Leave inst) {

    }
}
