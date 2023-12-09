class IntegerN implements IIntegerN {
  public int value;

  public IntegerN(int value) {
    this.value = value;
  }

  @Override
  public int getValue() {
    return this.value;
  }

  @Override
  public int accept(IVisitor visitor) {
    return visitor.visitInteger(this);
  }
}

class UnaryOp implements IUnaryOp {
  public int code;
  public IExpression opr;

  public UnaryOp(int code, IExpression opr) {
    this.code = code;
    this.opr = opr;
  }

  @Override
  public int getCode() {
    return this.code;
  }

  @Override
  public IExpression getOpr() {
    return this.opr;
  }

  @Override
  public int accept(IVisitor visitor) {
    return visitor.visitUnaryOp(this);
  }
}

class BinaryOp implements IBinaryOp {
  public int code;
  public IExpression firstOpr;
  public IExpression secondOpr;

  public BinaryOp(int code, IExpression firstOpr, IExpression secondOpr) {
    this.code = code;
    this.firstOpr = firstOpr;
    this.secondOpr = secondOpr;
  }

  @Override
  public int getCode() {
    return this.code;
  }

  @Override
  public IExpression getFirstOpr() {
    return this.firstOpr;
  }

  @Override
  public IExpression getSecondOpr() {
    return this.secondOpr;
  }

  @Override
  public int accept(IVisitor visitor) {
    return visitor.visitBinaryOp(this);
  }
}

class Ident implements IIDent {
  public String string;
  public Integer intv;
  public IExpression expr;

  public Ident(String string, Integer intv, IExpression expr) {
    this.string = string;
    this.intv = intv;
    this.expr = expr;
  }

  @Override
  public String getString() {
    return string;
  }

  @Override
  public Integer getInt() {
    return intv;
  }

  @Override
  public IExpression getExpr() {
    return expr;
  }

  @Override
  public Object accept(IVisitor visitor) {
    return visitor.visitIdent(this);
  }
}

class Print implements IPrint {
  public String string;
  public IExpression expr;
  public IIDent ident;

  public Print(String string, IExpression expr, IIDent ident) {
    this.string = string;
    this.expr = expr;
    this.ident = ident;
  }

  @Override
  public String getString() {
    return string;
  }

  @Override
  public IExpression getExpr() {
    return expr;
  }

  @Override
  public IIDent getIdent() {
    return ident;
  }

  @Override
  public void accept(IVisitor visitor) {
    visitor.visitPrint(this);
  }

}

public class Factory implements IFactory {
  public IIntegerN createInteger(int value) {
    IIntegerN integer = new IntegerN(value);
    return integer;
  }

  public IUnaryOp createUnaryOp(int code, IExpression opr) {
    IUnaryOp op = new UnaryOp(code, opr);
    return op;
  }

  public IBinaryOp createBinaryOp(int code, IExpression firstOpr, IExpression secondOpr) {
    IBinaryOp op = new BinaryOp(code, firstOpr, secondOpr);
    return op;
  }

  @Override
  public IPrint createPrint(String string, IExpression expr, IIDent ident) {
    IPrint print = new Print(string, expr, ident);
    return print;
  }

  @Override
  public IIDent createVar(String string, Integer intv, IExpression expr) {
    IIDent ident = new Ident(string, intv, expr);
    return ident;
  }
}
