import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/di/di.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/localization/app_localization.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomFilledButtonWithArrowIcon extends StatelessWidget {
  const CustomFilledButtonWithArrowIcon({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.titleColor,
    this.disabled = false,
    this.fillColor,
    this.fontSize = 16.0,
    this.fontWeight,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final String title;
  final Color? titleColor;
  final void Function() onPressed;
  final bool disabled;
  final Color? fillColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      height: height,
      width: width,
      padding: padding,
      fontSize: fontSize,
      fontWeight: fontWeight,
      margin: margin,
      disabled: disabled,
      fillColor: fillColor,
      title: title,
      titleColor: titleColor ?? AppColors.background50,
      onPressed: onPressed,
      icon: SvgPicture.asset(
        sl<AppLanguage>().appLocal.languageCode == 'ar'
            ? AppIcons.arrowLeftCircle
            : AppIcons.arrowRightCircle,
        colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        width: 24.0.w,
        height: 24.0.h,
      ),
    );
  }
}
