import 'package:ejary/core/assets/app_icons.dart';
import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/widgets/buttons/filled_buttons/custom_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseEmptyState extends StatelessWidget {
  final String thumbnailIconPath;
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  const BaseEmptyState({
    super.key,
    required this.thumbnailIconPath,
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120.0.h),
      child: Column(
        spacing: 30.0.h,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            width: 162.5.w,
            height: 150.0.h,
            thumbnailIconPath,
            colorFilter: ColorFilter.mode(AppColors.gray50, BlendMode.srcIn),
          ),
          Text(
            title.tr(context),
            style: GoogleFonts.tajawal(
              color: AppColors.gray50,
              fontSize: 32.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomFilledButton(
            width: 248.w,
            height: 48.h,
            title: buttonText.tr(context),
            fillColor: AppColors.secondary,
            icon: SvgPicture.asset(
              AppIcons.plus,
              colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
            iconAlignment: IconAlignment.start,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
