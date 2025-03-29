import 'package:ejary/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key,
    this.width,
    this.height,
    required this.title,
    this.titleColor,
    this.icon,
    required this.onPressed,
    this.disabled = false,
    this.fillColor,
    this.fontSize = 16,
    this.padding,
    this.margin,
    this.fontWeight,
    this.radius = 8.0,
    this.iconAlignment,
  });

  final double? width;
  final double? height;
  final String title;
  final Color? titleColor;
  final Widget? icon;
  final void Function() onPressed;
  final bool disabled;
  final Color? fillColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double radius;
  final IconAlignment? iconAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      padding: padding,
      margin: margin,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            disabled ? AppColors.gray50 : fillColor ?? AppColors.primary100,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius.r),
            ),
          ),
        ),
        label: Text(
          title,
          style: GoogleFonts.cairo(
            color: titleColor ?? Colors.white,
            fontSize: fontSize.sp,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
        ),
        icon: icon,
        iconAlignment: iconAlignment ?? IconAlignment.end,
      ),
    );
  }
}
