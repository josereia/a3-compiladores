public interface IIDent {
  public String getString();

  public Integer getInt();

  public IExpression getExpr();

  Object accept(IVisitor visitor);
}
