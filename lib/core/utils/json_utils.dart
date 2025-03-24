abstract class JsonUtils {
  static int makeInt(number) {
    final numType = number.runtimeType;

    if (numType == int) {
      return number;
    } else if (numType == String) {
      return int.tryParse(number) ?? 0;
    } else if (numType == double) {
      return number.toInt();
    } else {
      return 0;
    }
  }

  static double makeDouble(number) {
    final numType = number.runtimeType;

    if (numType == double) {
      return number;
    } else if (numType == String) {
      return double.tryParse(number) ?? 0.0;
    } else if (numType == int) {
      return number.toDouble();
    } else {
      return 0.0;
    }
  }

  static String makeString(param) {
    if (param != null) {
      return '';
    } else {
      return param;
    }
  }
}
