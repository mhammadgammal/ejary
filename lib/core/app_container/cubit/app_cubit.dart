import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:ejary/features/alarms/navigator/alarms_navigation.dart';
import 'package:ejary/features/home/navigator/home_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  int selectedIndex = 0;

  List navigationKeys = [homeNavigatorKey, alarmsNavigationKey];

  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<(String, String, String)> appBarActions = [
    (AppStrings.homePage, AppIcons.homeIc, AppIcons.homeFilledIc),
    (AppStrings.addProperty, AppIcons.plus, AppIcons.plus),
    (AppStrings.alarms, AppIcons.bellIc, AppIcons.bellFilledIc),
  ];

  final searchController = TextEditingController();

  void changeTabIndex(int i) {
    selectedIndex = i;

    emit(TabIndexChangedState());
  }
}
