import 'package:flutter/material.dart' show BuildContext, Navigator;

abstract class AppNavigator {
  static Future navigateTo(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? arguments,
  }) async => Navigator.pushNamed(context, routeName, arguments: arguments);

  static Future navigateAndFinishAll(
    BuildContext context,
    String route, {
    Map<String, dynamic>? arguments,
  }) async => Navigator.of(
    context,
  ).pushNamedAndRemoveUntil(route, (route) => false, arguments: arguments);
}
