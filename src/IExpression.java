public interface IExpression {
  int accept(IVisitor visitor);
}
