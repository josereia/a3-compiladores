public class Visitor implements IVisitor {
  @Override
  public int visitInteger(IIntegerN integer) {
    return integer.getValue();
  }

  @Override
  public int visitUnaryOp(IUnaryOp op) {
    return 0;
  }

  @Override
  public int visitBinaryOp(IBinaryOp op) {
    IExpression firstOpr = op.getFirstOpr();
    IExpression secondOpr = op.getSecondOpr();

    int result = 0;

    int v1 = 0;
    int v2 = 0;

    if (firstOpr != null) {
      int v = firstOpr.accept(this);
      v1 = v;
    }

    if (secondOpr != null) {
      int v = secondOpr.accept(this);
      v2 = v;
    }

    switch (op.getCode()) {
      case 5:
        result += v2 * v1;
        break;
      case 6:
        result += v2 / v1;
        break;
      case 3:
        result += v2 + v1;
        break;
      case 4:
        result += v2 - v1;
        break;
      default:
        break;
    }

    return result;
  }

  @Override
  public void visitPrint(IPrint print) {
    String string = print.getString();
    IExpression expr = print.getExpr();
    IIDent ident = print.getIdent();

    if (string != null) {
      System.out.println(string);
    }

    if (expr != null) {
      int v = expr.accept(this);
      System.out.println(v);
    }

    if (ident!= null) {
      Object v = ident.accept(this);
      System.out.println(v);
    }
  }

  @Override
  public Object visitIdent(IIDent ident) {
    String string = ident.getString();
    Integer intv = ident.getInt();
    IExpression expr = ident.getExpr();

    if (string != null) {
      return string;
    }

    if (expr != null) {
      int v = expr.accept(this);
      return v;
    }

    if (intv != null) {
      return intv;
    }

    return null;
  }
}
