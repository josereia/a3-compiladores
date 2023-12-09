public interface IVisitor {
  public int visitInteger(IIntegerN integer);

  public int visitUnaryOp(IUnaryOp op);

  public int visitBinaryOp(IBinaryOp op);

  public void visitPrint(IPrint print);

  public Object visitIdent(IIDent ident);
}
