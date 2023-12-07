import java_cup.runtime.*;
import java.io.*;

public class Driver {
  static public void main(String argv[]) {
    ErrorStack errorStack = new ErrorStack();

    try {
      Scanner scanner = new Lexer(new FileReader("main.jo"));
      Parser parser = new Parser(scanner);
      parser.parse();

      if (errorStack.hasErrors()) {
        System.out.println("Erros encontrados:");
        errorStack.unwrap();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
