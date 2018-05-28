package Mstar.IR.Operand;

import Mstar.Config;
import Mstar.IR.IIRVisitor;

public class StaticData extends Constant {
    public String hint;
    public int bytes;
    public String init;

    public StaticData(String hint, int bytes) {
        this.hint = hint;
        this.bytes = bytes;
        this.init = null;
    }
    public StaticData(String hint, String init) {
        this.hint = hint;
        this.bytes = init.length() + 1 + Config.REGISTER_WIDTH;
        this.init = init;
    }

    @Override
    public void accept(IIRVisitor visitor) {
        visitor.visit(this);
    }
}
