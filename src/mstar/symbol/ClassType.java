package mstar.symbol;

public class ClassType extends VariableType {
    public String name;
    public ClassSymbol symbol;

    public ClassType() {}
    public ClassType(String name, ClassSymbol symbol) {
        this.name = name;
        this.symbol = symbol;
    }

    @Override
    public boolean match(VariableType other) {
        if(other instanceof ClassType) {
            String otherName = ((ClassType) other).name;
            if((otherName.equals("null") && name.equals("string")) || (otherName.equals("string") && name.equals("null")))
                return false;
            else
                return ((ClassType) other).name.equals("null") || ((ClassType) other).name.equals(name);
        } else
            return false;
    }
}
