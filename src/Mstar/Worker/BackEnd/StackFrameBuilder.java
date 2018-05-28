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
        IRInstruction headInst = function.enterBB.head;
        for(int i = 0; i < parameters.size(); i++) {
            StackSlot ss = (StackSlot) parameters.get(i).spillPlace;
            if(i < paraRegsiters.length) {
                headInst.prepend(new Move(headInst.bb, ss, X86RegisterSet.regs.get(paraRegsiters[i])));
                frame.temporaries.add(ss);
            } else {
                frame.parameters.add(ss);
            }
        }
        HashSet<StackSlot> slotsSet = new HashSet<>();
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                LinkedList<StackSlot> slots = inst.getStackSlots();
                for(StackSlot ss : slots) {
                    if(frame.parameters.contains(ss) || frame.temporaries.contains(ss))
                        continue;
                    slotsSet.add(ss);
                }
            }
        }
        frame.temporaries.addAll(slotsSet);
        for(int i = 0; i < frame.parameters.size(); i++) {
            StackSlot ss = frame.parameters.get(i);
            ss.base = X86RegisterSet.rbp;
            ss.constant = new Immediate(16 + 8 * i);
        }
        for(int i = 0; i < frame.temporaries.size(); i++) {
            StackSlot ss = frame.temporaries.get(i);
            ss.base = X86RegisterSet.rbp;
            ss.constant = new Immediate(-8 - 8 * i);
        }

        /*
            add prologue
         */
        headInst = function.enterBB.head;
        headInst.prepend(new Push(headInst.bb, X86RegisterSet.rbp));
        headInst.prepend(new Move(headInst.bb, X86RegisterSet.rbp, X86RegisterSet.rsp));
        headInst.prepend(new BinaryInst(headInst.bb, BinaryInst.BinaryOp.SUB, X86RegisterSet.rsp, new Immediate(frame.getFrameSize())));

        /*
            TODO: add callee saved register backup
         */

        /*
            handle call function
         */
        for(BasicBlock bb : function.basicblocks) {
            for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
                if(!(inst instanceof Call)) continue;
                Call call = (Call)inst;
                LinkedList<Operand> args = call.args;
                IRInstruction curInst = call;
                for(int i = 0; i < args.size(); i++) {
                    Operand operand = args.get(i);
                    if(i < 6) {
                        call.prepend(new Move(bb, X86RegisterSet.regs.get(paraRegsiters[i]), operand));
                    } else {
                        curInst.prepend(new Push(bb, operand));
                        curInst = curInst.prev;
                    }
                }
                if(call.dest != null) {
                    call.append(new Move(bb, call.dest, X86RegisterSet.rax));
                    inst = inst.next;   //  skip the added inst
                }
                call.args = null;
                call.dest = null;
            }
        }

        /*
            handle ret
         */
        Return ret = (Return)function.leaveBB.tail;
        if(ret.src != null) {
            ret.prepend(new Move(function.leaveBB, X86RegisterSet.rax, ret.src));
            ret.src = null;
        }

        /*
            TODO: add resume callee saved register
         */

        ret.prepend(new Leave(function.leaveBB));
    }

    public void run() {
        for(Function function : irProgram.functions)
            processFunction(function);
    }
}
