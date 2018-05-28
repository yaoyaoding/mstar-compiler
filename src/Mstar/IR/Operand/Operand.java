package Mstar.IR.Operand;

import Mstar.IR.IIRVisitor;

import java.util.HashMap;
import java.util.LinkedList;

public abstract class Operand {
    public abstract void accept(IIRVisitor visitor);
}
