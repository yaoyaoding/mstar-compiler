package Mstar.IR;

import Mstar.IR.Operand.StaticData;

import java.util.LinkedList;

public class IRProgram {
    public LinkedList<Function> functions;
    public LinkedList<StaticData> staticData;
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
