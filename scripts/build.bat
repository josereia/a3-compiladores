java -jar ./lib/java-cup-11b.jar -destdir ./build -parser Parser -symbols Sym ./src/parser.cup

java -jar ./lib/jflex-full-1.9.1.jar -d ./build ./src/lexer.flex
