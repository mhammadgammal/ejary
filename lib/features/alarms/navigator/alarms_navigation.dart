import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/alarms/alarms_screen.dart';
import 'package:flutter/material.dart';

class AlarmsNavigation extends StatefulWidget {
  const AlarmsNavigation({super.key});

  @override
  State<AlarmsNavigation> createState() => _AlarmsNavigationState();
}

final alarmsNavigationKey = GlobalKey<NavigatorState>();

class _AlarmsNavigationState extends State<AlarmsNavigation> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: alarmsNavigationKey,
      onGenerateRoute:
          (settings) => MaterialPageRoute(
            builder: (context) {
              if (settings.name == RouteKeys.alarmDetails) {
                return Scaffold(
                  body: Center(child: Text(RouteKeys.alarmDetails)),
                );
              } else {
                return AlarmsScreen();
              }
            },
          ),
    );
  }
}
