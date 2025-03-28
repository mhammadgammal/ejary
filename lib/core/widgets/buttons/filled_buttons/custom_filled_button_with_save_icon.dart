import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilledButtonWithSaveIcon extends StatelessWidget {
  const CustomFilledButtonWithSaveIcon({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.disabled = false,
    this.fillColor,
    required this.fontSize,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final String title;
  final void Function() onPressed;
  final bool disabled;
  final Color? fillColor;
  final double fontSize;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      height: height,
      width: width,
      padding: padding,
      fontSize: fontSize,
      margin: margin,
      disabled: disabled,
      fillColor: fillColor,
      title: title,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        AppIcons.floppyDisk,
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
      ),
    );
  }
}
