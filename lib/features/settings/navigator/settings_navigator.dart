import 'package:ejary/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

final settingsNavigationKey = GlobalKey<NavigatorState>();

class SettingsNavigator extends StatelessWidget {
  const SettingsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: settingsNavigationKey,
      onGenerateRoute:
          (settings) =>
              MaterialPageRoute(builder: (context) => SettingsScreen()),
    );
  }
}
