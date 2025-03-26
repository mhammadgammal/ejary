import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

final homeNavigatorKey = GlobalKey<NavigatorState>();

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: homeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            if (settings.name == RouteKeys.propertyDetails) {
              return const SizedBox();
            }
            return const HomeScreen();
          },
        );
      },
    );
  }
}
