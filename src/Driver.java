import java_cup.runtime.*;
import java.io.*;

public class Driver {
  static public void main(String argv[]) {
    try {
      Scanner scanner = new Lexer(new FileReader("main.jo"));
      Parser parser = new Parser(scanner);
      parser.parse();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
