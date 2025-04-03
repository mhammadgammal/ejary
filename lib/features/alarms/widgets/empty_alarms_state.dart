import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/widgets/base_empty_state.dart';
import 'package:flutter/material.dart';

class EmptyAlarmsState extends StatelessWidget {
  const EmptyAlarmsState({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseEmptyState(
      thumbnailIconPath: AppIcons.bellSlash,
      title: 'no_alarms_yet',
      showButton: false,
      buttonText: '',
      onPressed: () {},
    );
  }
}
