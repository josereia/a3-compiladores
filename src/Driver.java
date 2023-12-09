import java_cup.runtime.*;
import java.io.FileReader;

public class Driver {
  static public void main(String argv[]) {
    IFactory factory = new Factory();
    ErrorStack errorStack = new ErrorStack();

    try {
      Scanner scanner = new Lexer(new FileReader("main.jo"), errorStack);
      Parser parser = new Parser(scanner, factory);

      Object obj = parser.parse().value;
      if (obj != null) {
        IVisitor visitor = new Visitor();

        if (obj instanceof IExpression) {
          IExpression expr = (IExpression) obj;
          expr.accept(visitor);
        } else if (obj instanceof IPrint) {
          IPrint print = (IPrint) obj;
          print.accept(visitor);
        } else if (obj instanceof IIDent) {
          IIDent ident = (IIDent) obj;
          ident.accept(visitor);
        }
      }

      if (errorStack.hasErrors()) {
        int length = errorStack.errors.size();
        String message = length <= 1 ? " erro encontrado:" : " erros encontrados:";

        System.out.println("\u001B[1;31m" + "\nPilha de erros" + "\u001B[0m");
        System.out.println("\u001B[31m" + length + message + "\u001B[0m");
        errorStack.unwrap();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
