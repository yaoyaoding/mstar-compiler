package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.IRInstruction;
import Mstar.IR.Instruction.Move;
import Mstar.IR.Operand.*;
import Mstar.IR.X86RegisterSet;
import Mstar.Worker.BackEnd.LivenessAnalyzer.Graph;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

public class SimpleGraphAllocator {
    //  general
    private IRProgram irProgram;
    private IRPrinter irPrinter = new IRPrinter();
    private static LivenessAnalyzer livenessAnalyzer = new LivenessAnalyzer();
    private LinkedList<PhysicalRegister> generalRegisters = new LinkedList<>();
    private int K;


    public SimpleGraphAllocator(IRProgram irProgram) {
        this.irProgram = irProgram;
        for(PhysicalRegister pr : X86RegisterSet.regs) {
            if(pr.name.equals("rsp") || pr.name.equals("rbp"))
                continue;
            generalRegisters.add(pr);
        }
        K = generalRegisters.size();
    }

    public void run() {
        for(Function function : irProgram.functions) {
            this.function = function;
            processFunction();
        }
    }

    private void showFunction(Function function) {
        Graph graph = new Graph();

        irPrinter.init();
        irPrinter.showNasm = false;
        irPrinter.visit(function);
        irPrinter.printTo(System.err);

        livenessAnalyzer.getInferenceGraph(function, graph, null);
        System.err.println("Use and Define Set:");
        for(BasicBlock bb : function.reversePostOrder) {
            System.err.print(irPrinter.bbNames.get(bb) + ": ");
            for(VirtualRegister reg : livenessAnalyzer.definedRegisters.get(bb))
                System.err.print(irPrinter.varNames.get(reg) + " ");
            System.err.print(": ");
            for(VirtualRegister reg : livenessAnalyzer.usedRegisters.get(bb))
                System.err.print(irPrinter.varNames.get(reg) + " ");
            System.err.print("\n");
        }
        System.err.println("LiveOut Set:");
        for(BasicBlock bb : function.reversePostOrder) {
            System.err.print(irPrinter.bbNames.get(bb) + ": ");
            for(VirtualRegister reg : livenessAnalyzer.liveOut.get(bb))
                System.err.print(irPrinter.varNames.get(reg) + " ");
            System.err.print("\n");
        }
        System.err.println("Interference Graph:");
        for(VirtualRegister reg : graph.getAllRegisters()) {
            System.err.print(irPrinter.varNames.get(reg) + ": ");
            for(VirtualRegister adjReg : graph.getAdjacents(reg)) {
                System.err.print(irPrinter.varNames.get(adjReg) + " ");
            }
            System.err.print("\n");
        }
        System.err.print("\n\n\n");
    }

    private LinkedList<VirtualRegister> trans(LinkedList<Register> regs) {
        LinkedList<VirtualRegister> ret = new LinkedList<>();
        for(Register r : regs) {
            ret.add((VirtualRegister)r);
        }
        return ret;
    }

    //  for process function
    Function function;
    Graph orignGraph;
    Graph graph;
    HashSet<VirtualRegister> simplifyWorklist;
    HashSet<VirtualRegister> spillWorklist;
    HashSet<VirtualRegister> spilledRegisers;
    LinkedList<VirtualRegister> selectStack;
    HashMap<VirtualRegister, PhysicalRegister> colors;

