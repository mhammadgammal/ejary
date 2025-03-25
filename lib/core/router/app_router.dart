import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/sign_in/screen/sign_in_screen.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;

Map<String, Widget Function(BuildContext)> routes = {
  RouteKeys.signIn: (_) => SignInScreen(),
};
