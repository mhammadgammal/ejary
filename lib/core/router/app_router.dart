import 'package:ejary/core/app_container/app_layout.dart';
import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/router/route_keys.dart';
import 'package:ejary/features/sign_in/screen/cubit/sign_in_cubit.dart';
import 'package:ejary/features/sign_in/screen/sign_in_screen.dart';
import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';

Map<String, Widget Function(BuildContext)> routes = {
  RouteKeys.signIn:
      (_) => BlocProvider(
        create: (context) => SignInCubit()..createUser(),
        child: SignInScreen(),
      ),
  RouteKeys.home: (_) =>
      BlocProvider(
        create: (context) => AppCubit(),
        child: AppLayout(),
      ),
};
