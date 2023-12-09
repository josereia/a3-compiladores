public interface IPrint {
  public String getString();

  public IExpression getExpr();

  public IIDent getIdent();

  void accept(IVisitor visitor);
}
