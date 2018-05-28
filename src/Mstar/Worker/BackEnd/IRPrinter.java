package Mstar.Worker.BackEnd;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;
import Mstar.IR.IRProgram;
import Mstar.IR.Instruction.*;
import Mstar.IR.Operand.*;

import java.io.*;
import java.util.Formatter;
import java.util.HashMap;

import static Mstar.IR.X86RegisterSet.rax;
import static Mstar.IR.X86RegisterSet.rcx;
import static Mstar.IR.X86RegisterSet.rdx;
import static java.lang.System.exit;

public class IRPrinter implements IIRVisitor {
    IRProgram program;
    StringBuilder stringBuilder;
    HashMap<BasicBlock,String> bbNames;
    HashMap<VirtualRegister,String> varNames;
    HashMap<StackSlot,String> ssNames;
    HashMap<StaticData,String> sdNames;
    boolean inLeaInst;
    int bbCount = 0;
    int varCount = 0;
    int ssCount = 0;
    int sdCount = 0;

    public boolean showBlockHint = false;
    public boolean showNasm = false;

    public IRPrinter(IRProgram program) {
        this.program = program;
        this.stringBuilder = new StringBuilder();
        this.bbNames = new HashMap<>();
        this.varNames = new HashMap<>();
        this.ssNames = new HashMap<>();
        this.sdNames = new HashMap<>();
        this.inLeaInst = false;
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
    private String getStaticDataName(StaticData sd) {
        if(!sdNames.containsKey(sd))
            sdNames.put(sd, "g_" + String.valueOf(sdCount++));
        return sdNames.get(sd);
    }

    @Override
    public void visit(IRProgram program) {
        if(showNasm) {
            try {
                BufferedReader br = new BufferedReader(new FileReader("lib/c2nasm/lib.asm"));
                String line;
                while((line = br.readLine()) != null) append(line + "\n");
                append(";=====================================================================\n");
                append("\t section .text\n");
            } catch (IOException e) {
                e.printStackTrace();
                exit(0);
            }
        }
        for(Function function : program.functions)
            function.accept(this);

        if(showNasm) {
            append("\tsection .data\n");
            for(StaticData staticData : program.staticData) {
                append(getStaticDataName(staticData) + ":\n");
                if(staticData.init != null) {
                    append("\tdq " + String.valueOf(staticData.init.length()) + "\n");
                    append("\tdb ");
                    for(int i = 0; i < staticData.init.length(); i++) {
                        Formatter formatter = new Formatter();
                        formatter.format("%02XH, ", (int)staticData.init.charAt(i));
                        append(formatter.toString());
                    }
                    append("00H\n");
                } else {
                    append("\tdb ");
                    for(int i = 0; i < staticData.bytes; i++) {
                        if(i != 0)
                            append(", ");
                        append("00H");
                    }
                    append("\n");
                }
            }
        } else {
            for (StaticData staticData : program.staticData) {
                append(getStaticDataName(staticData) + ": " + String.valueOf(staticData.bytes) + " bytes");
                if (staticData.init != null)
                    append(" init: " + staticData.init);
                append("\n");
            }
        }
    }

    private String getNasmFunctionName(Function function) {
        switch(function.type) {
            case Library:
                return "__" + function.name;
            case External:
                return function.name;
            case UserDefined:
                return "_" + function.name;
            default:
                return null;
        }
    }

    @Override
    public void visit(Function function) {
        if(showNasm) {
            append(getNasmFunctionName(function) + ":\n");
        } else {
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
        }
        function.enterBB.accept(this);
        for(BasicBlock bb : function.basicblocks) {
            if(bb == function.enterBB || bb == function.leaveBB)
                continue;
            bb.accept(this);
        }
        if(function.leaveBB != function.enterBB)
            function.leaveBB.accept(this);
        if(!showNasm)
            append("}\n");
    }

    @Override
    public void visit(BasicBlock basicBlock) {
        append("\t" + getBasicBlockName(basicBlock) + (showBlockHint && !showNasm ? "(" + basicBlock.hint + ")" : "") + ":\n");
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
        boolean occur = false;
        if(!inLeaInst)
            append("qword ");
        append("[");
        if(operand.base != null) {
            operand.base.accept(this);
            occur = true;
        }
        if(operand.index != null) {
            if(occur)
                append(" + ");
            operand.index.accept(this);
            if(operand.scale != 1)
                append(" * " + String.valueOf(operand.scale));
            occur = true;
        }
        if(operand.constant != null) {
            Constant constant = operand.constant;
            if(constant instanceof StaticData) {
                if(occur)
                    append(" + ");
                constant.accept(this);
            } else if(constant instanceof Immediate) {
                int value = ((Immediate) constant).value;
                if(occur) {
                    if(value > 0)
                        append(" + " + String.valueOf(value));
                    else if(value < 0)
                        append(" - " + String.valueOf(-value));
                } else {
                    append(String.valueOf(value));
                }
            }
        }
        append("]");
    }

    @Override
    public void visit(StackSlot operand) {
        if(operand.base != null || operand.index != null || operand.constant != null) {
            visit((Memory)operand);
        } else {
            append(getStackSlotName(operand));
        }
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
        append(getStaticDataName(operand));
    }

    private void processMul(BinaryInst inst) {
        if(inst.dest != rdx) visit(new Push(null, rdx));
        if(inst.dest != rax) visit(new Push(null, rax));
        if(inst.src == rax) {
            append("\timul ");
            inst.dest.accept(this);
            append("\n");
            visit(new Move(null, inst.dest, rax));
        } else {
            visit(new Move(null, rax, inst.dest));
            append("\timul ");
            inst.src.accept(this);
            append("\n");
            visit(new Move(null, inst.dest, rax));
        }
        visit(new Move(null, rax, inst.dest));
        if(inst.dest != rax) visit(new Pop(null, rax));
        if(inst.dest != rdx) visit(new Pop(null, rdx));
    }
    void processDivMod(BinaryInst inst) {
        PhysicalRegister need = inst.op == BinaryInst.BinaryOp.DIV ? rax : rdx;

        if(inst.dest != rdx) visit(new Push(null, rdx));
        if(inst.dest != rax) visit(new Push(null, rax));
        if(inst.dest != rcx) visit(new Push(null, rcx));

        visit(new Push(null, inst.dest));
        visit(new Push(null, inst.src));

        visit(new Pop(null, rcx));
        visit(new Pop(null, rax));
        visit(new Move(null, rdx, new Immediate(0)));

        append("\tidiv ");
        rcx.accept(this);
        append("\n");

        visit(new Move(null, inst.dest, need));
        if(inst.dest != rcx) visit(new Pop(null, rcx));
        if(inst.dest != rax) visit(new Pop(null, rax));
        if(inst.dest != rdx) visit(new Pop(null, rdx));
    }

    @Override
    public void visit(BinaryInst inst) {
        String op = null;
        if(showNasm) {
            if(inst.op == BinaryInst.BinaryOp.MUL) {
                processMul(inst);
                return;
            }
            if(inst.op == BinaryInst.BinaryOp.DIV || inst.op == BinaryInst.BinaryOp.MOD) {
                processDivMod(inst);
                return;
            }
        }
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
        if(inst.src == inst.dest)
            return;
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
        switch (inst.op) {
            case E: op = "je"; break;
            case G: op = "jg"; break;
            case L: op = "jl"; break;
            case GE: op = "jge"; break;
            case LE: op = "jle"; break;
            case NE: op = "jne"; break;
        }
        if(showNasm) {
            append("\tcmp ");
            inst.src1.accept(this);
            append(", ");
            inst.src2.accept(this);
            append("\n");
            append("\t" + op + " " + getBasicBlockName(inst.thenBB) + "\n");
            append("\tjmp" + " " + getBasicBlockName(inst.elseBB) + "\n");
        } else {
            append("\t" + op + " ");
            inst.src1.accept(this);
            append(", ");
            inst.src2.accept(this);
            append(", " + getBasicBlockName(inst.thenBB) + ", " + getBasicBlockName(inst.elseBB) + "\n");
        }
    }

    @Override
    public void visit(Jump inst) {
        append("\tjmp " + getBasicBlockName(inst.targetBB) + "\n");
    }

    @Override
    public void visit(Lea inst) {
        inLeaInst = true;
        append("\tlea ");
        inst.dest.accept(this);
        append(", ");
        inst.src.accept(this);
        append("\n");
        inLeaInst = false;
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

        if(showNasm)
            append(getNasmFunctionName(inst.func));
        else
            append(inst.func.name);

        if (inst.args != null) {
            for (Operand operand : inst.args) {
                append(", ");
                operand.accept(this);
            }
        }
        append("\n");
    }

    @Override
    public void visit(Leave inst) {
        append("\tleave\n");
    }
}
