# JOLANG

Simples e minimalista linguagem de programação e compilador feito em **Java** com as bibliotecas **JFLEX** e **JCUP**. Projeto final A3 da UC Teoria da Computação e Compiladores da Unisociesc.

## Estrutura

Segue abaixo a estrutura de pastas e arquivos do projeto:

* **build**: contém as classes java compiladas;
* **lib**: contém as bibliotecas jflex e jcup .jar;
* **scripts**: contém os scripts .bat para a construção, compilação e execução;
* **src**: contém o código-fonte do compilador;
* **.gitignore**: arquivo que contém o caminho de arquivos e pastas a serem ignorados pelo GitHub;
* **main.jo**: arquivo que contém o código da linguagem de programação a ser compilada;
* **Makefile**: arquivo make para a execução prática dos scripts;
* **README.md**: arquivo contendo informações do projeto.

## Dependências

* Java JRE e JDK Oracle ou OpenJDK **(Obrigatório)**;
* Make (Opcional)

[Oracle JRE](https://www.java.com/pt-BR/)

[Oracle JDK](https://www.oracle.com/br/java/technologies/downloads/)

[OpenJDK](https://openjdk.org/)

### Windows

```powershell
choco install make
```

### MacOS

```zsh
brew install make
```

### Linux

```bash
sudo apt install make
```

## Executando

Para executar basta executar os scripts da pasta scripts na seguinte ordem:

1. build.bat
2. compile.bat
3. run.bat

Ou utilizando a ferramenta make:

```terminal
make build && make run
```
