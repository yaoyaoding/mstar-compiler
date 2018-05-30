package Mstar.IR;

import Mstar.IR.Instruction.CJump;
import Mstar.IR.Instruction.Jump;
import Mstar.IR.Instruction.Return;
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
    public BasicBlock enterBB;
    public BasicBlock leaveBB;
    public LinkedList<BasicBlock> basicblocks;
    public LinkedList<BasicBlock> reversePostOrder;
    public LinkedList<VirtualRegister> parameters;

    public HashSet<VariableSymbol> usedGlobalVariables;
    public HashSet<VariableSymbol> recursiveUsedGlobalVariables;

    public HashSet<Function> callee;

    private HashSet<BasicBlock> visitedBasicBlocks;
    private HashSet<Function> visitedFunctions;

    public Function(Type type, String name) {
        this.type = type;
        this.name = name;
        this.basicblocks = new LinkedList<>();
        this.reversePostOrder = new LinkedList<>();
        this.parameters = new LinkedList<>();
        this.usedGlobalVariables = new HashSet<>();
        this.recursiveUsedGlobalVariables = new HashSet<>();
        this.callee = new HashSet<>();
        this.visitedBasicBlocks = new HashSet<>();
        this.visitedFunctions = new HashSet<>();
    }

    private void dfsReversePostOrder(BasicBlock node) {
        if(visitedBasicBlocks.contains(node)) return;
        visitedBasicBlocks.add(node);
        for(BasicBlock bb : node.successors)
            dfsReversePostOrder(bb);
        reversePostOrder.addFirst(node);
    }

    private void dfsRecursiveUsedGlobalVariables(Function node) {
        if(visitedFunctions.contains(node)) return;
        visitedFunctions.add(node);
        for(Function func : node.callee)
            dfsRecursiveUsedGlobalVariables(func);
        recursiveUsedGlobalVariables.addAll(node.usedGlobalVariables);
    }

    public void finish() {
        /* calculate the successors and frontiers of all BasicBlocks*/
        for(BasicBlock bb : basicblocks) {
            while(!(bb.tail instanceof CJump || bb.tail instanceof Jump || bb.tail instanceof Return)) {
                bb.tail.remove();
            }
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
        visitedBasicBlocks.clear();
        dfsReversePostOrder(enterBB);

        /* calculate the recursive used global variables*/
        visitedFunctions.clear();
        recursiveUsedGlobalVariables.clear();
        dfsRecursiveUsedGlobalVariables(this);
    }

    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
