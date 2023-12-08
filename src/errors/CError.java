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
    String info = "Linha: " + (this.line + 1) + ", " + "Coluna: " + this.column;

    if (text == null) {
      error = "Erro desconhecido!";
    } else {
      error = this.text;
    }

    String mark = "\u001B[31m" + "  -> %s | ";
    System.out.printf(mark + "%s \n", info, error + "\u001B[0m");
  }
}
