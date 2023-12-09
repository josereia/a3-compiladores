public interface IFactory {
  public IIntegerN createInteger(int value);

  public IUnaryOp createUnaryOp(int code, IExpression opr);

  public IBinaryOp createBinaryOp(int code, IExpression firstOpr, IExpression secondOpr);

  public IPrint createPrint(String string, IExpression expr, IIDent ident);

  public IIDent createVar(String string, Integer intv, IExpression expr);
}
