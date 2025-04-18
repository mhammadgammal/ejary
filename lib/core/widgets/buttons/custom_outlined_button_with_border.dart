import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButtonWithBorder extends StatelessWidget {
  const CustomOutlinedButtonWithBorder({
    super.key,
    required this.onPressed,
    required this.title,
    this.width,
    this.height,
    this.titleColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.borderColor,
    this.borderWidth = 2.0,
    this.icon,
  });

  final void Function() onPressed;
  final double? width;
  final double? height;
  final String title;
  final Color? titleColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? borderColor;
  final double borderWidth;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.appRadius.r),
            ),
          ),
          side: WidgetStatePropertyAll(
            BorderSide(
              color: borderColor ?? AppColors.primary100,
              width: borderWidth,
            ),
          ),
        ),
        label: Text(
          title,
          style: GoogleFonts.cairo(
            fontSize: fontSize.sp,
            fontWeight: fontWeight,
            color: titleColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        iconAlignment: IconAlignment.end,
        icon: icon,
      ),
    );
  }
}
