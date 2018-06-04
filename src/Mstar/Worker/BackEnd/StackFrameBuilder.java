package Mstar.Worker.BackEnd;

import Mstar.Config;
import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;
import Mstar.IR.RegisterSet;

import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;

public class StackFrameBuilder {
    /*

    1. Stack Frame
        low address
    | ...             |
    | temporary[n]    | <--- callee's rsp
    | ...             |
    | temporary[1]    | [rbp - 16]
    | temporary[0]    | [rbp - 8]
    | caller's rbp    | <--- callee's rbp
    | return address  | [rbp + 8]
    | arg[6]          | [rbp + 16]
    | arg[7]          | [rbp + 24]
    | ...             |
        high address
    call(a,b,c,d,e,f,g,h,i)
    2. The first 6 arguments are passed by registers:
    arg[0]  arg[1]  arg[2]  arg[3]  arg[4]  arg[5]
    rdi     rsi     rdx     rcx     r8      r9

     */
    class Frame {
        public LinkedList<StackSlot> parameters = new LinkedList<>();
        public LinkedList<StackSlot> temporaries = new LinkedList<>();
        public int getFrameSize() {
            int bytes = Config.REGISTER_WIDTH * (parameters.size() + temporaries.size());
            bytes = (bytes + 16 - 1) / 16 * 16; //  round up to a multiply of 16
            return bytes;
        }
    }

    private IRProgram irProgram;
    private HashMap<Function, Frame> framesMap;

    public StackFrameBuilder(IRProgram irProgram) {
        this.irProgram = irProgram;
        this.framesMap = new HashMap<>();
    }

    private void processFunction(Function function) {
        Frame frame = new Frame();
        framesMap.put(function, frame);
        LinkedList<VirtualRegister> parameters = function.parameters;
        int[] paraRegsiters = new int[] {7, 6, 2, 1, 8, 9};
        for(int i = 0; i < parameters.size(); i++) {
            if(i >= paraRegsiters.length) {
                StackSlot ss = (StackSlot) parameters.get(i).spillPlace;
                frame.parameters.add(ss);
            }
        }
        HashSet<StackSlot> slotsSet = new HashSet<>();
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                LinkedList<StackSlot> slots = inst.getStackSlots();
                for(StackSlot ss : slots) {
                    if(frame.parameters.contains(ss))
                        continue;
                    slotsSet.add(ss);
                }
            }
        }
        frame.temporaries.addAll(slotsSet);
        for(int i = 0; i < frame.parameters.size(); i++) {
            StackSlot ss = frame.parameters.get(i);
            assert ss.base == null && ss.constant == null;
            ss.base = RegisterSet.rbp;
            ss.constant = new Immediate(16 + 8 * i);
        }
        for(int i = 0; i < frame.temporaries.size(); i++) {
            StackSlot ss = frame.temporaries.get(i);
            assert ss.base == null && ss.constant == null;
            ss.base = RegisterSet.rbp;
            ss.constant = new Immediate(-8 - 8 * i);
        }

        /*
            save caller save registers before call
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(!(inst instanceof Call)) continue;
                Call call = (Call)inst;
                HashSet<PhysicalRegister> needToSave = new HashSet<>(call.func.recursiveUsedPhysicalRegisters);
                needToSave.retainAll(RegisterSet.callerSave);
                needToSave.retainAll(function.usedPhysicalRegisters);
                needToSave.remove(RegisterSet.rax);
                for(int i = 0; i < call.args.size() && i < 6; i++)
                    needToSave.remove(RegisterSet.args.get(i));
                for(PhysicalRegister reg : needToSave)
                    inst.prepend(new Push(bb, reg));
                for(PhysicalRegister reg : needToSave)
                    inst.append(new Pop(bb, reg));
                for(int i = 0; i < needToSave.size(); i++)
                    inst = inst.next;
            }
        }
         */

        /*
            add prologue
         */
        IRInstruction headInst = function.enterBB.head;
        headInst.prepend(new Push(headInst.bb, RegisterSet.rbp));
        headInst.prepend(new Move(headInst.bb, RegisterSet.rbp, RegisterSet.rsp));
        headInst.prepend(new BinaryInst(headInst.bb, BinaryInst.BinaryOp.SUB, RegisterSet.rsp, new Immediate(frame.getFrameSize())));
        HashSet<PhysicalRegister> needToSave = new HashSet<>(function.usedPhysicalRegisters);
        needToSave.retainAll(RegisterSet.calleeSave);
        headInst = headInst.prev;
        for(PhysicalRegister pr : needToSave)
            headInst.append(new Push(headInst.bb, pr));

        /*
            handle ret
         */
        Return ret = (Return)function.leaveBB.tail;
        for(PhysicalRegister pr : needToSave)
            ret.prepend(new Pop(ret.bb, pr));
        ret.prepend(new Leave(ret.bb));
    }

    public void run() {
        for(Function function : irProgram.functions)
            processFunction(function);
    }
}
