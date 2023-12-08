import java_cup.runtime.*;
import java.io.FileReader;

public class Driver {
  static public void main(String argv[]) {
    ErrorStack errorStack = new ErrorStack();

    try {
      Scanner scanner = new Lexer(new FileReader("main.jo"), errorStack);
      Parser parser = new Parser(scanner);
      parser.parse();

      if (errorStack.hasErrors()) {
        System.out.println("\u001B[1;31m" + "\nPilha de erros:" + "\u001B[0m");
        errorStack.unwrap();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
