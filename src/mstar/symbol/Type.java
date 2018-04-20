package mstar.symbol;

public abstract class Type {
    enum Kind {
        NULL, VOID, FUNCTION, CLASS, INT, BOOL
    };
    Kind kind;
}
