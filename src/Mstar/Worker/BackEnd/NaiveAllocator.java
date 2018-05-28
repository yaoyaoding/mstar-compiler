package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.Call;
import Mstar.IR.Instruction.IRInstruction;
import Mstar.IR.Instruction.Move;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.PhysicalRegister;
import Mstar.IR.Operand.Register;
import Mstar.IR.Operand.VirtualRegister;

import java.util.*;

public class NaiveAllocator {
    IRProgram irProgram;
    LinkedList<PhysicalRegister> physicalRegisters;

    public NaiveAllocator(IRProgram irProgram, LinkedList<PhysicalRegister> physicalRegisters) {
        this.irProgram = irProgram;
        this.physicalRegisters = new LinkedList<>();
        this.physicalRegisters.addAll(physicalRegisters);
    }

    public void run() {
        for(Function function : irProgram.functions)
            processFunction(function);
    }

    private void processFunction(Function function) {
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(inst instanceof Call) {
                    Call call = (Call) inst;
                    LinkedList<Operand> args = call.args;
                    for(int i = 0; i < args.size(); i++) {
                        Operand operand = args.get(i);
                        if(operand instanceof VirtualRegister) {
                            args.set(i, ((VirtualRegister) operand).spillPlace);
                        }
                    }
                }
                HashMap<Register, Register> renameMap = new HashMap<>();
                HashSet<Register> allRegs = new HashSet<>();
                HashSet<Register> usedRegs = new HashSet<>(inst.getUseRegs());
                HashSet<Register> definedRegs = new HashSet<>(inst.getDefRegs());
                allRegs.addAll(usedRegs);
                allRegs.addAll(definedRegs);

                int cnt = 0;
                for (Register reg : allRegs) {
                    assert reg instanceof VirtualRegister;
                    if (!renameMap.containsKey(reg))
                        renameMap.put(reg, physicalRegisters.get(cnt++));
                }
                inst.renameUseReg(renameMap);
                inst.renameDefReg(renameMap);

                for (Register reg : usedRegs)
                    inst.prepend(new Move(bb, renameMap.get(reg), ((VirtualRegister) reg).spillPlace));
                for (Register reg : definedRegs) {
                    inst.append(new Move(bb, ((VirtualRegister) reg).spillPlace, renameMap.get(reg)));
                    inst = inst.next;
                }
            }
        }
    }
}

