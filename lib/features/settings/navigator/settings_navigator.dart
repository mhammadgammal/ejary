import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/settings/settings_screen.dart';
import 'package:ejary/features/sign_in/screen/cubit/sign_in_cubit.dart';
import 'package:ejary/features/sign_in/screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final settingsNavigationKey = GlobalKey<NavigatorState>();

class SettingsNavigator extends StatelessWidget {
  const SettingsNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: settingsNavigationKey,
      onGenerateRoute: (settings) {
        if (settings.name == RouteKeys.signIn) {
          return MaterialPageRoute(
            builder:
                (context) => BlocProvider(
                  create: (_) => SignInCubit(),
                  child: SignInScreen(),
                ),
          );
        }
        return MaterialPageRoute(builder: (context) => SettingsScreen());
      },
    );
  }
}
