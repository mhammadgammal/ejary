import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator;

abstract class AppNavigator {
  static Future navigateTo(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? arguments,
  }) async {
    'navigateTo: $routeName'.logger();
    return Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static Future navigateAndFinishAll(
    BuildContext context,
    String route, {
    Map<String, dynamic>? arguments,
  }) async => Navigator.of(
    context,
  ).pushNamedAndRemoveUntil(route, (_) => false, arguments: arguments);
}
