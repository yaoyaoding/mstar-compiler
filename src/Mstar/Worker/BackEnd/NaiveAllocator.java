package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;

import java.util.*;

import static Mstar.IR.RegisterSet.*;

public class NaiveAllocator {
    IRProgram irProgram;
    LinkedList<PhysicalRegister> generalRegisters = new LinkedList<>();

    public NaiveAllocator(IRProgram irProgram) {
        this.irProgram = irProgram;
        this.generalRegisters.add(rbx);
        this.generalRegisters.add(r10);
        this.generalRegisters.add(r11);
        this.generalRegisters.add(r12);
        this.generalRegisters.add(r13);
        this.generalRegisters.add(r14);
        this.generalRegisters.add(r15);
    }

    public void run() {
        for(Function function : irProgram.functions)
            processFunction(function);
    }

    private PhysicalRegister getPhysical(Operand v) {
        if(v instanceof VirtualRegister)
            return ((VirtualRegister) v).allocatedPhysicalRegister;
        else
            return null;
    }

    private void processFunction(Function function) {
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {

                if(inst instanceof Call) continue;

                HashMap<Register, Register> renameMap = new HashMap<>();
                HashSet<Register> allRegs = new HashSet<>();
                HashSet<Register> usedRegs = new HashSet<>(inst.getUseRegs());
                HashSet<Register> definedRegs = new HashSet<>(inst.getDefRegs());
                allRegs.addAll(usedRegs);
                allRegs.addAll(definedRegs);

                for(Register avr : allRegs) {
                    assert avr instanceof VirtualRegister;
                    VirtualRegister vr = (VirtualRegister) avr;
                    if(vr.allocatedPhysicalRegister != null) continue;
                    if(vr.spillPlace == null)
                        vr.spillPlace = new StackSlot(vr.hint);
                }

                if(inst instanceof Move) {
                    Move move = (Move)inst;
                    Address dest = move.dest;
                    Operand src = move.src;
                    PhysicalRegister pdest = getPhysical(dest);
                    PhysicalRegister psrc = getPhysical(src);
                    if(pdest != null && psrc != null) {
                        move.dest = pdest;
                        move.src = psrc;
                        continue;
                    } else if(pdest != null) {
                        move.dest = pdest;
                        if(move.src instanceof VirtualRegister) {
                            move.src = ((VirtualRegister) move.src).spillPlace;
                        } else if(move.src instanceof Constant) {
                        } else {
                            assert false;
                        }
                        continue;
                    } else if(psrc != null) {
                        move.src = psrc;
                        if(move.dest instanceof VirtualRegister) {
                            move.dest = ((VirtualRegister) move.dest).spillPlace;
                        } else {
                            assert false;
                        }
                        continue;
                    }
                }

                int cnt = 0;
                for (Register reg : allRegs) {
                    if (!renameMap.containsKey(reg)) {
                        PhysicalRegister pr = ((VirtualRegister)reg).allocatedPhysicalRegister;
                        if(pr == null)
                            renameMap.put(reg, generalRegisters.get(cnt++));
                        else {
                            renameMap.put(reg, pr);
                        }
                    }
                }
                inst.renameUseReg(renameMap);
                inst.renameDefReg(renameMap);

                for (Register reg : usedRegs) {
                    if(((VirtualRegister)reg).allocatedPhysicalRegister == null)
                        inst.prepend(new Move(bb, renameMap.get(reg),((VirtualRegister) reg).spillPlace));
                }
                for (Register reg : definedRegs) {
                    if(((VirtualRegister)reg).allocatedPhysicalRegister == null) {
                        inst.append(new Move(bb, ((VirtualRegister) reg).spillPlace, renameMap.get(reg)));
                        inst = inst.next;
                    }
                }
            }
        }
    }
}

