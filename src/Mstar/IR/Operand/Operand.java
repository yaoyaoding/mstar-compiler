package Mstar.IR.Operand;

import Mstar.IR.IIRVisitor;

public abstract class Operand {
    public abstract void accept(IIRVisitor visitor);
}
