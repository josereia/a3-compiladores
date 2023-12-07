public class CError {
  public int line;
  public int column;
  public String text;

  public CError(int line, int column, String text) {
    this.line = line;
    this.column = column;
    this.text = text;
  }

  public CError(int line, int column) {
    this.line = line;
    this.column = column;
  }

  public CError(String text) {
    this.text = text;
  }

  // getters and setters
  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

  public void print() {
    String error = text;
    String info = System.out.printf("Linha: %i e Coluna: %i", this.line, this.column).toString();

    if (text == null) {
      error = "Erro desconhecido!";
    } else {
      error = this.text;
    }

    System.out.printf("%s %s", error, info);
  }
}
