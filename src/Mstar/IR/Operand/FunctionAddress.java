package Mstar.IR.Operand;

import Mstar.IR.Function;
import Mstar.IR.IIRVisitor;

public class FunctionAddress extends Constant{
    public Function function;

    public FunctionAddress(Function function) {
        this.function = function;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
