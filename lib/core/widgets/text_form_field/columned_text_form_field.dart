import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/widgets/text_form_field/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColumnedTextFormField extends StatelessWidget {
  const ColumnedTextFormField({
    super.key,
    required this.title,
    required this.controller,
    required this.inputType,
    this.enabled = true,
    this.titleColor,
    this.validate,
    this.hint,
    this.suffixIcon,
    this.icon,
    this.maxLines = 1,
    this.hintColor,
    this.isPassword = false,
    this.onSubmit,
    this.onChanged,
  });

  final String title;
  final Color? titleColor;
  final String? hint;
  final Color? hintColor;
  final bool enabled;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?)? validate;
  final IconButton? suffixIcon;
  final Widget? icon;
  final int maxLines;
  final bool isPassword;
  final void Function(String?)? onSubmit;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
        ),
        AppTextFormField(
          controller: controller,
          hintLabel: hint,
          inputType: inputType,
          isEnabled: enabled,
          validate: validate,
          icon: icon,
          suffixIcon: suffixIcon,
          maxLines: maxLines,
          obSecure: isPassword,
          hintColor: hintColor ?? AppColors.gray100,
          onSubmit: onSubmit,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
