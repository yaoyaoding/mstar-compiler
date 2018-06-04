package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;

import java.net.Inet4Address;
import java.util.HashMap;
import java.util.HashSet;

import static Mstar.IR.Instruction.BinaryInst.BinaryOp.DIV;
import static Mstar.IR.Instruction.BinaryInst.BinaryOp.MOD;
import static Mstar.IR.Instruction.BinaryInst.BinaryOp.MUL;
import static Mstar.IR.RegisterSet.vrax;
import static Mstar.IR.RegisterSet.vrdx;

public class LocalValueNumberOptimizer implements IIRVisitor {
    IRProgram irProgram;
    Integer curValueNumber;
    HashMap<VirtualRegister,Integer> registerValueMap = new HashMap<>();
    HashMap<Pair, Integer> pairValueMap = new HashMap<>();
    HashMap<Integer, Integer> immediateValueMap = new HashMap<>();
    HashMap<Integer, HashSet<VirtualRegister>> valueRegisterMap = new HashMap<>();
    HashMap<Integer, Integer> valueImmediateMap = new HashMap<>();

    public LocalValueNumberOptimizer(IRProgram irProgram) {
        this.irProgram = irProgram;
    }

    public void run() {
        for(Function function : irProgram.functions) {
            for(BasicBlock bb : function.basicblocks) {
                processBasicBlock(bb);
            }
        }
    }

    class Pair {
        BinaryInst.BinaryOp op;
        Integer lvalue;
        Integer rvalue;

        public Pair(BinaryInst.BinaryOp op, Integer lvalue, Integer rvalue) {
            this.op = op;
            this.lvalue = lvalue;
            this.rvalue = rvalue;
        }

        @Override
        public int hashCode() {
            return op.ordinal() * 1000000 + lvalue * 1000 + rvalue;
        }

        @Override
        public boolean equals(Object bb) {
            if(bb instanceof Pair) {
                Pair a = this;
                Pair b = (Pair) bb;
                return a.op.ordinal() == b.op.ordinal() && a.lvalue.equals(b.lvalue) && a.rvalue.equals(b.rvalue);
            } else {
                return false;
            }
        }
    }

    private void processBasicBlock(BasicBlock bb) {
        curValueNumber = 0;
        registerValueMap.clear();
        pairValueMap.clear();
        immediateValueMap.clear();
        valueRegisterMap.clear();
        valueImmediateMap.clear();
        if(bb.blockId == 47) {
            System.err.println("I found you!");
        }
        for(IRInstruction inst = bb.head; inst != null; inst = inst.next) {
            inst.accept(this);
        }
    }
    private Integer getOperandValue(Operand operand) {
        if(operand instanceof VirtualRegister) {
            return getRegisterValue((VirtualRegister)operand);
        } else if(operand instanceof Immediate) {
            return getImmediateValue(((Immediate) operand).value);
        } else {
            return curValueNumber++;
        }
    }

    private Integer getImmediateValue(Integer imm) {
        if(!immediateValueMap.containsKey(imm)) {
            valueImmediateMap.put(curValueNumber, imm);
            immediateValueMap.put(imm, curValueNumber++);
        }
        return immediateValueMap.get(imm);
    }

    private Integer getRegisterValue(VirtualRegister register) {
        if(!registerValueMap.containsKey(register))
            addRegisterValue(register, curValueNumber++);
        return registerValueMap.get(register);
    }

    private Operand getValueOperand(Integer value) {
        if(valueImmediateMap.containsKey(value))
            return new Immediate(valueImmediateMap.get(value));
        else if(valueRegisterMap.containsKey(value)) {
            if(!valueRegisterMap.get(value).isEmpty())
                return valueRegisterMap.get(value).iterator().next();
            else
                return null;
        } else {
            return null;
        }
    }

    private void delRegisterValue(VirtualRegister register) {
        if(registerValueMap.containsKey(register)) {
            Integer value = registerValueMap.get(register);
            if(valueRegisterMap.containsKey(value))
                valueRegisterMap.get(value).remove(register);
            registerValueMap.remove(register);
        }
    }

    private void addRegisterValue(VirtualRegister register, Integer value) {
        if(!valueRegisterMap.containsKey(value))
            valueRegisterMap.put(value, new HashSet<>());
        valueRegisterMap.get(value).add(register);
        registerValueMap.put(register, value);
    }

    private void changeRegisterValue(VirtualRegister register, Integer newValue) {
        delRegisterValue(register);
        addRegisterValue(register, newValue);
    }

    private Integer doBinary(BinaryInst.BinaryOp op, Integer limm, Integer rimm) {
        switch (op) {
            case SUB: return limm - rimm;
            case XOR: return limm ^ rimm;
            case MUL: return limm * rimm;
            case MOD: if(rimm == 0) rimm = 1; return limm % rimm;
            case DIV: if(rimm == 0) rimm = 1; return limm / rimm;
            case AND: return limm & rimm;
            case ADD: return limm + rimm;
            case OR: return limm | rimm;
            case SAL: return limm << rimm;
            case SAR: return limm >> rimm;
            default: assert false; return 0;
        }
    }

