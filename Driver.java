import java_cup.runtime.*;
import java.io.*;

class Driver {
	static public void main(String argv[]) {
		try {
			FileReader entrada = new FileReader("code.txt");
			Parser p = new Parser(new Lexer(entrada));
			Object result = p.parse().value;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
