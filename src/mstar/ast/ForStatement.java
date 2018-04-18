package mstar.ast;

import java.util.List;

public class ForStatement extends Statement {
    public Statement initStatement = null;
    public Expression condition = null;
    public Statement updateStatement = null;
}