    private void init() {
        simplifyWorklist = new HashSet<>();
        spillWorklist = new HashSet<>();
        spilledRegisers = new HashSet<>();
        selectStack = new LinkedList<>();
        colors = new HashMap<>();
        for(VirtualRegister vr : graph.getAllRegisters()) {
            if(graph.getDegree(vr) < K)
                simplifyWorklist.add(vr);
            else
                spillWorklist.add(vr);
        }
    }
    private void simplify() {
        VirtualRegister reg = simplifyWorklist.iterator().next();
        LinkedList<VirtualRegister> neighbors = new LinkedList<>(graph.getAdjacents(reg));
        graph.delRegister(reg);
        for(VirtualRegister vr : neighbors) {
            if(graph.getDegree(vr) < K && spillWorklist.contains(vr)) {
                spillWorklist.remove(vr);
                simplifyWorklist.add(vr);
            }
        }
        simplifyWorklist.remove(reg);
        selectStack.addFirst(reg);
    }
    private void spill() {
        VirtualRegister candidate = null;
        int rank = -2;
        for(VirtualRegister vr : spillWorklist) {
            int curRank = graph.getDegree(vr);
            if(vr.allocatedPhysicalRegister != null)    //  spill the precolored vr at last
                curRank = -1;
            if(curRank > rank) {
                candidate = vr;
                rank = curRank;
            }
        }
        graph.delRegister(candidate);
        spillWorklist.remove(candidate);
        selectStack.addFirst(candidate);
    }
    private void assignColors() {
        for(VirtualRegister vr : selectStack) {
            if(vr.allocatedPhysicalRegister != null)
                colors.put(vr, vr.allocatedPhysicalRegister);
        }
        for(VirtualRegister vr : selectStack) {
            if(vr.allocatedPhysicalRegister != null)
                continue;
            HashSet<PhysicalRegister> okColors = new HashSet<>(generalRegisters);
            for(VirtualRegister neighbor : orignGraph.getAdjacents(vr)) {
                if(colors.containsKey(neighbor))
                    okColors.remove(colors.get(neighbor));
            }
            if(okColors.isEmpty()) {
                spilledRegisers.add(vr);
            } else {
                PhysicalRegister pr = null;
                for(PhysicalRegister reg : X86RegisterSet.callerSave) {
                    if (okColors.contains(reg)) {
                        pr = reg;
                        break;
                    }
                }
                if(pr == null)
                    pr = okColors.iterator().next();
                colors.put(vr, pr);
            }
        }
    }
    private void rewriteFunction() {
        HashMap<VirtualRegister, Memory> spillPlaces = new HashMap<>();
        for(VirtualRegister vr : spilledRegisers) {
            if(vr.spillPlace != null) {
                spillPlaces.put(vr,  vr.spillPlace);
            } else {
                spillPlaces.put(vr, new StackSlot(vr.hint));
            }
        }
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                LinkedList<VirtualRegister> used = new LinkedList<>(trans(inst.getUseRegs()));
                LinkedList<VirtualRegister> defined = new LinkedList<>(trans(inst.getDefRegs()));
                HashMap<Register,Register> renameMap = new HashMap<>();
                used.retainAll(spilledRegisers);
                defined.retainAll(spilledRegisers);
                for(VirtualRegister reg : used)
                    if(!renameMap.containsKey(reg)) renameMap.put(reg, new VirtualRegister(""));
                for(VirtualRegister reg : defined)
                    if(!renameMap.containsKey(reg)) renameMap.put(reg, new VirtualRegister(""));
                inst.renameDefReg(renameMap);
                inst.renameUseReg(renameMap);
                for(VirtualRegister reg : used)
                    inst.prepend(new Move(inst.bb, renameMap.get(reg), spillPlaces.get(reg)));
                for(VirtualRegister reg : defined) {
                    inst.append(new Move(inst.bb, spillPlaces.get(reg), renameMap.get(reg)));
                    inst = inst.next;
                }
            }
        }
    }
    private void replaceRegisers() {
        HashMap<Register,Register> renameMap = new HashMap<>();
        for(HashMap.Entry<VirtualRegister,PhysicalRegister> entry : colors.entrySet())
            renameMap.put(entry.getKey(), entry.getValue());
        for(BasicBlock bb : function.basicblocks)
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                inst.renameUseReg(renameMap);
                inst.renameDefReg(renameMap);
            }
    }
    private void processFunction() {
        orignGraph = new Graph();
        while(true) {
//            showFunction(function);

            livenessAnalyzer.getInferenceGraph(function, orignGraph, null);
            graph = new Graph(orignGraph);
            init();
            do {
                if (!simplifyWorklist.isEmpty()) simplify();
                else if (!spillWorklist.isEmpty()) spill();
            } while (!simplifyWorklist.isEmpty() || !spillWorklist.isEmpty());
            assignColors();
            if (!spilledRegisers.isEmpty())
                rewriteFunction();
            else {
                replaceRegisers();
                break;
            }
        }

        function.finishAllocate();

//        irPrinter.init();
//        irPrinter.visit(function);
//        irPrinter.printTo(System.err);
    }

}
