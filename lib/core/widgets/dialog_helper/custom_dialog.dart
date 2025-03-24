import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ejary/core/theme/app_color.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget(
      {super.key,
      required this.title,
      required this.content,
      required this.actionButtons,
      required this.icon});

  final String title;
  final String content;
  final List<Widget> actionButtons;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black,
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppColors.white,
            fontSize: 30.sp,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        content,
        style: Theme.of(context)
            .textTheme
            .displaySmall
            ?.copyWith(color: AppColors.white),
      ),
      actions: actionButtons,
      icon: icon,
    );
  }
}
