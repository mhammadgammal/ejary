import 'package:ejary/core/theme/app_color.dart';
import 'package:ejary/core/utils/extensions/string_extensions.dart';
import 'package:ejary/core/utils/localization/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AlarmsScreenHeader extends StatelessWidget {
  const AlarmsScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 45.0.w, end: 70.0.w),
      child: Row(
        children: [
          Text(
            AppStrings.alarms.tr(context),
            style: GoogleFonts.tajawal(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          // DropdownButton(items: , onChanged: onChanged)
        ],
      ),
    );
  }
}