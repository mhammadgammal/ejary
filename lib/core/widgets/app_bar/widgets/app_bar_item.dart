import 'package:ejary/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarItem extends StatelessWidget {
  const AppBarItem({
    super.key,
    required this.onPressed,
    required this.title,
    required this.iconPath,
    required this.selectedIconPath,
    required this.isSelected,
  });

  final void Function() onPressed;
  final String title;
  final String iconPath;
  final String selectedIconPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        title,
        style: GoogleFonts.tajawal(
          fontSize: 24.0.sp,
          fontWeight: FontWeight.w700,
          color: isSelected ? AppColors.secondary : AppColors.background50,
        ),
      ),
      icon: SvgPicture.asset(
        isSelected ? selectedIconPath : iconPath,
        width: 32.0.w,
        height: 32.0.h,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.secondary : AppColors.background50,
          BlendMode.srcIn,
        ),
      ),
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
    );
  }
}
