package Mstar.Worker.BackEnd;

import Mstar.Config;
import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;
import Mstar.IR.X86RegisterSet;

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
            ss.base = X86RegisterSet.rbp;
            ss.constant = new Immediate(16 + 8 * i);
        }
        for(int i = 0; i < frame.temporaries.size(); i++) {
            StackSlot ss = frame.temporaries.get(i);
            assert ss.base == null && ss.constant == null;
            ss.base = X86RegisterSet.rbp;
            ss.constant = new Immediate(-8 - 8 * i);
        }

        /*
            add prologue
         */
        IRInstruction headInst = function.enterBB.head;
        headInst.prepend(new Push(headInst.bb, X86RegisterSet.rbp));
        headInst.prepend(new Move(headInst.bb, X86RegisterSet.rbp, X86RegisterSet.rsp));
        headInst.prepend(new BinaryInst(headInst.bb, BinaryInst.BinaryOp.SUB, X86RegisterSet.rsp, new Immediate(frame.getFrameSize())));

        /*
            handle ret
         */
        Return ret = (Return)function.leaveBB.tail;
    }

    public void run() {
        for(Function function : irProgram.functions)
            processFunction(function);
    }
}
