package Mstar.Symbol;

public abstract class VariableType {

    public abstract boolean match(VariableType other);
    public abstract int getBytes();
}

