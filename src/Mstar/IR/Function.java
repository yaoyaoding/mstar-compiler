package Mstar.IR;

import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.PhysicalRegister;
import Mstar.IR.Operand.Register;
import Mstar.IR.Operand.VirtualRegister;
import Mstar.Symbol.VariableSymbol;

import java.util.HashSet;
import java.util.LinkedList;

public class Function {
    public enum Type {
        External, Library, UserDefined
    }
    public Type type;
    public String name;
    public boolean hasReturnValue;
    public BasicBlock enterBB;
    public BasicBlock leaveBB;
    public LinkedList<BasicBlock> basicblocks;
    public LinkedList<BasicBlock> reversePostOrder;
    public LinkedList<BasicBlock> reversePostOrderOnReverseCFG;
    public LinkedList<VirtualRegister> parameters;

    public HashSet<VariableSymbol> usedGlobalVariables;
    public HashSet<VariableSymbol> recursiveUsedGlobalVariables;
    public HashSet<PhysicalRegister> usedPhysicalRegisters;
    public HashSet<PhysicalRegister> recursiveUsedPhysicalRegisters;

    public HashSet<Function> callee;

    private HashSet<BasicBlock> visitedBasicBlocks;
    private HashSet<Function> visitedFunctions;

    public Function(Type type, String name, boolean hasReturnValue) {
        this.type = type;
        this.name = name;
        this.hasReturnValue = hasReturnValue;
        this.basicblocks = new LinkedList<>();
        this.reversePostOrder = new LinkedList<>();
        this.reversePostOrderOnReverseCFG = new LinkedList<>();
        this.parameters = new LinkedList<>();
        this.usedGlobalVariables = new HashSet<>();
        this.recursiveUsedGlobalVariables = new HashSet<>();
        this.usedPhysicalRegisters = new HashSet<>();
        this.recursiveUsedPhysicalRegisters = new HashSet<>();
        this.callee = new HashSet<>();
        this.visitedBasicBlocks = new HashSet<>();
        this.visitedFunctions = new HashSet<>();
        if(type != Type.UserDefined && !name.equals("init")) {
            for(PhysicalRegister pr : X86RegisterSet.regs) {
                if(pr.name.equals("rbp") || pr.name.equals("rsp"))
                    continue;
                this.usedPhysicalRegisters.add(pr);
                this.recursiveUsedPhysicalRegisters.add(pr);
            }
        }
    }

    private void dfsReversePostOrder(BasicBlock node) {
        if(visitedBasicBlocks.contains(node)) return;
        visitedBasicBlocks.add(node);
        for(BasicBlock bb : node.successors)
            dfsReversePostOrder(bb);
        reversePostOrder.addFirst(node);
    }

    private void dfsReversePostOrderOnReversedCFG(BasicBlock node) {
        if(visitedBasicBlocks.contains(node)) return;
        visitedBasicBlocks.add(node);
        for(BasicBlock bb : node.frontiers)
            dfsReversePostOrderOnReversedCFG(bb);
        reversePostOrderOnReverseCFG.addFirst(node);
    }

    private void dfsRecursiveUsedGlobalVariables(Function node) {
        if(visitedFunctions.contains(node)) return;
        visitedFunctions.add(node);
        for(Function func : node.callee)
            dfsRecursiveUsedGlobalVariables(func);
        recursiveUsedGlobalVariables.addAll(node.usedGlobalVariables);
    }

    public void finishBuild() {
        /* calculate the successors and frontiers of all BasicBlocks*/
        for(BasicBlock bb : basicblocks) {
            if(bb.tail instanceof CJump) {
                bb.successors.add(((CJump) bb.tail).thenBB);
                bb.successors.add(((CJump) bb.tail).elseBB);
            } else if(bb.tail instanceof Jump){
                bb.successors.add(((Jump) bb.tail).targetBB);
            }
            for(BasicBlock suc : bb.successors) {
                suc.frontiers.add(bb);
            }
        }

        /* calculate reversed post order on CFG */
        visitedBasicBlocks.clear();
        dfsReversePostOrder(enterBB);

        /* calculate reversed post order on reversed CFG */
        visitedBasicBlocks.clear();
        dfsReversePostOrderOnReversedCFG(leaveBB);

        /* calculate the recursive used global variables*/
        visitedFunctions.clear();
        recursiveUsedGlobalVariables.clear();
        dfsRecursiveUsedGlobalVariables(this);
    }

    private LinkedList<PhysicalRegister> trans(LinkedList<Register> regs) {
        LinkedList<PhysicalRegister> ret = new LinkedList<>();
        for(Register r : regs) {
            try {
                ret.add((PhysicalRegister) r);
            } catch (Exception e) {
                e.getStackTrace();
            }
        }
        return ret;
    }

    private void dfsRecursiveUsedPhysicalRegisters(Function node) {
        if(visitedFunctions.contains(node)) return;
        visitedFunctions.add(node);
        for(Function func : node.callee)
            dfsRecursiveUsedGlobalVariables(func);
        recursiveUsedPhysicalRegisters.addAll(node.usedPhysicalRegisters);
    }

    public void finishAllocate() {
        for(BasicBlock bb : basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(inst instanceof Return)
                    continue;
                if(inst instanceof Call) {
                    usedPhysicalRegisters.add(X86RegisterSet.rax);
                } else {
                    usedPhysicalRegisters.addAll(trans(inst.getUseRegs()));
                    usedPhysicalRegisters.addAll(trans(inst.getDefRegs()));
                }
            }
        }
        visitedFunctions.clear();
        dfsRecursiveUsedPhysicalRegisters(this);
    }

    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
