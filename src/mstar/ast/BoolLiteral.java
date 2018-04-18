package mstar.ast;

public class BoolLiteral extends Expression{
    public boolean value;

    public BoolLiteral(boolean value) {
        this.value = value;
    }
    public BoolLiteral(String strValue) {
        this.value = strValue.equals("true");
    }
}
