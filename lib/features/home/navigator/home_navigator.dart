import 'dart:developer';

import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/image_picker/cubit/image_picker_cubit.dart';
import 'package:ejary/features/apartments/data/model/apartment_model.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/add_edit_apartment_screen.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/cubit/add_edit_apartment_cubit.dart';
import 'package:ejary/features/apartments/presentation/add_edit_apartment/widgets/cubit/attach_file_cubit.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/all_apartments_screen.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/cubit/all_apartments_cubit.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:ejary/features/properties/data/model/property_model.dart';
import 'package:ejary/features/properties/presentation/add_edit_property/add_edit_property_screen.dart';
import 'package:ejary/features/properties/presentation/add_edit_property/cubit/add_edit_property_cubit.dart';
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
              var propertyName = args['property_name'];
              var propertyDistrict = args['property_district'];
              var apartments = args['apartments'];
              // set data method
              var cubit = AllApartmentsCubit.get(context);
              cubit.setSelectedProperty(
                propertyId,
                propertyName,
                propertyDistrict,
              );
              cubit.getAllApartments(apartments);

              return AllApartmentsScreen();
            } else if (settings.name == RouteKeys.addEditApartment) {
              var args = settings.arguments as Map<String, dynamic>;
              var propertyId = args['property_id'];
              var propertyName = args['property_name'];
              var propertyDistrict = args['property_district'];
              var apartment = args['apartment'] as ApartmentModel?;
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (_) =>
                            AddEditApartmentCubit()
                              ..selectedPropertyId = propertyId
                              ..selectedPropertyName = propertyName
                              ..selectedPropertyDistrict = propertyDistrict
                              // ..rentedApartmentModel = apartment
                              ..isEditMode = apartment != null
                              ..loadApartmentData(apartment),
                  ),
                  BlocProvider(
                    create:
                        (_) =>
                            ImagePickerCubit()
                              ..imagePath = apartment?.picturePath ?? '',
                  ),
                  BlocProvider(
                    create: (_) {
                      return AttachFileCubit()
                        ..filePath = apartment?.contractPicturePath ?? ''
                        ..fileName =
                            apartment?.contractPicturePath.split('\\').last ??
                            '';
                    },
                  ),
                ],
                child: AddEditApartmentScreen(),
              );
            } else if (settings.name == RouteKeys.addProperty) {
              var args = settings.arguments as Map<String, dynamic>;
              var property = args['property'] as PropertyModel;
              log(
                'HomeNavigator: RouteKeys.addProperty: property: ${property.id}',
              );
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (_) =>
                            AddEditPropertyCubit()..loadPropertyData(property),
                  ),
                  BlocProvider(
                    create:
                        (_) =>
                            ImagePickerCubit()
                              ..imagePath = property.picturePath,
                  ),
                  BlocProvider(
                    create:
                        (_) =>
                            AttachFileCubit()
                              ..fileName =
                                  property.picturePath.split('\\').last,
                  ),
                ],
                child: AddEditPropertyScreen(),
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
