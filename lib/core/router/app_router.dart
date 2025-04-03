import 'package:ejary/core/app_container/app_layout.dart';
import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/features/apartments/presentation/all_apartments/cubit/all_apartments_cubit.dart';
import 'package:ejary/features/properties/presentation/all_properties/cubit/all_properties_cubit.dart';
import 'package:ejary/features/sign_in/screen/cubit/sign_in_cubit.dart';
import 'package:ejary/features/sign_in/screen/sign_in_screen.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteKeys.signIn:
      (_) {
    'SignInScreen is a StatelessWidget that represents the sign-in screen of the application.'
        .logger();
    return BlocProvider(
        create: (context) => SignInCubit()..createUser(),
        child: SignInScreen(),
    );
  },
  RouteKeys.home:
      (_) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubit()),
          BlocProvider(
            create: (context) => AllPropertiesCubit()..getAllProperties(),
          ),
          BlocProvider(
            create: (context) => AllApartmentsCubit(),
          ),
        ],
        child: AppLayout(),
      ),
};
