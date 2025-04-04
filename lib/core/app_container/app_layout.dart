import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/widgets/app_bar/ejary_app_bar.dart';
import 'package:ejary/features/alarms/navigator/alarms_navigation.dart';
import 'package:ejary/features/home/navigator/home_navigator.dart';
import 'package:ejary/features/properties/presentation/add_edit_property/add_edit_property_screen.dart';
import 'package:ejary/features/settings/navigator/settings_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: EjaryAppBar(),
          body: Column(
            children: [
              SizedBox(height: 30.0.h),
              Expanded(child: _switchScreen(index: cubit.selectedIndex)),
            ],
          ),
        );
      },
    );
  }

  Widget _switchScreen({required int index}) {
    switch (index) {
      case 0:
        return HomeNavigator();
      case 1:
        return const AddEditPropertyScreen();
      case 2:
        return const AlarmsNavigation();
      case 3:
        return const SettingsNavigator();
      default:
        return Placeholder();
    }
  }
}
