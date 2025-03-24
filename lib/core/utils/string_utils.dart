import 'dart:math';

abstract class StringUtils {
  static String getRandomString() {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();
    return List.generate(20, (index) => chars[random.nextInt(chars.length)]).join();
  }
}