    @Override
    public void visit(BinaryInst inst) {
        if(inst.op == MUL || inst.op == DIV || inst.op == MOD) {
            Integer lvalue = getOperandValue(vrax);
            Integer rvalue = getOperandValue(inst.src);
            Integer resultValue;
            Pair pair = new Pair(inst.op, lvalue, rvalue);
            if(pairValueMap.containsKey(pair)) {
                resultValue = pairValueMap.get(pair);
                Operand operand = getValueOperand(resultValue);
                if(operand != null) {
                    if(inst.op == DIV || inst.op == MOD) {
                        assert inst.prev instanceof Cdq;
                        inst.prev.remove();
                    }
                    inst.replace(new Move(inst.bb, inst.op == MOD ? vrdx : vrax, operand));
                }
            } else {
                resultValue = curValueNumber++;
                pairValueMap.put(pair, resultValue);
                if(valueImmediateMap.containsKey(pair.lvalue) && valueImmediateMap.containsKey(pair.rvalue)) {
                    Integer resultImm = doBinary(inst.op, valueImmediateMap.get(lvalue), valueImmediateMap.get(rvalue));
                    valueImmediateMap.put(resultValue, resultImm);
                    if(inst.op == DIV || inst.op == MOD) {
                        assert inst.prev instanceof Cdq;
                        inst.prev.remove();
                    }
                    inst.replace(new Move(inst.bb, inst.op == MOD ? vrdx : vrax, new Immediate(resultImm)));
                }
            }
            if(inst.op == MOD) {
                changeRegisterValue(vrax, curValueNumber++);
                changeRegisterValue(vrdx, resultValue);
            } else {
                changeRegisterValue(vrax, resultValue);
                changeRegisterValue(vrdx, curValueNumber++);
            }
        } else {
            Integer lvalue = getOperandValue(inst.dest);
            Integer rvalue = getOperandValue(inst.src);
            Integer resultValue;
            Pair pair = new Pair(inst.op, lvalue, rvalue);
            if(pairValueMap.containsKey(pair)) {
                resultValue = pairValueMap.get(pair);
                Operand operand = getValueOperand(resultValue);
                if(operand != null)
                    inst.replace(new Move(inst.bb, inst.dest, operand));
            } else {
                resultValue = curValueNumber++;
                pairValueMap.put(pair, resultValue);
                if(valueImmediateMap.containsKey(lvalue) && valueImmediateMap.containsKey(rvalue)) {
                    Integer resultImm = doBinary(inst.op, valueImmediateMap.get(lvalue), valueImmediateMap.get(rvalue));
                    valueImmediateMap.put(resultValue, resultImm);
                    inst.replace(new Move(inst.bb, inst.dest, new Immediate(resultImm)));
                }
            }
            if(inst.dest instanceof VirtualRegister)
                changeRegisterValue((VirtualRegister) inst.dest, resultValue);
        }
    }

    private Integer doUnary(UnaryInst.UnaryOp op, Integer imm) {
        switch (op) {
            case NOT: return ~imm;
            case NEG: return -imm;
            case INC: return imm+1;
            case DEC: return imm-1;
            default: assert false; return 0;
        }
    }

    @Override
    public void visit(UnaryInst inst) {
        Integer value = getOperandValue(inst.dest);
        Integer resultValue;
        if(valueImmediateMap.containsKey(value)) {
            Integer imm = valueImmediateMap.get(value);
            Integer resultImm = doUnary(inst.op, imm);
            resultValue = immediateValueMap.containsKey(resultImm) ? immediateValueMap.get(resultImm) : curValueNumber++;
            inst.replace(new Move(inst.bb, inst.dest, new Immediate(resultImm)));
        } else {
            resultValue = curValueNumber++;
        }
        if(inst.dest instanceof VirtualRegister)
            changeRegisterValue((VirtualRegister) inst.dest, resultValue);
    }

    @Override
    public void visit(Move inst) {
        Integer srcValue = getOperandValue(inst.src);
        if(valueImmediateMap.containsKey(srcValue))
            inst.replace(new Move(inst.bb, inst.dest, new Immediate(valueImmediateMap.get(srcValue))));
        if(inst.dest instanceof VirtualRegister)
            changeRegisterValue((VirtualRegister) inst.dest, srcValue);
    }

    @Override
    public void visit(Push inst) {
    }

    @Override
    public void visit(Pop inst) {
        if(inst.dest instanceof VirtualRegister)
            changeRegisterValue((VirtualRegister) inst.dest, curValueNumber++);
    }

    @Override
    public void visit(CJump inst) {
        Integer lvalue = getOperandValue(inst.src1);
        Integer rvalue = getOperandValue(inst.src2);
        if(valueImmediateMap.containsKey(lvalue))
            inst.src1 = new Immediate(valueImmediateMap.get(lvalue));
        if(valueImmediateMap.containsKey(rvalue))
            inst.src2 = new Immediate(valueImmediateMap.get(rvalue));
    }

    @Override
    public void visit(Jump inst) {
    }

    @Override
    public void visit(Lea inst) {
        if(inst.dest instanceof VirtualRegister)
            changeRegisterValue((VirtualRegister) inst.dest, curValueNumber++);
    }

    @Override
    public void visit(Return inst) {
    }

    @Override
    public void visit(Call inst) {
        changeRegisterValue(vrax, curValueNumber++);
    }

    @Override
    public void visit(Leave inst) {
    }

    @Override
    public void visit(Cdq inst) {
        changeRegisterValue(vrdx, curValueNumber++);
    }

    @Override public void visit(IRProgram program) { }
    @Override public void visit(Function function) { }
    @Override public void visit(BasicBlock basicBlock) { }
    @Override public void visit(VirtualRegister operand) { }
    @Override public void visit(PhysicalRegister operand) { }
    @Override public void visit(Memory operand) { }
    @Override public void visit(StackSlot operand) { }
    @Override public void visit(Constant operand) { }
    @Override public void visit(Immediate operand) { }
    @Override public void visit(StaticData operand) { }
    @Override public void visit(FunctionAddress operand) { }

}

