package Mstar.IR.Instruction;

import Mstar.IR.BasicBlock;
import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;
import Mstar.IR.Operand.Address;
import Mstar.IR.Operand.Operand;
import Mstar.IR.Operand.Register;

import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedList;

public class Call extends IRInstruction {
    public Address dest;
    public Function func;
    public LinkedList<Operand> args;

    public Call(BasicBlock bb, Address dest, Function func, LinkedList<Operand> args) {
        super(bb);
        this.dest = dest;
        this.func = func;
        this.args.addAll(args);
    }
    public Call(BasicBlock bb, Address dest, Function func, Operand... args) {
        super(bb);
        this.dest = dest;
        this.func = func;
        this.args.addAll(Arrays.asList(args));
    }

    @Override
    Collection<Register> getUseRegs() {
        Collection<Register> useRegs = new LinkedList<>();
        for(Operand operand : args) {
            if(operand instanceof Register)
                useRegs.add((Register) operand);
        }
        return useRegs;
    }

    @Override
    Collection<Register> getDefRegs() {
        return new LinkedList<>();
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
