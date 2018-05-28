package Mstar.IR;

import Mstar.IR.Operand.StackSlot;
import Mstar.IR.Operand.VirtualRegister;
import Mstar.Symbol.FunctionSymbol;

import java.util.LinkedList;

public class Function {
    public enum Type {
        External, Library, UserDefined
    }
    public Type type;
    public String name;
    public BasicBlock enterBB;
    public BasicBlock leaveBB;
    public LinkedList<BasicBlock> basicblocks;
    public LinkedList<Function> callee;
    public LinkedList<VirtualRegister> parameters;

    public Function(Type type, String name) {
        this.type = type;
        this.name = name;
        this.callee = new LinkedList<>();
        this.basicblocks = new LinkedList<>();
        this.parameters = new LinkedList<>();
    }

    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
