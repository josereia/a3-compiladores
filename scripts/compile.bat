javac -cp ./src/utils; ./src/utils/Colors.java
move ".\src\utils\*.class" ".\build\"

javac -cp ./src/errors; ./src/errors/CError.java
javac -cp ./src/errors; ./src/errors/ErrorStack.java
move ".\src\errors\*.class" ".\build\"


javac -cp ./build;./lib/java-cup-11b-runtime.jar ./build/Sym.java

javac -cp ./build;./lib/java-cup-11b-runtime.jar ./build/Lexer.java

javac -cp ./build;./lib/java-cup-11b-runtime.jar ./build/Parser.java

javac -cp ./build;./lib/java-cup-11b-runtime.jar ./src/Driver.java

move ".\src\Driver.class" ".\build\"