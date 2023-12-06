public class ValidateColumn {
  public boolean validate(String column, String table) {
    int indexOfDot = column.indexOf('.');

    if (column.equals("*")) {
      return true;
    }

    if (indexOfDot != -1) {
      String result = column.substring(0, indexOfDot);
      if (result.equals(table)) {
        return true;
      }
    }

    return false;
  }
}
