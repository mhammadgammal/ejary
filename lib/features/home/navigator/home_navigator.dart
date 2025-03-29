import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/add_edit_apartment_screen.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/all_apartments_screen.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/cubit/all_apartments_cubit.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
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
            'navigator name: ${settings.name}'.logger();
            if (settings.name == RouteKeys.allApartments) {
              var args = settings.arguments as Map<String, dynamic>;
              var propertyId = args['property_id'];
              var propertyNumber = args['property_number'];
              var propertyDistrict = args['property_district'];
              return BlocProvider(
                lazy: false,
                create:
                    (context) =>
                AllApartmentsCubit()
                  ..selectedPropertyId = propertyId
                  ..selectedPropertyNumber = propertyNumber
                  ..selectedPropertyDistrict = propertyDistrict
                  ..getAllApartments(),
                child: AllApartmentsScreen(),
              );
            } else if (settings.name == RouteKeys.addEditApartment) {
              var args = settings.arguments as Map<String, dynamic>;
              var propertyId = args['property_id'];
              var propertyNumber = args['property_number'];
              var propertyDistrict = args['property_district'];
              var apartment = args['apartment'];
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (_) =>
                    AddEditApartmentCubit()
                      ..selectedPropertyId = propertyId
                      ..selectedPropertyNumber = propertyNumber
                      ..selectedPropertyDistrict = propertyDistrict
                    // ..rentedApartmentModel = apartment
                      ..isEditMode = apartment != null
                      ..loadApartmentData(apartment),
                  ),
                  BlocProvider(create: (_) => ImagePickerCubit()),
                  BlocProvider(create: (_) => AttachFileCubit()),
                ],
                child: AddEditApartmentScreen(),
              );
            }
            return BlocProvider(
              create: (context) => ImagePickerCubit(),
              child: HomeScreen(),
            );
          },
        );
      },
    );
  }
}
