package Mstar.Worker.BackEnd;

import Mstar.Config;
import Mstar.IR.*;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;
import Mstar.Symbol.VariableSymbol;

import java.util.HashSet;
import java.util.LinkedList;

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
        if((inst.op == BinaryInst.BinaryOp.MUL || inst.op == BinaryInst.BinaryOp.DIV || inst.op == BinaryInst.BinaryOp.MOD)
                && inst.src instanceof Constant) {
            VirtualRegister vr = new VirtualRegister("");
            inst.prepend(new Move(inst.bb, vr, inst.src));
            inst.src = vr;
        }
    }

    @Override
    public void visit(UnaryInst inst) {

    }

    private PhysicalRegister getPhysical(Operand v) {
        if(v instanceof VirtualRegister)
            return ((VirtualRegister) v).allocatedPhysicalRegister;
        else
            return null;
    }

    @Override
    public void visit(Move inst) {
        if(inst.src instanceof Memory && inst.dest instanceof Memory) {
            VirtualRegister vr = new VirtualRegister("");
            inst.prepend(new Move(inst.bb, vr, inst.src));
            inst.src = vr;
        }  else {
            if(Config.allocator == Config.Allocator.NaiveAllocator) {
                PhysicalRegister pdest = getPhysical(inst.dest);
                PhysicalRegister psrc = getPhysical(inst.src);
                if(pdest != null && inst.src instanceof Memory) {
                    VirtualRegister vr = new VirtualRegister("");
                    inst.prepend(new Move(inst.bb, vr, inst.src));
                    inst.src = vr;
                } else if(psrc != null && inst.dest instanceof Memory) {
                    VirtualRegister vr = new VirtualRegister("");
                    inst.prepend(new Move(inst.bb, vr, inst.dest));
                    inst.dest= vr;
                }
            }
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
        if(inst.src1 instanceof Constant) {
            if(inst.src2 instanceof Constant) {
                inst.prepend(new Jump(inst.bb, inst.doCompare()));
                inst.remove();
            } else {
                Operand tmp = inst.src1;
                inst.src1 = inst.src2;
                inst.src2 = tmp;
                inst.op = inst.getReverseCompareOp();
            }
        }
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
        Function caller = inst.bb.function;
        Function callee = inst.func;
        HashSet<VariableSymbol> callerUsed = caller.usedGlobalVariables;
        HashSet<VariableSymbol> calleeUsed = callee.recursiveUsedGlobalVariables;
        for(VariableSymbol vs : callerUsed) {
            if(calleeUsed.contains(vs)) {
                inst.prepend(new Move(inst.bb, vs.virtualRegister.spillPlace, vs.virtualRegister));
                inst.prev.accept(this);
            }
        }
        while(inst.args.size() > 6)
            inst.prepend(new Push(inst.bb, inst.args.removeLast()));
        for(int i = inst.args.size() - 1; i >= 0; i--) {
            inst.prepend(new Move(inst.bb, RegisterSet.vargs.get(i), inst.args.get(i)));
            inst.prev.accept(this);
        }
        for(VariableSymbol vs : callerUsed) {
            if(calleeUsed.contains(vs)) {
                inst.append(new Move(inst.bb, vs.virtualRegister, vs.virtualRegister.spillPlace));
            }
        }
    }

    @Override
    public void visit(Leave inst) {
    }

    @Override
    public void visit(Cdq inst) {
    }

    @Override
    public void visit(FunctionAddress operand) {
    }
}
