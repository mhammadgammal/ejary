import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.controller,
    required this.inputType,
    this.fieldLabel,
    this.hintLabel,
    required this.validate,
    this.icon,
    this.isEnabled = true,
    this.obSecure = false,
    this.inputAction,
    this.suffixIcon,
    this.initialValue,
    this.maxLines,
    this.minLines,
    this.hintColor,
    this.iconColor,
    this.onChanged,
    this.cursorColor,
    this.focusNode,
    this.onSubmit,
    this.maxLength,
    this.fillColor = AppColors.background100,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final String? fieldLabel;
  final String? hintLabel;
  final Widget? icon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final bool obSecure;
  final IconButton? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool isEnabled;
  final String? initialValue;
  final Color? hintColor;
  final Color? iconColor;
  final Color? cursorColor;
  final int? maxLength;
  final Color fillColor;
  final void Function(String?)? onSubmit;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.gray50,
          selectionColor: AppColors.gray50,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.inputType,
        style: _getTextFormFieldTextStyle(),
        decoration: _getTextFieldDecoration(
          context,
          hintLabel: widget.hintLabel,
          hintColor: widget.hintColor,
          icon: widget.icon,
          iconColor: widget.iconColor,
          suffixIcon: widget.suffixIcon,
          fillColor: widget.fillColor,
        ),
        textInputAction: widget.inputAction,
        focusNode: widget.focusNode,
        minLines: widget.minLines ?? 1,
        maxLines: widget.obSecure ? 1 : widget.maxLines,
        cursorColor: widget.cursorColor ?? AppColors.gray50,
        initialValue: widget.initialValue,
        enabled: widget.isEnabled,
        maxLength: widget.maxLength,
        obscureText: widget.obSecure,
        onChanged: widget.onChanged,
        validator: widget.validate,
        onFieldSubmitted: widget.onSubmit,
      ),
    );
  }

  static TextStyle _getTextFormFieldTextStyle({Color? textFieldTextColor}) =>
      TextStyle(color: textFieldTextColor ?? (AppColors.black));

  InputDecoration _getTextFieldDecoration(
    context, {
    String? hintLabel,
    Widget? icon,
    IconButton? suffixIcon,
    Color? hintColor,
    Color? iconColor,
    required Color fillColor,
  }) => InputDecoration(
    // labelText: widget.fieldLabel,
    labelStyle: _getTextFormFieldTextStyle(),
    hintText: hintLabel,
    hintStyle: TextStyle(
      color: hintColor ?? Theme.of(context).textTheme.bodyMedium!.color,
    ),
    prefixIcon: icon,
    suffixIcon: suffixIcon,
    prefixIconColor: iconColor,
    fillColor: fillColor,
    filled: true,
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
