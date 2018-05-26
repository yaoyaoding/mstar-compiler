package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;

import java.io.PrintStream;
import java.util.HashMap;
import java.util.Set;

public class IRPrinter implements IIRVisitor {
    IRProgram program;
    StringBuilder stringBuilder;
    HashMap<BasicBlock,String> bbNames;
    HashMap<VirtualRegister,String> varNames;
    HashMap<StackSlot,String> ssNames;
    int bbCount = 0;
    int varCount = 0;
    int ssCount = 0;

    public IRPrinter(IRProgram program) {
        this.program = program;
        bbNames = new HashMap<>();
        varNames = new HashMap<>();
        visit(program);
    }
    public String toString() {
        return stringBuilder.toString();
    }
    public void printTo(PrintStream out) {
        out.print(toString());
    }

    private void appendln(String s) {
        stringBuilder.append(s + "\n");
    }
    private void append(String s) {
        stringBuilder.append(s);
    }
    private String getBasicBlockName(BasicBlock bb) {
        if(!bbNames.containsKey(bb))
            bbNames.put(bb, "b" + String.valueOf(bbCount++));
        return bbNames.get(bb);
    }
    private String getVirtualRegsiterName(VirtualRegister virtualRegister) {
        if(!varNames.containsKey(virtualRegister))
            varNames.put(virtualRegister, "v" + String.valueOf(varCount++));
        return varNames.get(virtualRegister);
    }
    private String getStackSlotName(StackSlot ss) {
        if(!ssNames.containsKey(ss))
            ssNames.put(ss, "stack[" + String.valueOf(ssCount++) + "]");
        return ssNames.get(ss);
    }

    @Override
    public void visit(IRProgram program) {
        for(Function function : program.functions)
            function.accept(this);
        for(StaticData staticData : program.staticData)
            staticData.accept(this);
    }

    @Override
    public void visit(Function function) {
        append("define " + function.name + " ");
        append("(");
        boolean first = true;
        for(VirtualRegister vr : function.parameters) {
            if(first)
                first = false;
            else
                append(",");
            vr.accept(this);
        }
        append(") {\n");
        for(BasicBlock bb : function.basicblocks)
            bb.accept(this);
        append("}\n");
    }

    @Override
    public void visit(BasicBlock basicBlock) {
        append("\t" + getBasicBlockName(basicBlock) + ":\n");
        for(IRInstruction inst = basicBlock.head; inst != null; inst = inst.next)
            inst.accept(this);
    }

    @Override
    public void visit(VirtualRegister operand) {
        append(getVirtualRegsiterName(operand));
    }

    @Override
    public void visit(PhysicalRegister operand) {
        append(operand.name);
    }

    @Override
    public void visit(Memory operand) {
        int count = 0;
        if(operand.base != null) count++;
        if(operand.index != null) count++;
        if(operand.constant != null) count++;
        append("[");
        if(operand.base != null) {
            operand.base.accept(this);
            count--;
            if(count > 0)
                append(" +");
        }
        if(operand.index != null) {
            operand.index.accept(this);
            if(operand.scale != 1)
                append(" * " + String.valueOf(operand.scale));
            count--;
            if(count > 0)
                append(" +");
        }
        if(operand.constant != null)
            operand.constant.accept(this);
        append("]");
    }

    @Override
    public void visit(StackSlot operand) {
        append(getStackSlotName(operand));
    }

    @Override
    public void visit(Constant operand) {
        assert false;
    }

    @Override
    public void visit(Immediate operand) {
        append(String.valueOf(operand.value));
    }

    @Override
    public void visit(StaticData operand) {
        append("global_" + operand.hint);
    }

    @Override
    public void visit(BinaryInst inst) {
        String op = null;
        switch(inst.op) {
            case OR:  op = "or"; break;
            case ADD: op = "add"; break;
            case AND: op = "and"; break;
            case DIV: op = "div"; break;
            case MOD: op = "mod"; break;
            case MUL: op = "mul"; break;
            case SHL: op = "shl"; break;
            case SHR: op = "shr"; break;
            case SUB: op = "sub"; break;
            case XOR: op = "xor"; break;
        }
        append("\t" + op + " ");
        inst.dest.accept(this);
        append(", ");
        inst.src.accept(this);
        append("\n");
    }

    @Override
    public void visit(UnaryInst inst) {
        String op = null;
        switch(inst.op) {
            case DEC: op = "dec"; break;
            case INC: op = "inc"; break;
            case NEG: op = "neg"; break;
            case NOT: op = "not"; break;
        }
        append("\t" + op + " ");
        inst.dest.accept(this);
        append("\n");
    }

    @Override
    public void visit(Move inst) {
        append("\tmov ");
        inst.dest.accept(this);
        append(", ");
        inst.src.accept(this);
        append("\n");
    }

    @Override
    public void visit(Push inst) {
        append("\tpush ");
        inst.src.accept(this);
        append("\n");
    }

    @Override
    public void visit(Pop inst) {
        append("\tpop ");
        inst.dest.accept(this);
        append("\n");
    }

    @Override
    public void visit(CJump inst) {
        String op = null;
        switch(inst.op) {
            case E: op = "je"; break;
            case G: op = "jg"; break;
            case L: op = "jl"; break;
            case GE: op = "jge"; break;
            case LE: op = "jle"; break;
            case NE: op = "jne"; break;
        }
        append("\t" + op + " ");
        inst.src1.accept(this);
        append(", ");
        inst.src2.accept(this);
        append(", " + getBasicBlockName(inst.thenBB) + ", " + getBasicBlockName(inst.elseBB) + "\n");
    }

    @Override
    public void visit(Jump inst) {
        append("\tjump " + getBasicBlockName(inst.targetBB) + "\n");
    }

    @Override
    public void visit(Lea inst) {
        append("\tlea ");
        inst.dest.accept(this);
        append(", ");
        inst.src.accept(this);
        append("\n");
    }

    @Override
    public void visit(Return inst) {
        append("\tret ");
        if(inst.src != null)
            inst.src.accept(this);
        append("\n");
    }

    @Override
    public void visit(Call inst) {
        append("\tcall ");

        if(inst.dest != null) {
            inst.dest.accept(this);
            append(" = ");
        }

        append(inst.func.name);

        for(Operand operand : inst.args) {
            append(", ");
            operand.accept(this);
        }
    }
}
