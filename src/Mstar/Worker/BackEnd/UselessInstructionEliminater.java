package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.Register;
import Mstar.IR.Operand.VirtualRegister;

import java.util.*;

public class UselessInstructionEliminater {
    private IRProgram irProgram;
    private LivenessAnalyzer livenessAnalyzer;
    private HashMap<BasicBlock,HashSet<VirtualRegister>> liveOut;

    public UselessInstructionEliminater(IRProgram irProgram) {
        this.irProgram = irProgram;
        this.livenessAnalyzer = new LivenessAnalyzer();
    }

    public void run() {
        for(Function function: irProgram.functions)
            processFunction(function);
    }

    private LinkedList<VirtualRegister> trans(LinkedList<Register> set) {
        LinkedList<VirtualRegister> retSet = new LinkedList<>();
        for(Register register : set) {
            assert register instanceof VirtualRegister;
            retSet.add((VirtualRegister) register);
        }
        return retSet;
    }

    private boolean isRemovable(IRInstruction inst) {
        return !(inst instanceof Return || inst instanceof Leave || inst instanceof Call || inst instanceof Cdq
                || inst instanceof Push || inst instanceof Pop || inst instanceof Jump || inst instanceof CJump);
    }

    private void processFunction(Function function) {
         liveOut = livenessAnalyzer.getLiveOut(function);
         for(BasicBlock bb : function.basicblocks) {
             HashSet<VirtualRegister> liveSet = new HashSet<>(liveOut.get(bb));
             for(IRInstruction inst = bb.tail; inst != null; inst = inst.prev) {
                 LinkedList<Register> usedSet = inst instanceof Call ? ((Call) inst).getCallUsed() : inst.getUseRegs();
                 LinkedList<Register> definedSet = inst.getDefRegs();
                 boolean dead = true;
                 if(definedSet.isEmpty())
                     dead = false;
                 for(Register register : definedSet) {
                     VirtualRegister vr = (VirtualRegister)register;
                     if(!dead) break;
                     if(liveSet.contains(vr) || vr.spillPlace != null) {
                         dead = false;
                         break;
                     }
                 }
                 if(dead && isRemovable(inst)) {
                     inst.remove();
                 } else {
                     liveSet.removeAll(trans(definedSet));
                     liveSet.addAll(trans(usedSet));
                 }
             }
         }
    }

}
