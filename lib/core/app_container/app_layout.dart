import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/widgets/app_bar/ejary_app_bar.dart';
import 'package:ejary/features/alarms/alarms_screen.dart';
import 'package:ejary/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: EjaryAppBar(),
          body: IndexedStack(
            index: cubit.selectedIndex,
            children: [
              HomeScreen(),
              AlarmsScreen(),
              AlarmsScreen(),
              AlarmsScreen(),
            ],
          ),
        );
      },
    );
  }
}
