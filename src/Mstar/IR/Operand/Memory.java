package Mstar.IR.Operand;

import Mstar.IR.IIRVisitor;

public class Memory extends Address {
    public Register base = null;
    public Register index = null;
    public int scale = 0;   //  0, 1, 2, 4, 8
    public Constant constant = null;

    public Memory() { }
    public Memory(Register base) {
        this.base = base;
    }
    public Memory(Register base, Register index, int scale) {
        this.base = base;
        this.index = index;
        this.scale = scale;
    }
    public Memory(Register base, Constant constant) {
        this.base = base;
        this.constant = constant;
    }
    public Memory(Register index, int scale, Constant constant) {
        this.index = index;
        this.scale = scale;
        this.constant = constant;
    }
    public Memory(Constant constant) {
        this.constant = constant;
    }
    public Memory(Register base, Register index, int scale, Constant constant) {
        this.base = base;
        this.index = index;
        this.scale = scale;
        this.constant = constant;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
