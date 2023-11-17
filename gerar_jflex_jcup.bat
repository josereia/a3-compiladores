java -jar jflex-full-1.9.1.jar lexico.jflex
pause
java -jar java-cup-11b.jar -parser AnalisadorSintatico -symbols Sym sintatico.cup 
pause

