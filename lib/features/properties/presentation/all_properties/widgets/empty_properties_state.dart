import 'package:ejary/core/app_container/cubit/app_cubit.dart';
import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/widgets/base_empty_state.dart';
import 'package:flutter/material.dart';

class EmptyPropertiesState extends StatelessWidget {
  const EmptyPropertiesState({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      thumbnailIconPath: AppIcons.homeModernIc,
      title: 'No properties currently..add it from here',
      buttonText: 'add_new_property',
      onPressed: () {
        AppCubit.get(context).changeTabIndex(1);
      },
    );
  }
}
