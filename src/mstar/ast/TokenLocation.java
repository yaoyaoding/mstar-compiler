package mstar.ast;

public class TokenLocation {
    public final int row;
    public final int column;

    public TokenLocation(int row, int column) {
        this.row = row;
        this.column = column;
    }

    @Override
    public String toString() {
        return "row " + row + " column " + column;
    }
}
