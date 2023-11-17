import java_cup.runtime.*;
import java.io.*;

class Driver {
	 static public void main(String argv[])
	  {	
		 System.out.println("Entre com a formula:\n");  
		try 
		{
			InputStreamReader entrada =  new InputStreamReader(System.in);
			AnalisadorSintatico  p = new AnalisadorSintatico(new Lexer(entrada));
			Object result = p.parse().value;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	  }
	}



