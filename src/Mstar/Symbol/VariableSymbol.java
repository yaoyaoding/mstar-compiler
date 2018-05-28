package Mstar.Symbol;

import Mstar.AST.TokenLocation;
import Mstar.IR.Operand.Memory;
import Mstar.IR.Operand.VirtualRegister;

public class VariableSymbol {
    public String name;         //  Symbol name
    public VariableType type;   //  type of variable
    public TokenLocation location;

    public boolean isClassField;
    public VirtualRegister virtualRegister;

//    public VariableSymbol() {}
    public VariableSymbol(String name, VariableType type, TokenLocation location, boolean isClassField) {
        this.name = name;
        this.type = type;
        this.location = location;
        this.isClassField = isClassField;
    }
}
