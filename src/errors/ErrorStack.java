import java.util.*;

public class ErrorStack {
  public List<CError> errors = new ArrayList<CError>();

  public void wrap(int line, int column, String text) {
    CError error = new CError(line, column, text);
    this.errors.add(error);
  }

  public void wrap(int line, int column) {
    CError error = new CError(line, column);
    this.errors.add(error);
  }

  public void wrap(String text) {
    for (CError error : this.errors) {
      if (error.getText() == null) {
        error.setText(text);
        return;
      }
    }
  }

  public void unwrap() {
    for (CError error : this.errors) {
      error.print();
    }
  }

  public boolean hasErrors() {
    if (this.errors.size() > 0) {
      return true;
    }

    return false;
  }
}
