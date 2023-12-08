java -DFile.Encoding=UTF-8 -jar ./lib/java-cup-11b.jar -destdir ./build -parser Parser -symbols Sym ./src/parser.cup

java -DFile.Encoding=UTF-8 -jar ./lib/jflex-full-1.9.1.jar --encoding utf-8 -d ./build ./src/lexer.flex
