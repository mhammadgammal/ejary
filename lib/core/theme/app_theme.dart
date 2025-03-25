import 'package:flutter/material.dart';

import 'app_color.dart';

abstract class AppTheme {
  static double appRadius = 0.0;

  static final lightTheme = ThemeData();

  static TextStyle getTextFormFieldTextStyle({Color? textFieldTextColor}) =>
      TextStyle(color: textFieldTextColor ?? (AppColors.black));

  static InputDecoration getTextFieldDecoration(
    context, {
    String? hintLabel,
    Widget? icon,
    IconButton? suffixIcon,
    Color? hintColor,
    Color? iconColor,
  }) => InputDecoration(
    // labelText: widget.fieldLabel,
    labelStyle: getTextFormFieldTextStyle(),
    hintText: hintLabel,
    hintStyle: TextStyle(
      color: hintColor ?? Theme.of(context).textTheme.bodyMedium!.color,
    ),
    prefixIcon: icon,
    suffixIcon: suffixIcon,
    prefixIconColor: iconColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.appRadius),
      borderSide: BorderSide(color: AppColors.gray50, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.appRadius),
      borderSide: BorderSide(color: AppColors.gray50, width: 1.5),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.appRadius),
      borderSide: BorderSide(color: AppColors.gray50, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppTheme.appRadius),
      borderSide: BorderSide(
        color: AppColors.gray50,
        style: BorderStyle.solid,
        width: 3.0,
      ),
    ),
  );
}
