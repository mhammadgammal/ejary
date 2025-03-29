import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/all_apartments_screen.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/cubit/all_apartments_cubit.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            if (settings.name == RouteKeys.allApartments) {
              var args = settings.arguments as Map<String, dynamic>;
              var propertyId = args['property_id'];
              return BlocProvider(
                lazy: false,
                create:
                    (context) =>
                        AllApartmentsCubit()
                          ..selectedPropertyId = propertyId
                          ..selectedPropertyNumber = 2
                          ..selectedPropertyDistrict = "حي المملكه",
                child: AllApartmentsScreen(),
              );
            }
            return const HomeScreen();
          },
        );
      },
    );
  }
}
